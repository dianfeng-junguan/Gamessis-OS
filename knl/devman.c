#include "devman.h"
#include "syscall.h"
#include "memory.h"
#include "str.h"
#include "typename.h"
#include "fcntl.h"
#include <disk.h>
#include <tty.h>
#include "proc.h"
#include "mem.h"
#include "framebuffer.h"
#include "log.h"
#include <blk_buf.h>

device devs[MAX_DEVICES]={0};
driver drvs[MAX_DRIVERS]={0};
driver_args reqs[NR_REQS];
device* dev_tree[]={NULL,NULL,NULL};

driverfunc dev_funcs[]={
    [OPERATIONS_HD]=NULL,//hd_do_req,
    [OPERATIONS_TTY]=NULL,//ioctl_tty,
    [OPERATIONS_KEYBOARD]=NULL,
    [OPERATIONS_MOUSE]=NULL
};
static int rhead=0,rtail=0;
static int dev_dfd=-1;
struct file_operations devfs_fops={
    .open=open_dev,.close=close_dev,.ioctl=ioctl_dev,.read=read_dev,.write=write_dev
};
struct dir_entry_operations dev_dir_dops={

};
static int devd_fd=-1;
void make_dentry(struct dir_entry* d,char* name,int namelen,struct dir_entry* parent,struct dir_entry_operations* dops){
    strcpy(d->name,name);
    d->name_length=namelen;
    //添加dentry的操作方法，这样能够查找设备
    d->dir_ops=dops;
    list_init(&d->subdirs_list);
    list_init(&d->child_node);
    d->child_node.data=d;
    d->parent=parent;
    list_add(&parent->subdirs_list,&d->child_node);
}
void make_inode(struct index_node* i,struct index_node_operations* iops,struct file_operations* fops,unsigned long attr,super_block* sb){
    i->f_ops=fops;
    i->attribute=attr;
    i->sb=sb;
    i->file_size=0;
    i->inode_ops=iops;
}
void make_devf(struct dir_entry* d,struct index_node* i,char* name,struct dir_entry* ddev,struct file_operations* fops){
    make_dentry(d,name, strlen(name),root_sb->root,&dev_dir_dops);
    d->dir_inode=i;
    make_inode(i,ddev->dir_inode->inode_ops,fops,FS_ATTR_DEVICE,root_sb);
    list_add(&ddev->subdirs_list,&d->child_node);//添加到/dev下
}
/*
 * 创建/dev文件夹，添加必要的设备文件。
 * 这个/dev文件夹的dentry和inode等数据由devman管理，根文件系统切换时，这个文件夹会跟着挂载到新文件系统的根目录下。
 * */
