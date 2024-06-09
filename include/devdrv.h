//
// Created by Oniar_Pie on 2024/4/30.
//

#ifndef GMS_KNL_DEVDRV_H
#define GMS_KNL_DEVDRV_H
#pragma once
#define DEV_FLAG_EMPTY 0
#define DRV_FLAG_EMPTY 0
#define DEV_FLAG_USED 1
#define DRV_FLAG_USED 1
#define DEV_FLAG_BUSY 2


#define DEV_TYPE_BLKDEV 1
#define DEV_TYPE_CHRDEV 2
#define DEV_STYPE_HD 1
#define MAX_DRIVERS 32
#define MAX_DEVICES 64

#define REQ_STAT_READY 1
#define REQ_STAT_DONE 2
#define REQ_STAT_WORKING 3
#define _ONLY_DATA_
#include "virfs.h"
typedef struct{
    int lba;
    int dist_addr;
    int src_addr;
    int count;
    int fno;
    union {
        int pos;
        int sec_n
    };
    union {
        int len;
        int sec_c;
    };
    int mode;
    char* path;
    vfs_dir_entry entry;
    int fid;
    int dev;//设备号
    char *dev_p;
    void* cwd;//entry
    char* dir_path;
    int cmd;//request cmd
    int stat;
}driver_args;
typedef int (*driverfunc)(driver_args*);
typedef struct{
    int flag;
    driverfunc open;
    driverfunc close;
    driverfunc read;
    driverfunc write;
    driverfunc check;
    driverfunc reserved;
    driverfunc inthandler;
    driverfunc find;
    driverfunc rm;
    driverfunc touch;
    driverfunc mkdir;
    driverfunc ls;
    driverfunc seek;
    driverfunc scr_up;
    driverfunc scr_down;
    driverfunc flush;
    //内存管理：驱动会对自己的内存空间有管理需求
    driverfunc malloc;
    driverfunc mfree;
    int *func_thunk;
}driver;
typedef struct
{
    int start_sec;
    int end_sec;
    int type;
}partition_t;

typedef struct{
    int lock;//锁
    int slave_dev;//从设备号
    int type;//设备大类
    int stype;//细化设备类别
    int flag;
    char name[36];
    int start_port;
    int port_c;
    partition_t par[4];//块设备专用-分区表
    
    void (*request_fn) ();	// 请求操作的函数指针。(处理请求的函数)
    struct driver_args *current_request;	// 当前正在执行的req
    driver *drv;
}device;

// // 块设备结构。
// struct blk_dev_struct
// {
//   void (*request_fn) (void);	// 请求操作的函数指针。(处理请求的函数)
//   struct request *current_request;	// 请求信息结构。
// };


#endif //GMS_KNL_DEVDRV_H
