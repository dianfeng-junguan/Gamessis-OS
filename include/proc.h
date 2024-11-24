//
// Created by Oniar_Pie on 2023/11/9.
//

#ifndef SRC_PROC_H
#define SRC_PROC_H
#pragma once
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
#include <sys/types.h>
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
/* 
进程发生系统调用的时候保存在堆栈的上下文会拷贝到这里（cr3,errcode,rsp,rip是常用的，rsp,rip,cr3会在进程切换的时候用到），只是为了方便访问，而且
除了cr3,errcode,rsp,rip，其他的寄存器，修改是不会影响syscall恢复上下文的，因为上下文的恢复只依赖栈。
除了系统调用函数，不要使用上面特别提到的几个寄存器之外的寄存器的值，一般都是过时的值。
系统调用不会恢复rax的值。
注意：regs.cr3里面存储的是cr3的值，也就是pml4的物理地址，而proc.pml4存储的是pml4的虚拟地址。
 */
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
//在时钟中断和系统调用发生的时候，对栈里面保存现场用的入栈数据。此结构体还用于创建进程时方便构建一个这样的现场。
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
    int dl;//是否加载了dl
}__attribute__((packed));//208 bytes
#endif
typedef struct
{
    unsigned int proc_end_addr;
    unsigned int argv;
    unsigned int argc;
}proc_ret_stack;

__attribute__((__always_inline__))inline void wait_on_req(struct process* p){
        if(p->stat==TASK_READY||p->stat==TASK_RUNNING)
            p->stat=TASK_SUSPENDED;
}
__attribute__((__always_inline__))inline void wake_up(struct process* p){
        if(p->stat==TASK_SUSPENDED)
            p->stat=TASK_READY;
}
void set_errno(int errno);

void init_proc();
int req_proc();
// int reg_proc(addr_t entry, struct index_node *cwd, struct index_node *exef);
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

// int add_proc_openf(struct index_node *entry);

int sys_exit(int code);


void * sys_malloc(size_t size);
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
void move_to_user_mode();

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


// void ret_sys_call();
// void ret_normal_proc();
void _syscall_sysret();
int sys_fork(void);

void copy_mmap(struct process* from, struct process *to);
void release_mmap(struct process* p);
/// @brief 检查当前内存空间一块虚拟内存是否已经被映射。
/// @param base 基地址
/// @param mem_size 大小（字节）
/// @return 布尔值，为真为可用，假为被占用。
int chk_mmap(off_t base, size_t mem_size);

/*
 * real id, effective id, saved effective id:
 * real id是指进程的真正执行者的id，effective id是指权限检查的时候使用的id（有时非root用户需要用root权限才能运行一些程序），
 * saved ~是effective id的缓存。非root用户只能把effective id设置成real id和saved中的一个。
 * 本质上，这三个id都是用户组id，不是进程组id。
 * */
/*
 * If the process has appropriate privileges, setgid() sets the real group ID, effective group ID
 * and the saved set-group-ID  to gid.
 * If the process does not have appropriate privileges, but gid is equal to the real group ID  or the
 * saved set-group-ID,  setgid() function sets the effective group ID to gid; the real group ID  and
 * saved set-group-ID  remain unchanged.
 * Any supplementary group IDs of the calling process remain unchanged.
 * */
pid_t setgid(gid_t gid);
//获取real group id。
pid_t getgid(void);

//============进程组===============

//获取当前进程的进程组号。
pid_t sys_getpgrp(void);
//获取指定进程的进程组号。
int sys_getpgid(pid_t pid,gid_t gid);
/*
 * 将pid对应的进程划归到gid进程组。
 * session leader的进程组id不会改变。
 * pid=0时，进程为当前进程。gid为0时，当前进程组id被使用。
 * */
int sys_setpgid(pid_t pid,gid_t gid);
/*
 * The setsid() function creates a new session, if the calling process is not a process group leader.
 * Upon return the calling process will be the session leader of this new session, will be the process
 * group leader of a new process group, and will have no controlling terminal. The process group ID of
 * the calling process will be set equal to the process ID of the calling process. The calling process
 * will be the only process in the new process group and the only process in the new session.
 * */
pid_t sys_setsid(void);
//获取pid进程的session号。0代表当前进程。
pid_t sys_getsid(pid_t pid);
//更改当前的会话中的foreground process group id。
//fildes是当前会话的当前controlling terminal的文件描述符(tty描述符)，
//必须是属于当前进程的，也就是说当前进程必须是会话leader。
int sys_tcsetpgrp(int fildes,pid_t pgid_id);
//获取fildes对应的会话的foreground process group id。
//fildes是当前会话的当前controlling terminal的文件描述符(tty描述符)
pid_t sys_tcgetpgrp(int fildes);

extern struct process* current;
#endif //SRC_PROC_H
