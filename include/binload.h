/**
    @file 提供加载可执行文件的抽象接口。
*/
#pragma once
#include "vfs.h"
typedef unsigned long long binload_addr_t ;
#define MAX_SYMBOLS 8192
/**
    @brief 符号表以一个全0的结构体结尾。
 */
typedef struct{
    char* name;//符号名称
    binload_addr_t addr;//符号vma
    int flags;//符号的一些附加信息
} exec_symbol;
#define BIN_TYPE_UNKNOWN 0
#define BIN_TYPE_ELF 1
#define BIN_TYPE_PE 2
typedef struct{
    int type;//可执行文件格式
    binload_addr_t entry;//入口地址vma
    binload_addr_t base;//加载基址/文件头vma
    size_t memsz;//占用内存大小
    exec_symbol* symtab;//符号表vma
    size_t nr_sym;//符号数量
    binload_addr_t info;//其他信息
} exec_image;//程序映像
typedef struct{
    int flags;//一些附加信息
    /**
    @brief 加载映像文件。
    @param type 映像文件种类，有EXEC(0),DYN(1),OBJ(2)三种。
    @return 返回加载的状态码。同时，image中的内容会被修改，反映函数的实际执行结果。
     */
    int (*load_bin)(struct file* fp,int type,exec_image* image);
    /**
    @brief 获取映像文件信息。
    @param fp 映像文件句柄
    @param image 记录映像文件信息数据结构体指针，会被修改
    @return 返回状态码。
    */
    int (*get_header_info)(struct file* fp,exec_image* image);
} exec_format;//一种具体的可执行文件格式对应的操作方法
#define MAX_BIN_FORMATS 16

#define BIN_TYPE_EXEC 0
#define BIN_TYPE_DYN 1
#define BIN_TYPE_OBJ 2
int init_binload();

exec_format* register_binary(int (*load_bin)(struct file*,int,exec_image*),int (*get_header_info)(struct file* ,exec_image* ));
int unregister_binary(exec_format* format);

///@brief 获取映像文件初步的信息。
int binload_get_header_info(char* path, exec_image* img);
///@brief 加载obj类型映像文件。img必须已经被binload_get_header_info使用过。
int binload_load_obj(char* path,binload_addr_t addr,exec_image* img);
///@brief 获取符号地址。img必须已经被binload_load_obj使用过。
binload_addr_t binload_get_symbol(exec_image* img,char* name);
///@brief 释放img指向的映像文件占用的内存。
int binload_release_image(exec_image* img);
/**
    @brief 获取内核符号地址。
 */
binload_addr_t get_kernel_symbol(char* name);

extern exec_format* formats;

