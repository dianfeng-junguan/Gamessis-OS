#pragma once
#define MAX_FILES_PER_DIR 512
#define FAT_EOF 0xfff7
#include "devdrv.h"
typedef struct 
{
    /* data */
    char jmp_code[3];
    char name[8];
    unsigned short bytesPerSec;
    unsigned char secPerClu;
    unsigned short rsvdSec;//保留扇区数，也就是FAT表之前的扇区数
    unsigned char numOfFAT;
    unsigned short rootEntries;//根目录项数
    unsigned short smlSec;
    unsigned char mediaDes;
    unsigned short secPerFAT;
    unsigned short secPerTrack;
    unsigned short numOfHead;
    unsigned int hiddenSector;
    unsigned int largeSec;
    /*extended BPB*/
    unsigned char phyDrvNum;
    unsigned char rsvd;
    unsigned char extBootSgntr;
    unsigned short volSerialNum;
    char volLabel[11];
    char fsType[8];

}__attribute__((packed)) BPB;
typedef struct
{
    char name[8];
    char extension[3];
    unsigned char attr;
    char rsvd[10];
    unsigned short lastModfTime;
    unsigned short lastModfDate;
    unsigned short fistCluNum;
    unsigned int len;

}__attribute__((packed)) dir_entry;
//驱动接口函数
//文件操作函数
int load(driver_args *arg);
int ls(driver_args *arg);
int mkdir(driver_args *arg);
int touch(driver_args *arg);
int rm(driver_args *arg);
int cd(driver_args *arg);
int read_file(driver_args *arg);
int write_file(driver_args *arg);
//按照路径递归查找文件
//char *name,dir_entry* entry,dir_entry dir
int get_entry(driver_args* args);
int find(char *name);

//内存操作函数
#define FAT16_MAX_FILE_OPENS 32
//returns the index of the dir entry in cur dir array.
//for example, cur_dir_entries[index](just to explain,
//not the real situation)
//在当前目录下查找文件，不能递归查找

int read_sec(char *dist, int sec_num, int sec_count);
int write_sec(char *src, int sec_num, int sec_c);

//pos means the beginning byte 
int read_file_byname(char *full_name,char *dist,int pos,int len);
//pos mean the beginning byte
int write_file_byname(char *full_name,char *src,int pos,int len);

void translate_attr(char attr,char *str);

void update_fat_and_root();
int req_cluster();
int extend_cluster(short cluster);

//检查输入的文件名长度是否合法，以及是否出现非法字符（但是不检查大小写和.）
//返回值为布尔值。
int verify_name(char *str);
//fill the rest with space and to_upper
//将“aaa.bb”的文件名形式转换为可以直接strcmp(,,11)的形式。
//默认文件名合法，请先检查文件名再使用。
void format_name(char *str);
int enter_dir(char *path);
void get_fname(char *path,char *name);
void cmd();

#define ATTR_READONLY 1
#define ATTR_HIDDEN 2
#define ATTR_SYSTEM 4
#define ATTR_VOLUME_LABEL 8
#define ATTR_DIR 16
#define ATTR_ARCHIVE 32
void add_dot_and_ddot_dir(dir_entry dir);
void set_attr(dir_entry *f,char attr);

//check the existence of file by dir,
//usually for kernel.
//returns a boolean.
int file_exist(dir_entry entry);
int init_fat16();