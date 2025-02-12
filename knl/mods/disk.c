#include "disk.h"
#include "driverman.h"
#include "int.h"
#include "devman.h"
#include "syscall.h"
#include <log.h>
#define NULL ((void*)0)
struct request*        r_running = NULL;
struct file_operations hd_fops   = {
    // TODO:hd规范化
};
struct disk_ioctlarg
{
    int          diski;      //硬盘号
    unsigned int lba;        //起始扇区
    int          sec_n;      //读写扇区数
    char*        mem_addr;   //读写缓冲区地址
    //接下来部分传参不使用
    int status;
    int cmd;
} current_ioctlarg;
disk_req   disk_reqs[MAX_DISK_REQUEST_COUNT];
disk_req*  running_req = NULL;
static int head = 0, tail = 0;
// struct blk_dev bd_hd  = {.do_request = hd_do_req};
int dev_hd = -1, last_chk_res = 0;

int disk_mod_init(int devid)
{
    return 0;
}

int disk_mod_exit()
{
    return 0;
}
/**
    @brief 异步读硬盘
    参数格式如下：
    int diski:硬盘号
    unsigned int lba:起始扇区
    int sec_n:读写扇区数
    char* mem_addr:读写缓冲区地址
    返回值：0表示成功，-1表示失败
 */
