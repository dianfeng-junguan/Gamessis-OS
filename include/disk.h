#pragma once
#ifndef _DISK_H_
#define _DISK_H_
#include "typename.h"
#define MAX_DISK_REQUEST_COUNT 240
#define DISKREQ_READ 0
#define DISKREQ_WRITE 1
#define DISKREQ_CHECK 2
#define DISKREQ_RESET 3
#define DISK_MAJOR_MAJOR 0
#define DISK_MAJOR_SLAVE 1
#define DISK_SLAVE_MAJOR 2
#define	DISK_SLAVE_SLAVE 3
#define PORT_DISK_MAJOR 0X1F0
#define PORT_DISK_SLAVE 0X170
#define PORT_DISK_CONTROL 0X3f6
#define DISK_CMD_READ 0x20
#define DISK_CMD_WRITE 0x30
#define DISK_CMD_CHECK 0x90
#define DISK_CMD_RESET 0xc

#define DISK_CHK_OK 1
#define DISK_CHK_ERR 2
#define MAX_DISK_CHKTIME 10
#include "devdrv.h"
#include "vfs.h"

typedef struct{
    int func;	//调用功能号
    int disk;	//操作硬盘对象
    int lba;    //lba
    int sec_n;  //操作扇区数
    char *buf;	//目标或者源缓冲区地址
    int pid;	//发起请求的进程号
    int stat;	//请求状态
    int result; //检查磁盘结果
    int time;   //请求使用的时间（用来检查是否超时）
    driver_args *args; //参数
}disk_req;
int init_disk();
int read_disk_asm(int lba,int sec_n,char* mem_addr);
int write_disk_asm(int lba, int sec_n, char* mem_ptr);
int read_disk(driver_args* args);
int write_disk(driver_args* args);
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr);
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr);
int async_check_disk(int disk);
int disk_int_handler();
int disk_int_handler_c();
int request(int disk,int func,int lba,int secn,char *buf);
int execute_request();
int check_dreq_stat(int req_id);

int hd_iterate();

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args);

//counts:扇区数
int dllmain(void*,int,void*);
int chk_result(int r);
extern struct file_operations hd_fops;
#endif