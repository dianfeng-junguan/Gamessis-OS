#pragma once

#define MODULE_TYPE_EXE 0
#define MODULE_TYPE_DLL 1
#define MAX_MODULES 128
typedef struct 
{
    int base;
    int type;
}Module;
/*
 * 运行文件，成为独立进程。
 *
 * */
int execute(char *path, char **argv);
//从新文件加载程序代替现有进程的程序映像。
int sys_execve(char *path, int argc, char **argv);
/*
 * 立即调用一个程序（会阻塞当前进程）
 * */
int exec_call(char *path);
/*
加载dll，必须在目标进程的tss下使用，因为该函数直接使用线性地址。
*/
int load_library(char *path);
int dispose_library(int dlln);

//int req_page_at(int base,int pgn);
//查看指定区域的页内存是否可用
int check_pgm(int base,int pgn);
//返回page的物理地址
//int req_a_page();


int get_module_addr(int mi);
int use_pgm_ava(int nbase, int page_count);
int lookup_pgind(int vma,int* pgind);


int load_pe(struct process *proc);
addr_t load_elf(struct file *elf);

int proc_start();

//int sys_read();

//模块管理
int sys_insmod(char *path);
int sys_rmmod(char *name);
