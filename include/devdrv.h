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

#define DEV_TYPE_BLKDEV 1
#define DEV_TYPE_CHRDEV 2
#define MAX_DRIVERS 32
#define MAX_DEVICES 64
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
    char *dev_p;
    void* cwd;//entry
    char* dir_path;
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
typedef struct{
    int type;
    int flag;
    char name[36];
    int start_port;
    int port_c;
    driver *drv;
}device;
#endif //GMS_KNL_DEVDRV_H
