#include "disk.h"
#include "devdrv.h"
#include "int.h"
#include "devman.h"
#include "syscall.h"
#include "virfs.h"
#include <log.h>
#include <blk_dev.h>
#define NULL ((void*)0)
struct request* r_running=NULL;
struct file_operations hd_fops={
    //TODO:hd规范化
};
disk_req disk_reqs[MAX_DISK_REQUEST_COUNT];
disk_req *running_req=NULL;
driver_args *running_devman_req=NULL;
static int head=0,tail=0;
struct blk_dev bd_hd={
    .do_request=hd_do_req
};
int dev_hd=-1,last_chk_res=0;
int init_disk()
{
    if((dev_hd= reg_blkdev(&bd_hd))<0)
        return -1;
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    // hd_iterate();
    return 0;
}

int disk_int_handler_c()
{
    if(r_running==NULL)
    {
        comprintf("err:null running dreq\n");
        return 1;//同步读写硬盘
    }
    short *p=r_running->buffer;
    int port=PORT_DISK_MAJOR;
    if(BLKDEV_MINOR(r_running->dev)==DISK_SLAVE_MAJOR||\
    BLKDEV_MINOR(r_running->dev)==DISK_SLAVE_SLAVE)
        port=PORT_DISK_SLAVE;
    if(r_running->cmd==BLKDEV_REQ_READ)
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<r_running->nr_sectors*256;i++)
        {
            *p++=inw(port);
        }
    }else if(r_running->cmd==BLKDEV_REQ_WRITE)
    {
        for(int i=0;i<r_running->nr_sectors*256;i++)
            outw(port,*p++);
    }else if(r_running->cmd==DISKREQ_CHECK)
    {
        char stat=inb(port+7);
        short dat=inw(port);
        if(1)
        {
            last_chk_res=DISK_CHK_OK;
        }else
        {
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            last_chk_res=DISK_CHK_ERR;
        }
    }else if(r_running->cmd==DISKREQ_RESET)
    {
        int stat=inb(port+7);
        printf("reset disk done.\nstat now:%x\n",stat);
    }
    
    r_running=NULL;
    end_request(dev_hd);
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
int read_disk(int disk, int lba, int secn, char *dest)
{
    request(disk,DISKREQ_READ,lba,secn,dest);
    int ret=read_disk_asm(lba,secn,dest);
//    chk_result(ret);
    if(running_req){

        running_req->stat=REQ_STAT_DONE;
        running_req->args->stat=REQ_STAT_EMPTY;
    }
    //set_proc_stat(running_req->pid,TASK_READY);
    running_req=NULL;
    return ret;
}
int write_disk(int disk, int lba, int secn, char *src)
{
    request(disk,DISKREQ_WRITE,lba,secn,src);
    int ret=write_disk_asm(lba,secn,src);
//    chk_result(ret);
    if(running_req){

        running_req->stat=REQ_STAT_DONE;
        running_req->args->stat=REQ_STAT_EMPTY;
    }
    running_req=NULL;
    return ret;
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
int hd_do_req(struct request* req)
{
    int diski=BLKDEV_MINOR(req->dev);
    // for(;disks[diski]!=args->dev;diski++);

    switch (req->cmd)
    {
    case BLKDEV_REQ_READ:
        async_read_disk(diski,req->sector,req->nr_sectors,req->buffer);
        break;
    case BLKDEV_REQ_WRITE:
        async_write_disk(diski,req->sector,req->nr_sectors,req->buffer);
        break;
    case DRVF_CHK:
        async_check_disk(diski);
        break;
    default:return -1;
    }
    return 0;
}