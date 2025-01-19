#include "binload.h"
#include "memory.h"
#include "vfs.h"
#include "mem.h"
#include "str.h"
exec_format* formats;


int init_binload()
{
    if ((formats = kmalloc(0, sizeof(exec_format) * MAX_BIN_FORMATS)) == 0)
        return -1;
    memset(formats, 0, sizeof(exec_format) * MAX_BIN_FORMATS);
    return 0;
}
exec_format* register_binary(int (*load_bin)(struct file*, int, exec_image*),
                             int (*get_header_info)(struct file*, exec_image*))
{
    if (!load_bin) {
        return NULL;
    }
    for (int i = 0; i < MAX_BIN_FORMATS; i++) {
        if (formats[i].flags == 0) {
            formats[i].flags           = 1;
            formats[i].load_bin        = load_bin;
            formats[i].get_header_info = get_header_info;
            return formats + i;
        }
    }
    return NULL;
}
int unregister_binary(exec_format* format)
{
    int i = format - formats;
    if (i < 0 || i >= MAX_BIN_FORMATS) {
        return -1;
    }
    formats[i].flags           = 0;
    formats[i].load_bin        = NULL;
    formats[i].get_header_info = NULL;
    return 0;
}


int binload_get_header_info(char* path, exec_image* img)
{
    struct file fp;
    int         vret = -1;
    if (kopen(path, &fp) < 0) {
        return -1;
    }
    for (int i = 0; i < MAX_BIN_FORMATS; i++) {
        if (formats[i].get_header_info(&fp, img) == 0) {
            //能够解读，此时img里面已经填写了信息
            img->type = i;
            vret      = 0;
            break;
        }
    }
    kclose(&fp);
    return vret;
}
int binload_load_obj(char* path, binload_addr_t addr, exec_image* img)
{
    struct file fp;
    int         vret = 0;
    if (kopen(path, &fp) < 0) {
        return -1;
    }
    //填写必要的信息
    img->base = addr;
    if (formats[img->type].load_bin(&fp, BIN_TYPE_OBJ, img) < 0) {
        vret = -1;
    }
    kclose(&fp);
    return vret;
}
binload_addr_t binload_get_symbol(exec_image* img, char* name)
{
    //此时，img的符号表已经构建完毕，直接再符号表中寻找即可
    exec_symbol* symp = img->symtab;
    int          ctr  = 0;
    if (!symp) {
        return -1;   //符号表出问题了
    }
    while (ctr < img->nr_sym && ctr < MAX_SYMBOLS) {
        if (strncmpk(symp->name, name, 4096) == 0) {
            //找到了
            return symp->addr;
        }
        symp++;
        ctr++;
    }
    return 0;
}
int binload_release_image(exec_image* img)
{
    //释放
    kmfree((void*)img->base);
    return 0;
}

typedef struct
{
    unsigned long long addr;
    char               type;
    int                namelen;
} __attribute__((packed)) ksym;
binload_addr_t get_kernel_symbol(char* name)
{
    extern char _binary_bin_kallsyms_bin_start[] __attribute__((weak)),
        _binary_bin_kallsyms_bin_end[] __attribute__((weak));
    ksym *             sym = _binary_bin_kallsyms_bin_start, *bef = sym;
    unsigned long long func_belonged = sym->addr;   //所属函数
    while (sym < _binary_bin_kallsyms_bin_end && strncmpk(sym + 1, name, 4096) != 0) {
        bef           = sym;
        func_belonged = sym->addr;
        int namelen   = sym->namelen;
        sym += 1;
        sym = (unsigned long long)sym + namelen;
    }
    return sym->addr;
}