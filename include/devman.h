#pragma once
#include "devdrv.h"
#include "vfs.h"
#define NR_REQS 32
#define IS_BLKDEV(dev) (dev&0x100==0)
#define IS_CHRDEV(dev) (dev&0x100!=0)
int init_devfs();
int reg_device(device *dev);
int reg_driver(driver *drv);
int dispose_device(int dev);
int dispose_driver(driver *drv);

device *get_dev(int devi);
driver *get_drv(int drvi);

int load_driver(char *path);

int sys_find_dev(char *name);
int call_drv_func(int drv_n,int func_n,driver_args* args);
int sys_operate_dev(char *name,int func,driver_args* args);
//发送一个操作设备的申请
int make_request(driver_args* args);
void wait_on_req(int reqi);
void clear_req(int reqi);
//取出一个申请并且执行
int do_req();


long open_dev(struct index_node * inode,struct file * filp);
long close_dev(struct index_node * inode,struct file * filp);
long read_dev(struct file * filp,char * buf,unsigned long count,long * position);
long write_dev(struct file * filp,char * buf,unsigned long count,long * position);
long ioctl_dev(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg);
extern struct dir_entry* ddev,*dmnt;