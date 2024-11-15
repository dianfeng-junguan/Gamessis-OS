//
// Created by Oniar_Pie on 2023/11/9.
//

#ifndef SRC_PROC_H
#define SRC_PROC_H
#pragma pack(1)
#define MAX_PAGES_PROC 8
#define MAX_TASKS 32
#define TASK_EMPTY 0
#define TASK_RUNNING 1
#define TASK_READY 2
#define TASK_SUSPENDED 3
#define TASK_ZOMBIE 4
#define MAX_PROC_COUNT 64
#define MAX_UTIME 10
#define MAX_PROC_OPENF 32
#include "gdt.h"
#include "typename.h"
#include "vfs.h"

#define CS_USER 0x30
#define DS_USER 0x28
#define _TSS_IND(n) (n*2+5)
#define _LDT_IND(n) (n*2+6)
// 下面是数学协处理器使用的结构，主要用于保存进程切换时i387 的执行状态信息。
struct i387_struct
{
    long cwd;			// 控制字(Control word)。
    long swd;			// 状态字(Status word)。
    long twd;			// 标记字(Tag word)。
    long fip;			// 协处理器代码指针。
    long fcs;			// 协处理器代码段寄存器。
    long foo;
    long fos;
    long st_space[20];		/* 8*10 bytes for each FP-reg = 80 bytes */
};

#define HEAP_BASE 0x1000000
#define HEAP_MAXTOP 0x1f00000
#define CHUNK_SIZE 0x1000
#define INT_STACK_TOP (0xffff800000000000ul+0x800000)
#define INT_STACK_BASE (0xffff800000000000ul+0x7ff000)
#define STACK_TOP 0x00007ffffffff000ul
//堆空间
typedef struct _chunk_header_{
    int pgn;    //占用页面数量
    int alloc;  //是否被分配了
    struct _chunk_header_* next;   //下一个存储头地址
    struct _chunk_header_* prev;   //上一个存储头地址
}chunk_header;
typedef struct _procm_{
    addr_t heap_base;
    addr_t heap_top;
    addr_t stack_bottom;
    addr_t stack_top;
    addr_t text_base;
    addr_t text_top;
    addr_t data_base;
    addr_t data_top;
}proc_mem_arr;
typedef struct
{
    long cr3;
    long rip;
    long rflags;
    long rax, rcx, rdx, rbx;
    long rsp;
    long rbp;
    long rsi;
    long rdi;
    long es;
    long cs;
    long ss;
    long ds;
    long fs;
    long gs;
    long r8,r9,r10,r11,r12,r13,r14,r15;
    long errcode;
}regs_t;
//在始终中断发生的时候，对栈里面保存现场用的入栈数据。此结构体用于创建进程时方便构建一个这样的现场。
typedef struct {
    unsigned long ds,es,r15,r14,r13,r12,r11,r10,r9,r8;
    unsigned long rsi,rdi,rdx,rcx,rbx,rax;
    //iret使用
    unsigned long rip,cs,rflags,rsp,ss;

}stack_store_regs;

#ifdef IA32
typedef struct REGISTERS
{
    long back_link;		/* 16 high bits zero */
    long esp0;
    long ss0;			/* 16 high bits zero */
    long esp1;
    long ss1;			/* 16 high bits zero */
    long esp2;
    long ss2;			/* 16 high bits zero */
    long cr3;
    long eip;
    long eflags;
    long eax, ecx, edx, ebx;
    long esp;
    long ebp;
    long esi;
    long edi;
    long es;			/* 16 high bits zero */
    long cs;			/* 16 high bits zero */
    long ss;			/* 16 high bits zero */
    long ds;			/* 16 high bits zero */
    long fs;			/* 16 high bits zero */
    long gs;			/* 16 high bits zero */
    long ldt;			/* 16 high bits zero *///ldt 段选择子
    long trace_bitmap;		/* bits: trace 0, bitmap 16-31 */
    //struct i387_struct i387;
}TSS;
struct process{
    unsigned int pid;
    unsigned int stat;
    unsigned int utime; //used time
    unsigned int priority;
    unsigned int exit_code;//exit code

