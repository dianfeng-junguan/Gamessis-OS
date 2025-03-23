#include "drvload.h"
#include "driverman.h"
#include "memman.h"
#include "vfs.h"
#include "memory.h"
#include "com/mem.h"
#define DRVLOAD_RETV_FAILED_OPEN 1
mod_obj* mods;

int init_drvload()
{
    mods = (mod_obj*)kmalloc(sizeof(mod_obj) * MAX_MODULES, NO_ALIGN);
    memset(mods, 0, sizeof(mod_obj) * MAX_MODULES);
    if (!mods) {
        return -1;
    }
}

mod_obj* get_spare_module()
{
    for (int i = 0; i < MAX_MODULES; i++) {
        if (!mods[i].flags) {
            mods[i].flags = 1;
            mods[i].img   = (exec_image*)kmalloc(sizeof(exec_image), NO_ALIGN);
            mods[i].fp    = NULL;
            if (!mods[i].img) {
                return NULL;
            }
            return mods + i;
        }
    }
    return NULL;
}
int free_module(mod_obj* obj)
{
    int i = obj - mods;
    if (i < 0 || i >= MAX_MODULES) {
        return -1;
    }
    mods[i].flags = 0;
    kfree(obj->img);
    obj->img = NULL;
    if (mods[i].fp) {
        kclose(obj->fp);
        obj->fp = NULL;
    }
    return 0;
}

int unload_module(mod_obj* obj)
{
    int i = obj - mods;
    if (i < 0 || i >= MAX_MODULES) {
        return -1;
    }
    mods[i].flags = 0;
    binload_release_image(obj->img);
    kfree(obj->img);
    obj->img = NULL;
    if (mods[i].fp) {
        kclose(obj->fp);
        obj->fp = NULL;
    }
    return 0;
}
mod_obj* load_module(char* path)
{
    /*
    注册模块。
    加载文件，这里应该和具体的可执行文件格式无关。
    执行重定位。
    寻找三个函数。
    注册驱动。
    */
    int vret = 0;
    //注册模块
    mod_obj* spare = get_spare_module();
    if (!spare) {
        return -1;
    }
    if (binload_get_header_info(path, spare->img) < 0) {
        vret = -1;
        goto relsmod;
    }
    size_t             memsz     = spare->img->memsz;
    unsigned long long load_addr = kmalloc(memsz, NO_ALIGN);
    if (!load_addr) {
        vret = -1;
        goto relsmod;
    }
    //加载文件
    if (binload_load_obj(path, load_addr, spare->img) < 0) {
        vret = -1;
        goto relsimg;
    }
    unsigned long long modinit, modexit, modioctl;
    if ((modinit = binload_get_symbol(spare->img, "mod_init")) == 0 ||
        (modexit = binload_get_symbol(spare->img, "mod_exit")) == 0 ||
        (modioctl = binload_get_symbol(spare->img, "mod_ioctl")) == 0) {
        vret = -1;
        goto relsimg;
    }
    // NOLINTNEXTLINE
    spare->drv_id = register_driver(modinit, modexit, modioctl);
    if (spare->drv_id < 0) {
        vret = -1;
        goto relsimg;
    }

    return spare;   //成功
relsimg:
    //这个函数会自己把占用的km释放掉，不用再kfree
    binload_release_image(spare->img);
relsmod:
    free_module(spare);
    return NULL;
}