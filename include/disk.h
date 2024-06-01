#pragma once
#ifndef _DISK_H_
#define _DISK_H_
#include "typename.h"
#define MAX_DISK_REQUEST_COUNT 240
#define DISKREQ_READ 0
#define DISKREQ_WRITE 1
#define DISKREQ_CHECK 2
#define DISK_MAJOR_MAJOR 0
#define DISK_MAJOR_SLAVE 1
#define DISK_SLAVE_MAJOR 2
#define	DISK_SLAVE_SLAVE 3
#define	REQ_STAT_READY 0
#define REQ_STAT_WORKING 1
#define REQ_STAT_DONE 2
#define REQ_STAT_ERR 3	
#define PORT_DISK_MAJOR 0X1F0
#define PORT_DISK_SLAVE 0X170
#define DISK_CMD_READ 0x20
#define DISK_CMD_WRITE 0x30
#define DISK_CMD_CHECK 0xec
#include "devdrv.h"
typedef struct{
    int func;	//调用功能号
    int disk;	//操作硬盘对象
    int lba;    //lba
    int sec_n;  //操作扇区数
    char *buf;	//目标或者源缓冲区地址
    int pid;	//发起请求的进程号
    int stat;	//请求状态
}disk_req;
int read_disk_asm(int lba,int sec_n,char* mem_addr);
int write_disk_asm(int lba, int sec_n, char* mem_ptr);
int read_disk(driver_args* args);
int write_disk(driver_args* args);
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr);
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr);
int disk_int_handler();
int disk_int_handler_c();
int request(int disk,int func,int lba,int secn,char *buf);
int execute_request();
int check_dreq_stat(int req_id);
//counts:扇区数
int dllmain(void*,int,void*);
#endif