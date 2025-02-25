#pragma once
// #include "devdrv.h"
#include "vfs.h"
#define NR_REQS 32
#define IS_BLKDEV(dev) (dev & 0x10000 == 0)
#define IS_CHRDEV(dev) (dev & 0x10000 != 0)
#define REQ_STAT_EMPTY 0
#define REQ_STAT_READY 1
#define REQ_STAT_WORKING 2
#define REQ_STAT_DONE 3
#define REQ_STAT_ERR 4
#define MAX_DEVICES 128

#define DEV_STAT_AVAILABLE 0
#define DEV_STAT_BUSY 1

/**
    @brief 设备结构体
*/
typedef struct
{
    int   flag;
    int   stat;
    int   type;
    int   drv;
    int   link;
    char* name;
} device_t;
int                 init_devfs();
int                 init_devman();
struct super_block* devfs_read_superblock(volume* PDTE, void* buf);
/**
    @brief 注册设备
    @param name 设备名称
    @param type 设备类型
    @param drv 驱动程序号
    @param flag 设备标志
    @return 设备号
*/
int reg_device(char* name, int type, int drv, int flag);
int unreg_device(int dev);
// int reg_driver(driver *drv);
int dispose_device(int dev);
// int dispose_driver(driver *drv);

// device *get_dev(int devi);
// driver *get_drv(int drvi);

int load_driver(char* path);

int sys_find_dev(char* name);
// int call_drv_func(int drv_n,int func_n,driver_args* args);
// int sys_operate_dev(char *name,int func,driver_args* args);
//发送一个操作设备的申请
// int make_request(driver_args* args);
// void wait_on_req(int reqi);
void clear_req(int reqi);
//取出一个申请并且执行
int do_req();


long open_dev(struct index_node* inode, struct file* filp);
long close_dev(struct index_node* inode, struct file* filp);
long read_dev(struct file* filp, char* buf, unsigned long count, long* position);
long write_dev(struct file* filp, char* buf, unsigned long count, long* position);
long readdir_dev(struct file* filp, void* dirent, filldir_t filler);
long lseek_dev(struct file* filp, long offset, int whence);
/**
    @brief 面向用户(vfs层)的设备控制函数
*/
long ioctl_dev(struct index_node* inode, struct file* filp, unsigned long cmd, unsigned long arg);
/**
    @brief 面向内核的设备控制函数
*/
int dev_ioctl(int dev, int command, int block, unsigned long long arg);


/**
    @brief 注册设备，但是不创建设备文件，为了读取根文件系统需要提前注册这些设备。
*/
int reg_default_devices();
int make_default_devfiles();

extern struct dir_entry *ddev, *dmnt;