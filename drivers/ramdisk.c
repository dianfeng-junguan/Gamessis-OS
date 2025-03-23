//
// Created by Oniar_Pie on 2024/11/15.
//

#include "ramdisk.h"
#include "devman.h"
#include "driverman.h"
#include "ioctlarg.h"
#include "memory.h"
#include "log.h"
#include "com/mem.h"
#include "proc.h"

/*
 * 这部分主要是测试用，之后也可能用上（如果之后设计了initrd之类的话）
 * */
extern char _binary_rd_img_start[], _binary_rd_img_end[];
extern char _binary_bin_test_elf_start[], _binary_bin_test_elf_end[];
char*       ramdisk_base;
long        ramdisk_size;
int         drv_ramdisk = -1;
// struct blk_dev bd_ramdisk  = {.do_request = ramdisk_do_req};
/* void ramdisk_do_req(struct request* req)
{
    if (!req)
        return;
    start_request(req->dev);
    int len  = req->nr_sectors * SECTOR_SIZE;
    int base = req->sector * SECTOR_SIZE;
    switch (req->cmd) {
    case BLKDEV_REQ_READ:
        for (int i = 0; i < len; i++) {
            req->buffer[i] = ramdisk_base[i + base];
        }
        break;
    case BLKDEV_REQ_WRITE:
        for (int i = 0; i < len; i++) {
            ramdisk_base[i + base] = req->buffer[i];
        }
        break;
    default: break;
    }
    end_request(req->dev);
    ramdisk_do_req(blk_devs[drv_ramdisk].current_request);
} */
/**
    @brief
   ramdisk模块初始化占位函数，因为这个模块是直接编译进内核的，
   所以是由init函数调用register_driver函数注册的，这里如果再调用init_ramdisk就死循环了。
    @return 0
 */
int ramdisk_mod_init(int dev_id)
{
    return 0;
}
int ramdisk_mod_exit()
{
    return 0;
}
/**
    @brief ramdisk驱动功能函数，参数如下:
    @param cmd  命令
    @param arg  命令参数
    cmd==DRIVER_CMD_READ: 读取数据.
    cmd==DRIVER_CMD_WRITE: 写入数据. 二者的arg为
        int lba;
        int count;
        char *buf;
    的有内存对齐的排列的指针。
 */
int ramdisk_mod_ioctl(int cmd, unsigned long long arg)
{
    drvioctlarg_read* ioctlarg = (drvioctlarg_read*)arg;
    int               len      = ioctlarg->count * 512;
    int               base     = ioctlarg->lba * 512;
    char*             buffer   = (char*)((unsigned long long)ioctlarg->buf);
    switch (cmd) {
    case DRIVER_CMD_READ:
        for (int i = 0; i < len; i++) {
            buffer[i] = ramdisk_base[i + base];
        }
        break;
    case DRIVER_CMD_WRITE:
        for (int i = 0; i < len; i++) {
            ramdisk_base[i + base] = buffer[i];
        }
        break;
    default: break;
    }
    change_driver_stat(drv_ramdisk, DRIVER_STAT_DONE);
    next_request(drv_ramdisk);
    return 0;
}
void init_ramdisk()
{
    //初始化ramdisk，在/dev下创建一个ram
    ramdisk_base = KNL_BASE + 0x81000000;   //(char *) kmallocat(0, 100);
    if (ramdisk_base == -1) {
        comprintf("failed to init ramdisk.\n");
        return;
    }
    ramdisk_size = (char*)_binary_rd_img_end - (char*)_binary_rd_img_start;   // PAGE_4K_SIZE*100;
    /* if ((drv_ramdisk = reg_blkdev(&bd_ramdisk)) < 0) {
        comprintf("no place for more blkdev.\n");
        return;
    } */
    if ((drv_ramdisk = register_driver(ramdisk_mod_init, ramdisk_mod_exit, ramdisk_mod_ioctl)) <
        0) {
        comprintf("no place for more blkdev.\n");
        return;
    }
    for (int i = 0; i < (ramdisk_size + PAGE_4K_SIZE - 1) / PAGE_4K_SIZE; i++) {
        smmap(pmalloc(PAGE_4K_SIZE),
              ramdisk_base + i * PAGE_4K_SIZE,
              PAGE_PRESENT | PAGE_RWX,
              PML4_ADDR);
        //解压img里面的test程序
        memcpy(
            ramdisk_base + i * PAGE_4K_SIZE, _binary_rd_img_start + i * PAGE_4K_SIZE, PAGE_4K_SIZE);
    }
}
