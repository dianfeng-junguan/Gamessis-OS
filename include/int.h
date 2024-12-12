#ifndef _H_INTERRUPT
#define _H_INTERRUPT
#define IDT_ADDR 0x106000ul
#define m8259ACTRL 0x20
#define m8259ADATA 0X21
#define f8259ACTRL 0xA0
#define f8259ADATA 0xA1
#define SYSCALL_READ_DISK 0
#define SYSCALL_WRITE_DISK 1
#define SYSCALL_MOUNT_DISK 7
#define SYSCALL_PRINT 9
#define SYSCALL_EXEC_SHELL 10
#define SYSCALL_DEL_PROC 11
#define SYSCALL_FETCH_KBBUF 12
#define SYSCALL_REG_DEVICE 24
#define SYSCALL_REG_DRIVER 25
#define MSR_FS_BASE 0xc0000100
#define sti() __asm__ volatile("sti");
#define cli() __asm__ volatile("cli");
#include "typename.h"
#include <sys/types.h>

void wrmsr(unsigned long address, unsigned long value);

#ifdef IA32
typedef struct
{
    u16 offset_low;
    u16 selector;
    u16 attr;
    u16 offset_high;
} __attribute__((packed)) gate;
#else
typedef struct
{
    u16 offset_low;
    u16 selector;
    u16 attr;
    u16 offset_mid;
    u32 offset_high;
    u32 rsvd;
} __attribute__((packed)) gate;

//不定长结构体，名字是直接存储在结构体后面的
typedef struct
{
    unsigned long long addr;
    char               type;
    int                namelen;
} __attribute__((packed)) ksym;

#endif
void outb(u16 device, u8 value);
void outw(u16 dev, u16 v);
void io_delay();
u8   inb(u8 device);
u16  inw(u16 device);


void turn_on_int();
#define GDT_SEL_CODE 0x8

#define GATE_PRESENT 0x8000
#define TRAP_GATE 0xf00
#define TASK_GATE 0xc00
#define INT_GATE 0xe00
//注：这里的index指的是idt作为数组，每一项的index，不是0x8,0x10那些
void set_gate(u8 index, addr_t offset, u16 selector, u16 attr);

void register_int(unsigned char  index, void(*first_handler), void(*sec_handler),
                  unsigned short attr);
void eoi();
/*
 * the major difference between trap gate and sys gate is that trap gate will block other ints until
 * finished while sys gate won't
 * */

void init_int();
// static struct desgate idt[0x21];
void divide_err();
void debug();
void default_int_proc();
void breakpoint();
void overflow();
void bounds();
void undefined_operator();
void coprocessor_notexist();
void double_ints();
void coprocessor_seg_overbound();
void invalid_tss();
void segment_notexist();
void stackseg_overbound();
void general_protect();
void coprocessor_err();

void _divide_err();
void _debug();
void _default_int_proc();
void _breakpoint();
void _overflow();
void _bounds();
void _undefined_operator();
void _coprocessor_notexist();
void _double_ints();
void _coprocessor_seg_overbound();
void _invalid_tss();
void _segment_notexist();
void _stackseg_overbound();
void _general_protect();
void _coprocessor_err();

/// @brief 在错误发生时，输出函数调用堆栈。
/// @param ret_stack ist中，错误码后开始的地址
void backtrace();
/*
调用系统中断，所有内核的重要功能基本都在这。
参数；
int func:调用号
调用号：
0 读取硬盘
1 写硬盘
3 读取文件
4 写文件
5 创建进程
6 杀死进程
7 加载硬盘
8 卸载硬盘
9 puts
12从键盘缓冲区获取内容
后续的参数依据具体功能而定：
0：
func_num,int lba,int sec_count
return:buf_addr
1:
func_num,int lba,int sec_count,void* src
7;
func_num,int disk_num
9:
func_num,char *str
12:
func,count,char *dist
 */
int   syscall(long a, long b, long c, long d, long e, long f);
void* _syscall(int func_num, ...);


#endif
