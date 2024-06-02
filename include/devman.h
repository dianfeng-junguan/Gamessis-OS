#pragma once
#include "devdrv.h"
#define NR_REQS 32
int init_drvdev_man();
int reg_device(device *dev);
int reg_driver(driver *drv);
int dispose_device(device *dev);
int dispose_driver(driver *drv);

device *get_dev(int devi);
driver *get_drv(int drvi);

int load_driver(char *path);

int sys_find_dev(char *name);
int call_drv_func(int drv_n,int func_n,driver_args* args);
int sys_operate_dev(char *name,int func,driver_args* args);
//发送一个操作设备的申请
int make_request(driver_args* args);
//取出一个申请并且执行
int do_req();