    proc_mem_arr mem_struct;

    descriptor ldt[5];
    unsigned int has_console;
    unsigned int parent_pid;
    unsigned int page[8];
    unsigned int *pdet;//页目录
    vfs_dir_entry *cwd;
    vfs_dir_entry *exef;
    vfs_dir_entry *openf[MAX_PROC_OPENF];
    TSS tss;
}__attribute__((packed));//208 bytes
#else

typedef struct
{
    u32 rsvd;
    u64 rsp0;
    u64 rsp1;
    u64 rsp2;
    u64 rsvd2;
    u64 ists[7];
    u64 rsvd3;
    u32 rsvd4;
    u32 io_map_base;
}TSS;
struct process{
    unsigned int pid,gpid,sid,fg_pgid;//fg_gid是foreground process group id
    int in_bgpg;//是否在background process group id
    int tty_fd;//控制台fd
    unsigned int stat;
    unsigned int utime; //used time
    unsigned int priority;
    unsigned int exit_code;//exit code

    proc_mem_arr mem_struct;

    descriptor ldt[5];
    unsigned int has_console;
    unsigned int parent_pid;
    unsigned int page[8];
    addr_t *pml4;//pml4
    struct file *cwd;
    struct file *exef;
    struct file *openf[MAX_PROC_OPENF];
    TSS tss;
    regs_t regs;
    struct List node;//本进程的节点
    struct List *child_procs;//子进程
}__attribute__((packed));//208 bytes
#endif
typedef struct
{
    unsigned int proc_end_addr;
    unsigned int argv;
    unsigned int argc;
}proc_ret_stack;

__attribute__((__always_inline__))inline int do_syscall(int func,int a1,int a2,int a3,int a4,int a5,int a6){
        asm volatile(".byte 0x48\n"
                 "syscall"::"a"(func),"D"(a1),"S"(a2),"d"(a3),"c"(a4),"r"(a5),"r"(a6));
}

void init_proc();
int req_proc();
int reg_proc(addr_t entry, struct index_node *cwd, struct index_node *exef);
void set_proc(long rax, long rbx, long rcx, long rdx, long es, long cs, long ss, long ds, long fs, long gs, long rsp,
              long rbp, long rsi, long rdi, long rip, long rflags, int proc_nr);
void manage_proc();
void switch_proc_tss(int pnr);
//tss_ind:tss在gdt中的索引
void switch_proc_asm(int tss_ind);
void del_proc(int pnr);
int set_proc_stat(int pid,int stat);
//内核将dll加载到指定地方
int load_dll_at(char *path,int addr);

int add_proc_openf(struct index_node *entry);

int sys_exit(int code);


void * sys_malloc(int size);
int sys_free(int ptr);
//弃用区=========================================
//创建一个进程，返回进程在task数组中的index
int create_zero();
//创建一个零号进程为默认值的进程。
int init_proc0();
//void fill_desc(u32 addr,u32 limit,u32 attr,unsigned long long* des);
void switch_proc(int pnr);
void switch_to_ia32(TSS *tss);
void switch_to(struct process *from, struct process *to);
void __switch_to(struct process *from, struct process *to);

void save_context(TSS *tss);
//用来保存rsp到当前proc.regs
void save_rsp();
void proc_zero();
void proc_end();
void* malloc(int size);
void* palloc(int proc_index,int size);

//设置TSS中的值。
void set_tss(u64 rsp0,u64 rsp1,u64 rsp2,u64 ist0,u64 ist1,u64 ist2,u64 ist3,u64 ist4,u64 ist5,u64 ist6);

void create_test_proc();


void ret_sys_call();
void ret_normal_proc();
int sys_fork(void);

void copy_mmap(struct process* from, struct process *to);
void release_mmap(struct process* p);
extern struct process* current;
#endif //SRC_PROC_H
