#pragma once
#ifdef DEBUG
#include <stddef.h>
#else
#include "sys/types.h"
#include "memory.h"
#include "com/mem.h"
#include "com/str.h"
#endif
#define MAX_VOLUMES  100   //最大卷数
#define VOLUME_FLAG_BOOTABLE  0x0001  //可引导分区
#define VOLUME_FLAG_HIDDEN    0x0002  //隐藏分区
#define VOLUME_FLAG_READONLY  0x0004  //只读分区
#define VOLUME_FLAG_SYSTEM    0x0008  //系统分区
#define VOLUME_FLAG_REMOVABLE 0x0010  //可移动分区
#define VOLUME_FLAG_NO_DRIVE  0x0020  //无盘符分区
#define VOLUME_FLAG_CDROM     0x0040  //光盘分区
#define VOLUME_FLAG_RAMDISK   0x0080  //RAM磁盘分区
#define VOLUME_FLAG_SWAP      0x0100  //交换分区
#define VOLUME_FLAG_NTFS      0x0200  //NTFS文件系统分区
#define VOLUME_FLAG_FAT32     0x0400  //FAT32文件系统分区
#define VOLUME_FLAG_FAT16     0x0800  //FAT16文件系统分区
#define VOLUME_FLAG_EXTENDED  0x1000  //扩展分区
#define VOLUME_FLAG_UNKNOWN   0x8000  //未知分区类型

typedef struct
{
    char   name[16];   //卷名
    int    flags;
    int    fstype;
    int    dev;           //所属硬盘设备号
    size_t sector_size;   //单个扇区大小
    size_t start_sector;
    size_t end_sector;
    size_t size;   //分区大小，单位为扇区数
} volume;


// 管理结构体
typedef struct {
  volume *volumes;
  size_t capacity;
  size_t count;
} volume_manager;

// 函数声明
int init_volumeman();
void cleanup_volumeman();
int register_volume(volume *vol);
int unregister_volume(char *name);
volume *get_volume_by_name( char *name);

#ifdef DEBUG
// 封装或宏定义C库函数
#define KMALLOC(size) malloc(size)
#define KFREE(ptr) free(ptr)
#define KPRINTF(fmt, ...) do{printf("[%s]:%s() at line %d:",__FILE__,__FUNCTION__,__LINE__);fprintf(stderr, fmt, ##__VA_ARGS__);}while(0);
#define STRCMP(str1, str2) strcmp(str1, str2)
#else
#define KMALLOC(size) kmalloc( size,0)
#define KFREE(ptr) kfree(ptr)
#define KPRINTF(fmt, ...) do{comprintf("[%s]:%s() at line %d:",__FILE__,__FUNCTION__,__LINE__);comprintf(fmt, ##__VA_ARGS__);}while(0);
#define STRCMP(str1, str2) strcmpk(str1, str2)
#endif