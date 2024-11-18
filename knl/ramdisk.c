//
// Created by Oniar_Pie on 2024/11/15.
//
#include <blk_dev.h>
#include "ramfs.h"
#include "devman.h"
#include "memory.h"
#include "log.h"
#include "mem.h"

/*
 * 这部分主要是测试用，之后也可能用上（如果之后设计了initrd之类的话）
 * */
extern char _binary_bin_test_elf_start[],_binary_bin_test_elf_end[];
char* ramdisk_base;
long ramdisk_size;
int dev_ramdisk=-1;
struct blk_dev bd_ramdisk={
    .do_request=ramdisk_do_req
};
void ramdisk_do_req(struct request* req){
    switch (req->cmd)
    {
    case BLKDEV_REQ_READ:
        int len= req->nr_sectors*SECTOR_SIZE;
        int base=req->sector*SECTOR_SIZE;
        for(int i=0;i<len;i++){
            req->buffer[i]=ramdisk_base[i + base];
        }
        break;
    case BLKDEV_REQ_WRITE:
        int len= req->nr_sectors*BLOCK_SIZE;
        int base=req->sector*BLOCK_SIZE;
        for(int i=0;i<len;i++){
            ramdisk_base[i + base]=req->buffer[i];
        }
        break;
    default:
        break;
    }
    end_request(req->dev);
}
void init_ramdisk(){
    //初始化ramdisk，在/dev下创建一个ram
    ramdisk_base= (char *) kmallocat(0, 100);
    if(ramdisk_base==-1){
        comprintf("failed to init ramdisk.\n");
        return;
    }
    ramdisk_size=PAGE_4K_SIZE*100;
    if((dev_ramdisk=reg_blkdev(&bd_ramdisk))<0){
        comprintf("no place for more blkdev.\n");
        return;
    }
     //解压img里面的test程序
    memcpy(ramdisk_base, _binary_bin_test_elf_start, (char*)_binary_bin_test_elf_end - (char*)_binary_bin_test_elf_start);

    
}
