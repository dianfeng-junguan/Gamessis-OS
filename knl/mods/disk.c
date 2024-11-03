#include "disk.h"
#include "devdrv.h"
#include "int.h"
#include "devman.h"
#include "syscall.h"
#include "virfs.h"
#include <log.h>
#define NULL ((void*)0)
struct file_operations hd_fops={
    //TODO:hd规范化
};
disk_req disk_reqs[MAX_DISK_REQUEST_COUNT];
disk_req *running_req=NULL;
driver_args *running_devman_req=NULL;
static int head=0,tail=0;
int disk_drvi=0,disk_devi=0;
device dev_disk={
       .type=DEV_TYPE_BLKDEV,
       .flag=DEV_FLAG_USED
};
driver drv_disk={
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
    return 0;
}

int disk_int_handler_c()
{
    if(running_req==NULL)
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
    }
    short *p=running_req->buf;
    int port=PORT_DISK_MAJOR;
    if(running_req->disk==DISK_SLAVE_MAJOR||\
    running_req->disk==DISK_SLAVE_SLAVE)
        port=PORT_DISK_SLAVE;
    if(running_req->func==DISKREQ_READ)
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
        {
            *p++=inw(port);
        }
        running_req->result=DISK_CHK_OK;
    }else if(running_req->func==DISKREQ_WRITE)
    {
        for(int i=0;i<running_req->sec_n*256;i++)
            outw(port,*p++);
        running_req->result=DISK_CHK_OK;
    }else if(running_req->func==DISKREQ_CHECK)
    {
        char stat=inb(port+7);
        short dat=inw(port);
        if(1)
        {
            running_req->result=DISK_CHK_OK;
        }else
        {
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
    {
        int stat=inb(port+7);
        printf("reset disk done.\nstat now:%x\n",stat);
    }
    running_req->stat=REQ_STAT_DONE;
    running_req->args->stat=REQ_STAT_EMPTY;
    running_devman_req->stat=REQ_STAT_DONE;
    running_devman_req=NULL;
    //set_proc_stat(running_req->pid,TASK_READY);
    running_req=NULL;
    return 0;
}
int check_dreq_stat(int req_id)
{
    return disk_reqs[req_id].stat;
}
int request(int disk,int func,int lba,int secn,char *buf){
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
    {
        return -1;
    }
    disk_reqs[tail].disk=disk;
    disk_reqs[tail].func=func;
    disk_reqs[tail].lba=lba;
    disk_reqs[tail].sec_n=secn;
    disk_reqs[tail].stat=REQ_STAT_READY;
    disk_reqs[tail].buf=buf;
    int r=tail;
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
    return r;
}
int execute_request(){
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
    {
        running_req->time++;
        if(running_req->func!=DISKREQ_CHECK)
            return 2;
        if(running_req->time>MAX_DISK_CHKTIME)
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
            running_req->stat=REQ_STAT_DONE;
            running_req=NULL;
        }else
        {
            //未到时间继续等待
            return 2;
        }
    }
    if(head==tail)return 1;//检查是否为空
    running_req=&disk_reqs[head];
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
    running_req->stat=REQ_STAT_WORKING;
    //set_proc_stat(running_req->pid,TASK_SUSPENDED);
    int r=0;
    switch (running_req->func)
    {
    case DISKREQ_READ:
        r=async_read_disk(running_req->disk,\
        running_req->lba,running_req->sec_n,running_req->buf);
        break;
    case DISKREQ_WRITE:
        r=async_write_disk(running_req->disk,\
         running_req->lba,running_req->sec_n,running_req->buf);
        //write_disk(running_req->lba,running_req->sec_n,running_req->buf);
        break;
    case DISKREQ_CHECK:
        r=async_check_disk(running_req->disk);
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
    }
    if(r==-1)return -1;
    return 0;
}
int async_reset_disk(int disk)
{
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
    return 0;
}
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
    unsigned short port=PORT_DISK_MAJOR;
    int slave_disk=0;
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
        port=PORT_DISK_SLAVE;
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
        slave_disk=1;
    outb(port+2,sec_n);
    outb(port+3,lba&0xff);
    outb(port+4,(lba>>8)&0xff);
    outb(port+5,(lba>>16)&0xff);
    char drv=slave_disk?0x10:0;
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
    outb(port+6,lba_hi);
    outb(port+7,DISK_CMD_READ);

    // unsigned short stat=0;
    // while (1)
    // {
    //     byte t=inb(port+7);
    //     //logf("stat:%x",t);
    //     byte err=t&1;
    //     // if(err!=0)
    //     // {
    //     //     printf("ERR writing disk\n");
    //     //     return -1;
    //     // }
    //     t&=0x88;
    //     if(t==0x8)break;
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
}
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
    unsigned short port=PORT_DISK_MAJOR;
    int slave_disk=0;
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
        port=PORT_DISK_SLAVE;
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
        slave_disk=1;
    while (1)
    {
        byte t=inb(0x1f7);
        //logf("istat:%x",t);
        byte err=t&1;
        if(err!=0)
        {
            //printf("ERR iwriting disk\n");
            return -1;
        }
        t&=0x88;
        if(t==0x8)break;
    }
    outb(port+2,sec_n);
    outb(port+3,lba&0xff);
    outb(port+4,(lba>>8)&0xff);
    outb(port+5,(lba>>16)&0xff);
    char drv=slave_disk?0x10:0;
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
    outb(port+6,lba_hi);
    outb(port+7,DISK_CMD_WRITE);
    // while (1)
    // {
    //     byte t=inb(port+7);
    //     //logf("stat:%x",t);
    //     byte err=t&1;
    //     if(err!=0)
    //     {
    //         printf("ERR writing disk\n");
    //         return -1;
    //     }
    //     t&=0x88;
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
}
int read_disk(driver_args* args)
{
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
    
    running_req->stat=REQ_STAT_DONE;
    running_req->args->stat=REQ_STAT_EMPTY;
    //set_proc_stat(running_req->pid,TASK_READY);
    running_req=NULL;
    return ret;
}
int write_disk(driver_args* args)
{
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
    
    running_req->stat=REQ_STAT_DONE;
    running_req->args->stat=REQ_STAT_EMPTY;
    //set_proc_stat(running_req->pid,TASK_READY);
    running_req=NULL;
    return ret;
}
int chk_result(int r)
{
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
    if(disk_reqs[r].result==DISK_CHK_OK)
        return 1;
    comprintf("disk err\n");
    return 0;
}
int disk_existent(int disk)
{
    switch (disk)
    {
    case DISK_MAJOR_MAJOR:
        return sys_find_dev("hd0")!=-1;
        break;
    
    case DISK_MAJOR_SLAVE:
        return sys_find_dev("hd1")!=-1;
        break;
        
    case DISK_SLAVE_MAJOR:
        return sys_find_dev("hd2")!=-1;
        break;
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
    }
    return 0;
}
int hd_iterate()
{
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
    for(int i=0;i<1;i++)
    {
        int disk;
        switch (i)
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
        case 1:disk=DISK_MAJOR_SLAVE;break;
        case 2:disk=DISK_SLAVE_MAJOR;break;
        case 3:disk=DISK_SLAVE_SLAVE;break;
        default:
            return -1;
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
        {
            printf("disk %d checked.\n",i);
            //新硬盘
            device hd={
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
            };
            disks[i]=reg_device(&hd);
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
        {
            switch (i)
            {
            case 0:name="hd0";break;
            case 1:name="hd1";break;
            case 2:name="hd2";break;
            case 3:name="hd3";break;
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
            dispose_device(get_dev(devi));
        }

    }
}

int async_check_disk(int disk)
{
    unsigned short disknr=PORT_DISK_MAJOR;
    unsigned short chkcmd=0xe0;
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
        disknr=PORT_DISK_SLAVE;
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
        chkcmd=0xf0;
    outb(disknr+2,1);
    outb(disknr+3,0);
    outb(disknr+4,0);
    outb(disknr+5,0);
    outb(disknr+6,chkcmd);//主硬盘
    outb(disknr+7,DISK_CMD_CHECK);
    // unsigned short stat=0;
    // while(!(stat&0x40))
    // {
    //     stat=inb(disknr+7);
    //     // if(stat&1)
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
}

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
    int diski=0;
    for(;disks[diski]!=args->dev;diski++);
    switch (args->cmd)
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
        break;
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
        break;
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
        break;
    default:return -1;
    }
    args->stat=REQ_STAT_WORKING;
    running_devman_req=args;
    return 0;
}