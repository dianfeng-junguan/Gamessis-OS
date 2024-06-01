#include "disk.h"
#include "devdrv.h"
#include "int.h"
#include "devman.h"
#include "syscall.h"
#define NULL ((void*)0)
disk_req disk_reqs[MAX_DISK_REQUEST_COUNT];
disk_req *running_req=NULL;
static int head=0,tail=0;
int disk_drvi=0,disk_devi=0;
device dev_disk={
       .type=DEV_TYPE_BLKDEV,
       .flag=DEV_FLAG_USED
};
driver drv_disk={
        .read=read_disk,
        .write=write_disk
};
int init_disk()
{
    disk_devi= reg_device(&dev_disk);
    disk_drvi= reg_driver(&drv_disk);
    dev_disk.drv=&drv_disk;
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
    }else if(running_req->func==DISKREQ_WRITE)
    {
        for(int i=0;i<running_req->sec_n*256;i++)
            outw(port,*p++);
    }
    running_req->stat=REQ_STAT_DONE;
    //set_proc_stat(running_req->pid,READY);
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
        return 2;
    if(head==tail)return 1;//检查是否为空
    running_req=&disk_reqs[head];
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
    running_req->stat=REQ_STAT_WORKING;
    //set_proc_stat(running_req->pid,SUSPENDED);
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
        break;
    default:
        break;
    }
    if(r==-1)return -1;
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
    char drv=slave_disk?0b00010000:0;
    char lba_hi=(lba>>24)&0xf|drv|0b11100000;
    outb(port+6,lba_hi);
    outb(port+7,DISK_CMD_READ);
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
    char drv=slave_disk?0b00010000:0;
    unsigned char lba_hi=(lba>>24)&0xf|drv|0b11100000;
    outb(port+6,lba_hi);
    outb(port+7,DISK_CMD_WRITE);
    while (1)
    {
        byte t=inb(0x1f7);
        //logf("stat:%x",t);
        byte err=t&1;
        if(err!=0)
        {
            //printf("ERR writing disk\n");
            return -1;
        }
        t&=0x88;
        if(t==0x8)break;
    }
    
    return 0;
}
int read_disk(driver_args* args)
{
    return read_disk_asm(args->lba,args->sec_c,args->dist_addr);
}
int write_disk(driver_args* args)
{
    return write_disk_asm(args->lba,args->sec_c,args->src_addr);
}