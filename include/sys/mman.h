#pragma once
#include <sys/types.h>
#define PROT_READ 1
#define PROT_WRITE 2
#define PROT_EXEC 4
#define MAP_FIXED 1
#define MAP_PRIVATE 2
#define MAP_SHARED 4
#define MAP_ANNONYMOUS 8
//立即分配内存。
#define MAP_IMMEDIATE 16
//映射为内核特权级
#define MAP_KERNEL 32
#define MAP_FAILED -1
/// @brief 建立文件内容到内存空间的映射。
/// @param addr 映射内存地址，为0则可以任意地址。
/// @param len
/// @param prot 映射的内存读写等属性
/// @param flags 映射操作的一些设置，包括是否必须在指定位置映射
/// @param fildes
/// @param off
/// @return 返回映射内存地址的起始.
void* mmap(void* addr, size_t len, int prot, int flags, int fildes, off_t off);