int disk_mod_ioctl(int cmd, unsigned long long arg)
{
    struct disk_ioctlarg* ioctlarg   = (struct disk_ioctlarg*)arg;
    int                   diski      = ioctlarg->diski;
    int                   sector     = ioctlarg->lba;
    int                   nr_sectors = ioctlarg->sec_n;
    char*                 buffer     = ioctlarg->mem_addr;
    current_ioctlarg.diski           = diski;
    current_ioctlarg.lba             = sector;
    current_ioctlarg.sec_n           = nr_sectors;
    current_ioctlarg.mem_addr        = buffer;
    current_ioctlarg.status          = 1;
    current_ioctlarg.cmd             = cmd;
    switch (cmd) {
    case DRIVER_CMD_READ: async_read_disk(diski, sector, nr_sectors, buffer); break;
    case DRIVER_CMD_WRITE: async_write_disk(diski, sector, nr_sectors, buffer); break;
    case DRVF_CHK: async_check_disk(diski); break;
    default: return -1;
    }
}
int init_disk()
{
    // if ((dev_hd = reg_blkdev(&bd_hd)) < 0)
    //     return -1;
    if ((dev_hd = register_driver(disk_mod_init, disk_mod_exit, disk_mod_ioctl)) < 0)
        return -1;
    // disk_devi= reg_device(&dev_disk);
    // disk_drvi= reg_driver(&drv_disk);
    // dev_disk.drv=&drv_disk;
    // hd_iterate();
    return 0;
}
int disk_int_handler_c()
{
    if (!current_ioctlarg.status) {
        comprintf("err:null running dreq\n");
        return 1;   //同步读写硬盘
    }
    short* p    = current_ioctlarg.mem_addr;
    int    port = PORT_DISK_MAJOR;
    if (current_ioctlarg.diski == DISK_SLAVE_MAJOR || current_ioctlarg.diski == DISK_SLAVE_SLAVE)
        port = PORT_DISK_SLAVE;
    switch (current_ioctlarg.cmd) {
    case DRIVER_CMD_READ:
        for (int i = 0; i < current_ioctlarg.sec_n * 256; i++) {
            *p++ = inw(port);
        }
        break;
    case DRIVER_CMD_WRITE:
        for (int i = 0; i < current_ioctlarg.sec_n * 256; i++)
            outw(port, *p++);
        break;
    case DRVF_CHK:
        char  stat = inb(port + 7);
        short dat  = inw(port);
        if (1) {
            last_chk_res = DISK_CHK_OK;
        }
        else {
            char err = inb(port + 1);   //错误原因
            printfk("checking disk err:%x\nresetting hd\n", err);
            last_chk_res = DISK_CHK_ERR;
        }
        break;
    default: return -1;
    }
    current_ioctlarg.status = 0;
    change_driver_stat(dev_hd, DRIVER_STAT_DONE);
    next_request(dev_hd);
    return 0;
}
/* int disk_int_handler_c_old()
{
    if (r_running == NULL) {
        comprintf("err:null running dreq\n");
        return 1;   //同步读写硬盘
    }
    short* p    = r_running->buffer;
    int    port = PORT_DISK_MAJOR;
    if (BLKDEV_MINOR(r_running->dev) == DISK_SLAVE_MAJOR ||
        BLKDEV_MINOR(r_running->dev) == DISK_SLAVE_SLAVE)
        port = PORT_DISK_SLAVE;
    if (r_running->cmd == BLKDEV_REQ_READ) {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for (int i = 0; i < r_running->nr_sectors * 256; i++) {
            *p++ = inw(port);
        }
    }
    else if (r_running->cmd == BLKDEV_REQ_WRITE) {
        for (int i = 0; i < r_running->nr_sectors * 256; i++)
            outw(port, *p++);
    }
    else if (r_running->cmd == DISKREQ_CHECK) {
        char  stat = inb(port + 7);
        short dat  = inw(port);
        if (1) {
            last_chk_res = DISK_CHK_OK;
        }
        else {
            char err = inb(port + 1);   //错误原因
            printfk("checking disk err:%x\nresetting hd\n", err);
            last_chk_res = DISK_CHK_ERR;
        }
    }
    else if (r_running->cmd == DISKREQ_RESET) {
        int stat = inb(port + 7);
        printfk("reset disk done.\nstat now:%x\n", stat);
    }

    r_running = NULL;
    end_request(dev_hd);
    //执行下一个请求
    hd_do_req(blk_devs[dev_hd].current_request);
    return 0;
} */
int async_reset_disk(int disk)
{
    outb(PORT_DISK_CONTROL, DISK_CMD_RESET);
    return 0;
}
int async_read_disk(int disk, unsigned int lba, int sec_n, char* mem_addr)
{
    unsigned short port       = PORT_DISK_MAJOR;
    int            slave_disk = 0;
    if (disk == DISK_SLAVE_MAJOR || disk == DISK_SLAVE_SLAVE)
        port = PORT_DISK_SLAVE;
    if (disk == DISK_SLAVE_SLAVE || disk == DISK_MAJOR_SLAVE)
        slave_disk = 1;
    outb(port + 2, sec_n);
    outb(port + 3, lba & 0xff);
    outb(port + 4, (lba >> 8) & 0xff);
    outb(port + 5, (lba >> 16) & 0xff);
    char drv    = slave_disk ? 0x10 : 0;
    char lba_hi = (lba >> 24) & 0xf | drv | 0xe0;
    outb(port + 6, lba_hi);
    outb(port + 7, DISK_CMD_READ);

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
int async_write_disk(int disk, unsigned int lba, int sec_n, char* mem_ptr)
{
    unsigned short port       = PORT_DISK_MAJOR;
    int            slave_disk = 0;
    if (disk == DISK_SLAVE_MAJOR || disk == DISK_SLAVE_SLAVE)
        port = PORT_DISK_SLAVE;
    if (disk == DISK_SLAVE_SLAVE || disk == DISK_MAJOR_SLAVE)
        slave_disk = 1;
    while (1) {
        byte t = inb(0x1f7);
        // logf("istat:%x",t);
        byte err = t & 1;
        if (err != 0) {
            // printf("ERR iwriting disk\n");
            return -1;
        }
        t &= 0x88;
        if (t == 0x8)
            break;
    }
    outb(port + 2, sec_n);
    outb(port + 3, lba & 0xff);
    outb(port + 4, (lba >> 8) & 0xff);
    outb(port + 5, (lba >> 16) & 0xff);
    char          drv    = slave_disk ? 0x10 : 0;
    unsigned char lba_hi = (lba >> 24) & 0xf | drv | 0xe0;
    outb(port + 6, lba_hi);
    outb(port + 7, DISK_CMD_WRITE);
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
int read_disk(int disk, int lba, int secn, char* dest)
{
    // request(disk,DISKREQ_READ,lba,secn,dest);
    int ret = read_disk_asm(lba, secn, dest);
    //    chk_result(ret);
    if (running_req) {

        // running_req->stat=REQ_STAT_DONE;
        // running_req->args->stat=REQ_STAT_EMPTY;
    }
    // set_proc_stat(running_req->pid,TASK_READY);
    running_req = NULL;
    return ret;
}
int write_disk(int disk, int lba, int secn, char* src)
{
    // request(disk,DISKREQ_WRITE,lba,secn,src);
    int ret = write_disk_asm(lba, secn, src);
    //    chk_result(ret);
    if (running_req) {

        // running_req->stat=REQ_STAT_DONE;
        // running_req->args->stat=REQ_STAT_EMPTY;
    }
    running_req = NULL;
    return ret;
}


int async_check_disk(int disk)
{
    unsigned short disknr = PORT_DISK_MAJOR;
    unsigned short chkcmd = 0xe0;
    if (disk == DISK_SLAVE_MAJOR || disk == DISK_SLAVE_SLAVE)
        disknr = PORT_DISK_SLAVE;
    if (disk == DISK_MAJOR_SLAVE || disk == DISK_SLAVE_SLAVE)
        chkcmd = 0xf0;
    outb(disknr + 2, 1);
    outb(disknr + 3, 0);
    outb(disknr + 4, 0);
    outb(disknr + 5, 0);
    outb(disknr + 6, chkcmd);   //主硬盘
    outb(disknr + 7, DISK_CMD_CHECK);
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
/* int hd_do_req(struct request* req)
{
    if (!req)
        return -1;
    start_request(req->dev);
    int diski = BLKDEV_MINOR(req->dev);
    // for(;disks[diski]!=args->dev;diski++);

    switch (req->cmd) {
    case BLKDEV_REQ_READ: async_read_disk(diski, req->sector, req->nr_sectors, req->buffer); break;
    case BLKDEV_REQ_WRITE:
        async_write_disk(diski, req->sector, req->nr_sectors, req->buffer);
        break;
    case DRVF_CHK: async_check_disk(diski); break;
    default: return -1;
    }
    return 0;
} */