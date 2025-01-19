#pragma once
#include "binload.h"
//接口函数

///初始化elf加载模块
int elf_binload_init();
int elf_load_bin(struct file* fp,int type,exec_image* image);
int elf_get_header_info(struct file* fp,exec_image* image);
