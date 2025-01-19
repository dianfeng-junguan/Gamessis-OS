#pragma once
#include "binload.h"
#include "vfs.h"
typedef struct{
    int flags;
    exec_image* img;
    int drv_id;
    struct file* fp;
} mod_obj;
#define MAX_MODULES 32
//接口函数，通过文件路径加载内核模块
mod_obj* load_module(char* path);
//卸载模块，会将模块内存一并释放。
int unload_module(mod_obj* obj);

//注册一个模块，返回一个模块号。错误则返回负数。
int register_obj(unsigned long long base,size_t size);

int unregister_obj(int obji);

mod_obj* get_spare_module();
//注销模块，不会变动模块内存。
int free_module(mod_obj* obj);
int init_drvload();