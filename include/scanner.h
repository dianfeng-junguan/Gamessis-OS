/**
    @file scanner.h
    @author Oniar_Pie
    @date 12/10/2019
    @version 1.0
    @brief 一个用于硬盘分区扫描的驱动程序。
 */
#ifndef SCANNER_H
#define SCANNER_H

#ifdef DEBUG
#include <stdio.h>
#else
#include "vfs.h"
#endif

#include "volume.h"
typedef struct _volume_node{
    volume *vol;
    struct _volume_node* next;
} volume_node;
typedef struct{
    volume_node *head;
    volume_node *tail;
} volume_list;
//gpt表头
typedef struct{
    char signature[8];
    unsigned int revision;
    unsigned int header_size;
    unsigned int crc32;
    unsigned int reserved;
    unsigned long long current_lba;
    unsigned long long backup_lba;
    unsigned long long first_usable_lba;
    unsigned long long last_usable_lba;
    unsigned char disk_guid[16];
    unsigned long long part_entry_start_lba;
    unsigned int num_part_entries;
    unsigned int part_entry_size;
    unsigned int crc32_part_array;
} gpt_header;
#define MAX_TYPE_GUIDS 16
//gpt分区表项
typedef struct{
    char type_guid[16];
    char part_guid[16];
    unsigned long long first_lba;
    unsigned long long last_lba;
    unsigned long long flags;
    char part_name[72];
} gpt_part_entry;
/**
    @brief 扫描一块硬盘，并返回一个包含所有分区信息的链表，信息存储在volume结构体中。
    @return 一个包含所有分区信息的链表。
 */
volume_list *scan_disk(int dev);

/**
    @brief 释放一个包含所有分区信息的链表。
    @param list 一个包含所有分区信息的链表。
 */
int free_volume_list(volume_list *list);
/**
    @brief 将链表中的分区注册。
    @param list 一个包含所有分区信息的链表。
 */
int register_volume_list(volume_list *list);

/**
    @brief 将链表中的分区注销。
    @param list 一个包含所有分区信息的链表。
 */
int unregister_volume_list(volume_list *list);

int init_scanner();
#define GPT_TABLE_SECTOR_COUNT 32

#ifdef DEBUG
// 封装或宏定义C库函数
#define KMALLOC(size) malloc(size)
#define KFREE(ptr) free(ptr)
#define KPRINTF(fmt, ...) do{printf("[%s]:%s() at line %d:",__FILE__,__FUNCTION__,__LINE__);fprintf(stderr, fmt, ##__VA_ARGS__);}while(0);
#define STRCMP(str1, str2) strcmp(str1, str2)
#define STRNCPY(dst, src, len) strncpy(dst, src, len)
#define SNPRINTF(fmt, ...) snprintf(fmt, ##__VA_ARGS__)
#define STRLEN(str) strlen(str)
#else
#define KMALLOC(size) kmalloc( size,0)
#define KFREE(ptr) kfree(ptr)
#define KPRINTF(fmt, ...) comprintfk(KERN_INFO fmt, ##__VA_ARGS__)
#define STRNCPY(dst, src, len) strncpyk(dst, src, len)
#define STRCMP(str1, str2) strcmpk(str1, str2)
#define SNPRINTF(fmt, ...) snprintfk(fmt, ##__VA_ARGS__)
#define STRLEN(str) strnlenk(str, 1024)
#endif
#endif