#include "devman.h"
#include "syscall.h"
#include "memory.h"
#include "str.h"
#include "typename.h"
#include <disk.h>
#include <tty.h>
device devs[MAX_DEVICES]={0};
driver drvs[MAX_DRIVERS]={0};
driver_args reqs[NR_REQS];
device* dev_tree[]={NULL,NULL,NULL};

driverfunc dev_funcs[]={
    [OPERATIONS_HD]=hd_do_req,
    [OPERATIONS_TTY]=tty_do_req,
    [OPERATIONS_KEYBOARD]=NULL,
    [OPERATIONS_MOUSE]=NULL
};
static int rhead=0,rtail=0;
int init_drvdev_man()
{
}
int load_driver(char *path)
{
    
}

int reg_device(device* dev)
{
    //TODO:查重

    //放入数组
    int i=0;
    for(;i<MAX_DEVICES;i++)
    {
        if(devs[i].flag==DEV_FLAG_EMPTY)
        {
            devs[i]=*dev;
            devs[i].flag=DEV_FLAG_USED;
            break;
        }
    }
    if(i==MAX_DEVICES)
        return -1;
    //添加到链表
    device* p=NULL,*neo=&devs[i],**pp;
    switch (dev->type)
    {
    case DEV_TYPE_BLKDEV:
        p=dev_tree[DEVTREE_BLKDEVI];pp=&dev_tree[DEVTREE_BLKDEVI];
        break;
    
    case DEV_TYPE_CHRDEV:
        p=dev_tree[DEVTREE_CHRDEVI];pp=&dev_tree[DEVTREE_CHRDEVI];
        break;
        
    case DEV_TYPE_OTHERS:
        p=dev_tree[DEVTREE_OTHERDEVI];pp=&dev_tree[DEVTREE_OTHERDEVI];
        break;
    default:return -1;//不可能有其他情况
    }
    if(!p){
        *pp=neo;
        neo->prev=NULL;
    }
    else{
        for(;p->next;p=p->next);
        p->next=neo;
        neo->prev=p;
    }
    neo->next=NULL;
    //设置相应的请求函数
    switch (neo->stype)
    {
    case DEV_STYPE_HD:
        neo->operi=OPERATIONS_HD;
        break;
    
    case DEV_STYPE_MOUSE:
        neo->operi=OPERATIONS_MOUSE;
        break;
    case DEV_STYPE_KEYBOARD:
        neo->operi=OPERATIONS_KEYBOARD;
        break;
    case DEV_STYPE_TTY:
        neo->operi=OPERATIONS_TTY;
        break;
    default:
        break;
    }
    return i;
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
int dispose_device(int dev){
    if(devs[dev].flag!=DEV_FLAG_USED)return -1;
    device* p=&devs[dev];
    //从链表删除
    if(p->prev)p->prev->next=p->next;
    p->flag=DEV_FLAG_EMPTY;
    return 0;
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
    //在数组中寻找空项
    int i=0;
    for(;i<NR_REQS;i++)
    {
        if(reqs[i].stat=REQ_STAT_EMPTY)break;
    }
    if(i==NR_REQS)return -1;//满了
    reqs[i]=*args;//放入数组
    //插入具体设备的等待链表中
    device* dev=&devs[args->dev];
    if(!dev->waiting_reqs)//空的等待队列
        dev->waiting_reqs=&reqs[i];
    else{
        driver_args* p=dev->waiting_reqs;
        for(;p;p=p->next);
        p->next=&reqs[i];
        reqs[i].next=NULL;
    }

    return i;
}
//取出一个申请并且执行
int do_req()
{
    //查看每个设备的请求情况
    //块设备
    for(int i=0;i<3;i++)
    {
        device* p=dev_tree[i];
        for(;p;p=p->next)
        {
            //如果没有请求运行而且有请求要运行
            if(!p->running_req&&p->waiting_reqs)
            {
                p->running_req=p->waiting_reqs;
                p->waiting_reqs=p->waiting_reqs->next;//取出一个
                dev_funcs[p->operi](p->running_req);
            }
            //如果还在运行（DONE的状态不能直接覆盖，因为里面的运行结果可能还没被拿走）
        }
    }
    
    return 0;
}


void wait_on_req(int reqi)
{
    while(reqs[reqi].stat!=REQ_STAT_DONE);
}
void clear_req(int reqi)
{
    reqs[reqi].stat=REQ_STAT_EMPTY;
}