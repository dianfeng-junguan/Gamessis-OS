#include "devman.h"
#include "syscall.h"
#include "memory.h"
#include "str.h"
device devs[MAX_DEVICES]={0};
driver drvs[MAX_DRIVERS]={0};
driver_args reqs[NR_REQS];
static int rhead=0,rtail=0;
int init_drvdev_man()
{
    
}
int load_driver(char *path)
{
    
}

int reg_device(device *dev)
{
    for(int i=0;i<MAX_DEVICES;i++)
    {
        if(devs[i].flag==DEV_FLAG_EMPTY)
        {
            devs[i]=*dev;
            devs[i].flag=DEV_FLAG_USED;
            return i;
        }
    }
    return -1;
}
int reg_driver(driver *drv)
{
    for(int i=0;i<MAX_DRIVERS;i++)
    {
        if(drvs[i].flag==DRV_FLAG_EMPTY)
        {
            drvs[i]=*drv;
            drvs[i].flag=DRV_FLAG_USED;
            return i;
        }
    }
    return -1;
}

int sys_find_dev(char *name)
{
    for(int i=0;i<MAX_DEVICES;i++)
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
            return i;
    }
    return -1;
}

int sys_operate_dev(char *name,int func,driver_args* args)
{
    int i=0;
    for(;i<MAX_DEVICES;i++)
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
            break;
    }
    if(i==MAX_DEVICES)return -1;
    switch (func) {
        case DRVF_OPEN :return devs[i].drv->open(args);
        case DRVF_CLOSE:return devs[i].drv->close(args);
        case DRVF_READ :return devs[i].drv->read(args);
        case DRVF_WRITE:return devs[i].drv->write(args);
        case DRVF_CHK  :return devs[i].drv->check(args);
        case DRVF_RSVD :return devs[i].drv->reserved(args);
        case DRVF_INT  :return devs[i].drv->inthandler(args);
        case DRVF_FIND :return devs[i].drv->find(args);
        case DRVF_RM   :return devs[i].drv->rm(args);
        case DRVF_TOUCH:return devs[i].drv->touch(args);
        case DRVF_MKDIR:return devs[i].drv->mkdir(args);
        case DRVF_LS:return    devs[i].drv->ls(args);
    }
    return -1;
}
int call_drv_func(int drv_n,int func_n,driver_args *args)
{
    if(drvs[drv_n].flag==DRV_FLAG_EMPTY)return -1;
    /*driverfunc f=drvs[drv_n].func_thunk[func_n];
    return f(args);*/
    switch (func_n) {
        case DRVF_OPEN :return drvs[drv_n].open(args);
        case DRVF_CLOSE:return drvs[drv_n].close(args);
        case DRVF_READ :return drvs[drv_n].read(args);
        case DRVF_WRITE:return drvs[drv_n].write(args);
        case DRVF_CHK  :return drvs[drv_n].check(args);
        case DRVF_RSVD :return drvs[drv_n].reserved(args);
        case DRVF_INT  :return drvs[drv_n].inthandler(args);
        case DRVF_FIND :return drvs[drv_n].find(args);
        case DRVF_RM   :return drvs[drv_n].rm(args);
        case DRVF_TOUCH:return drvs[drv_n].touch(args);
        case DRVF_MKDIR:return drvs[drv_n].mkdir(args);
        case DRVF_LS:return drvs[drv_n].ls(args);
    }
    return -1;
}
int dispose_device(device *dev){

}
int dispose_driver(driver *drv){

}

device *get_dev(int devi)
{
    return &devs[devi];
}
driver *get_drv(int drvi)
{
    return &drvs[drvi];
}

//发送一个操作设备的申请
int make_request(driver_args* args)
{
    if(rhead==(rtail+1)%NR_REQS)return -1;//满了
    reqs[rtail]=*args;
    int r=rtail;
    rtail=(rtail+1)%NR_REQS;
    return r;
}
//取出一个申请并且执行
int do_req()
{
    if(rhead==rtail)return 0;
    driver_args* arg=&reqs[rhead];
    rhead=(rhead+1)%NR_REQS;
    return sys_operate_dev(devs[arg->dev].name,arg->cmd,arg);
}


void wait_on_req(int reqi)
{
    while(reqs[reqi].stat!=REQ_STAT_DONE);
}