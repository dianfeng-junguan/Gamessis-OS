#pragma once
void init_ramdisk();

void                  ramdisk_do_req(struct request* req);
extern int            drv_ramdisk;
extern struct blk_dev bd_ramdisk;