struct dir_entry* ddev=NULL,*dmnt,*dconsole,*dhd0,*dtty,*dramdisk;
struct file ftty;
int init_devfs()
{
    //创建dev文件夹
    ddev=(struct dir_entry*) kmalloc();
    struct index_node* idev=ddev+1;
    ddev->name=idev+1;
    make_dentry(ddev,"dev",3,root_sb->root,root_sb->root->dir_ops);
    ddev->dir_inode=idev;
    make_inode(idev,root_sb->root->dir_inode->inode_ops,root_sb->root->dir_inode->f_ops,FS_ATTR_DIR,root_sb);
    idev->private_index_info=ddev;

    //创建mnt文件夹
    dmnt=(struct dir_entry*) kmalloc();
    struct index_node* imnt=dmnt+1;
    dmnt->name=imnt+1;
    make_dentry(dmnt,"mnt",3,root_sb->root,root_sb->root->dir_ops);
    dmnt->dir_inode=imnt;
    make_inode(imnt,root_sb->root->dir_inode->inode_ops,root_sb->root->dir_inode->f_ops,FS_ATTR_DIR,root_sb);
    imnt->private_index_info=dmnt;


    //创建几个设备文件
    //console-framebuffer.c
    dconsole= (struct dir_entry *) kmalloc();
    struct index_node* iconsole=dconsole+1;
    dconsole->name=iconsole+1;
    make_devf(dconsole,iconsole,"console",ddev,&devfs_fops);
    //hd0-disk.c
    dhd0= (struct dir_entry *) kmalloc();
    struct index_node* ihd0=dhd0+1;
    dhd0->name=ihd0+1;
    make_devf(dhd0,ihd0,"hd0",ddev,&devfs_fops);
    //tty-tty.c
    dtty= (struct dir_entry *) kmalloc();
    struct index_node* itty=dtty+1;
    dtty->name=itty+1;
    make_devf(dtty,itty,"tty",ddev,&devfs_fops);
    //初始化一下
    tty_fops.open(itty,&ftty);

    //ramdisk- ramdisk.c
    dramdisk= (struct dir_entry *) kmalloc();
    struct index_node* iramdisk=dramdisk+1;
    dramdisk->name=iramdisk+1;
    make_devf(dramdisk,iramdisk,"ram",ddev,&devfs_fops);

}
//
long open_dev(struct index_node * inode,struct file * filp){
    //查看文件名
    char* name=filp->dentry->name;
    char* p=name+ strlen(name)-1;
    for(;*p!='/'&&p>=name;p--);
    if(p>=name)
        name=p+1;
    if(memcmp(name,"tty",3)==0){
        return init_tty(inode,filp);
    }else if(strcmp(name,"console")==0){
        return open_framebuffer(inode,filp);
    }
    return -1;
}
long close_dev(struct index_node * inode,struct file * filp){
    //查看文件名
    char* name=filp->dentry->name;
    char* p=name+ strlen(name)-1;
    for(;*p!='/'&&p>=name;p--);
    if(p>=name)
        name=p+1;
    if(memcmp(name,"tty",3)==0){
        return close_tty(inode,filp);
    }else if(strcmp(name,"console")==0){
        return close_framebuffer(inode,filp);
    }
    return -1;

}
long read_dev(struct file * filp,char * buf,unsigned long count,long * position){
    //判断是不是块设备文件
    struct index_node* i_dev=filp->dentry->dir_inode;
    if(IS_BLKDEV(i_dev->dev)){
        //这里需要调用缓冲区层的函数读取块设备
        return blkdev_read(i_dev->dev,*position,count,buf);
    }
    
    //查看文件名
    char* name=filp->dentry->name;
    char* p=name+ strlen(name)-1;
    for(;*p!='/'&&p>=name;p--);
    if(p>=name)
        name=p+1;
    if(memcmp(name,"tty",3)==0){
        return read_tty(filp,buf,count,position);
    }else if(strcmp(name,"console")==0){
        return read_framebuffer(filp,buf,count,position);
    }
    return -1;

}
long write_dev(struct file * filp,char * buf,unsigned long count,long * position){
    //判断是不是块设备文件
    struct index_node* idev=filp->dentry->dir_inode;
    if(IS_BLKDEV(idev->dev)){
        //这里需要调用缓冲区层的函数写块设备
        return blkdev_write(idev->dev,*position,count,buf);
    }

    //查看文件名
    char* name=filp->dentry->name;
    char* p=name+ strlen(name)-1;
    for(;*p!='/'&&p>=name;p--);
    if(p>=name)
        name=p+1;
    if(memcmp(name,"tty",3)==0){
        return write_tty(filp,buf,count,position);
    }else if(strcmp(name,"console")==0){
        return write_framebuffer(filp,buf,count,position);
    }
    return -1;

}
long ioctl_dev(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg){
    //判断是不是块设备文件
    struct index_node* idev=filp->dentry->dir_inode;
    if(IS_BLKDEV(idev->dev)){
        //这里需要调用缓冲区层的函数ioctl块设备
        return 1;
    }
    //查看文件名
    char* name=filp->dentry->name;
    char* p=name+ strlen(name)-1;
    for(;*p!='/'&&p>=name;p--);
    if(p>=name)
        name=p+1;
    if(memcmp(name,"tty",3)==0){
        return ioctl_tty(inode, filp, cmd, arg);
    }else if(strcmp(name,"console")==0){
        return ioctl_framebuffer(inode,filp,cmd,arg);
    }
    return -1;

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
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
    }
    if(i==NR_REQS)return -1;//满了
    reqs[i]=*args;//放入数组
    //插入具体设备的等待链表中
    device* dev=&devs[args->dev];
    if(!dev->waiting_reqs)//空的等待队列
        dev->waiting_reqs=&reqs[i];
    else{
        driver_args* p=dev->waiting_reqs;
        for(;p->next;p=p->next);
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
                // dev_funcs[p->operi](p->running_req);
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