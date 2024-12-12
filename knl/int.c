#include "int.h"
#include "clock.h"
#include "com.h"
#include "devman.h"
#include "exe.h"
#include "kb.h"
#include "memory.h"
#include "proc.h"
#include "signal.h"
#include "sys/types.h"
#include "syscall.h"
#include <log.h>

#pragma pack(1)
gate* idt = (gate*)(KNL_BASE + IDT_ADDR);
void* int_table[256];   //第二级中断处理函数
//调用过程:
//->_xxx->common_int->xxx
extern int disk_int_handler();

void init_int()
{
    //__asm__ volatile("sidt %0"::"m"(idt));
    // TODO 写完这里的idt修改
    // register_int(0, _debug, debug, TRAP_GATE);
    set_gate(0, (addr_t)divide_err, GDT_SEL_CODE, GATE_PRESENT | TRAP_GATE);
    set_gate(1, (addr_t)debug, GDT_SEL_CODE, GATE_PRESENT | TRAP_GATE);
    set_gate(2, (addr_t)default_int_proc, GDT_SEL_CODE, GATE_PRESENT | TRAP_GATE);
    set_gate(3, (addr_t)breakpoint, GDT_SEL_CODE, GATE_PRESENT | TRAP_GATE);
    set_gate(4, (addr_t)overflow, GDT_SEL_CODE, GATE_PRESENT | TRAP_GATE);
    set_gate(5, (addr_t)bounds, GDT_SEL_CODE, GATE_PRESENT | TRAP_GATE);
    set_gate(6, (addr_t)undefined_operator, GDT_SEL_CODE, GATE_PRESENT | TRAP_GATE);
    set_gate(7, (addr_t)coprocessor_notexist, GDT_SEL_CODE, GATE_PRESENT | TRAP_GATE);
    set_gate(8, (addr_t)double_ints, GDT_SEL_CODE, GATE_PRESENT | TRAP_GATE);   // double_ints
    set_gate(9, (addr_t)coprocessor_seg_overbound, GDT_SEL_CODE, GATE_PRESENT | TRAP_GATE);
    set_gate(10, (addr_t)invalid_tss, GDT_SEL_CODE, GATE_PRESENT | TRAP_GATE);
    set_gate(11, (addr_t)segment_notexist, GDT_SEL_CODE, GATE_PRESENT | TRAP_GATE);
    set_gate(12, (addr_t)stackseg_overbound, GDT_SEL_CODE, GATE_PRESENT | TRAP_GATE);   //
    set_gate(13, (addr_t)general_protect, GDT_SEL_CODE, GATE_PRESENT | TRAP_GATE);
    set_gate(14, (addr_t)page_err, GDT_SEL_CODE, GATE_PRESENT | TRAP_GATE);
    set_gate(15, (addr_t)default_int_proc, GDT_SEL_CODE, GATE_PRESENT | TRAP_GATE);
    set_gate(16, (addr_t)coprocessor_err, GDT_SEL_CODE, GATE_PRESENT | TRAP_GATE);
    for (int i = 17; i < 48; i++)
        set_gate(i, (addr_t)default_int_proc, GDT_SEL_CODE, GATE_PRESENT | INT_GATE);
    // set_gate(0x21,(addr_t)key_proc,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
    set_gate(0x20, (addr_t)clock, GDT_SEL_CODE, GATE_PRESENT | INT_GATE);
    set_gate(0x2e, (addr_t)disk_int_handler, GDT_SEL_CODE, GATE_PRESENT | INT_GATE);
    set_gate(0x80, (addr_t)_syscall, GDT_SEL_CODE, GATE_PRESENT | INT_GATE);   //
    // set_gate(0x2c,mouse_proc,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
    //启动8259A

    // ICW1
    outb(0x20, 0x11);
    outb(0xA0, 0x11);
    // ICW2
    outb(0x21, 0x20);   // former 0x20,0x20
    outb(0xA1, 0x28);
    // ICW3
    outb(0x21, 0x04);
    outb(0xA1, 0x02);
    // ICW4
    outb(0x21, 0x01);
    outb(0xA1, 0x01);

    turn_on_int();


    //设置IA32_LSTAR,为syscall做设置
    wrmsr(0xc0000082, _syscall);
    //设置IA32_FMASK,为syscall做设置
    wrmsr(0xc0000084, -1);
}
//同时注册idt和int table。
void register_int(unsigned char  index, void(*first_handler), void(*sec_handler),
                  unsigned short attr)
{
    set_gate(index, first_handler, GDT_SEL_CODE, attr | GATE_PRESENT);
    int_table[index] = sec_handler;
}
void set_gate(u8 index, addr_t offset, u16 selector, u16 attr)
{
#ifdef IA32
    /* idt[index].offset_low=offset&0xffffu;
    idt[index].offset_high=(offset>>16)&0xffffu;
    idt[index].attr=attr;
    idt[index].selector=selector; */
#else
    offset |= KNL_BASE;   //中断必须在内核空间
    idt[index].offset_low  = offset & 0xffff;
    idt[index].offset_mid  = (offset >> 16) & 0xffff;
    idt[index].offset_high = (offset >> 32);   // 0x0000ffff;
    idt[index].attr        = attr | 1;         // 1是ist索引
    idt[index].selector    = selector;
    idt[index].rsvd        = 0;
#endif
}

void divide_err()
{
    __asm__("cli");
    // puts("divide err");
    eoi();
    __asm__ volatile("sti \r\n leave \r\n iretq");
}

void debug()
{
    __asm__("cli");
    // puts("debug");
    eoi();
    __asm__ volatile("leave \r\n iretq");
}
void default_int_proc()
{
    __asm__("cli");
    // puts("default_int_proc");
    eoi();
    __asm__ volatile("sti \r\n leave \r\n iretq");
}
void breakpoint()
{
    __asm__("cli");
    // puts("breakpoint");
    eoi();
    __asm__ volatile("sti \r\n leave \r\n iretq");
}
void overflow()
{
    __asm__("cli");
    // puts("overflow");
    eoi();
    __asm__ volatile("sti \r\n leave \r\n iretq");
}
void bounds()
{
    __asm__("cli");
    // puts("bounds");
    eoi();
    __asm__ volatile("sti \r\n leave \r\n iretq");
}
void undefined_operator()
{
    // puts("undef operator");
    eoi();
    off_t stk = 0;
    __asm__ volatile("mov %%rbp,%0" : "=m"(stk));
    stk -= 16;
    backtrace(stk);
    __asm__ volatile("jmp .\r\n leave \r\n iretq");
}
void coprocessor_notexist()
{
    __asm__("cli");
    // puts("coprocessor doesnt exist");
    eoi();
    __asm__ volatile("sti \r\n leave \r\n iretq");
}
void double_ints()
{
    __asm__("cli");
    // puts("double interrupts");
    eoi();
    __asm__ volatile("sti \r\n leave \r\n iretq");
}
void coprocessor_seg_overbound()
{
    // puts("coprocessfor seg overdound");
    eoi();
    __asm__ volatile("leave \r\n iretq");
}
void invalid_tss()
{
    __asm__("cli");
    // puts("invalid tss");
    eoi();
    __asm__ volatile("sti \r\n leave \r\n iretq");
}
void segment_notexist()
{
    __asm__("cli");
    // puts("seg nonexistent");
    eoi();
    __asm__ volatile("sti \r\n leave \r\n iretq");
}
void stackseg_overbound()
{
    __asm__("cli");
    // puts("stack seg overbound");
    eoi();
    __asm__ volatile("sti \r\n leave \r\n iretq");
}
void general_protect()
{
    com_puts("general protect.", PORT_COM1);
    long addr = 0, err_code = 0;
    __asm__ volatile("mov 16(%%rbp),%0" : "=r"(addr));
    __asm__ volatile("mov 24(%%rbp),%0" : "=r"(err_code));
    comprintf("err code(seg descriptor):%x\n", err_code);
    comprintf("problem process pid:%d\n", current->pid);
    comprintf("occurred at %x\n", addr);
    backtrace();

    //处理问题进程
    if (current->pid == 1) {
        comprintf("sys died.\n");
        while (1) {}
    }
    //终结问题进程
    sys_exit(-1);
    eoi();
    __asm__ volatile("leave\r\n add $8,%rsp \r\n iretq");
}

void coprocessor_err()
{
    __asm__("cli");
    // puts("coprocessor err");
    eoi();
    __asm__ volatile("sti \r\n leave \r\n iretq");
}

/*
normal
system call number:	rax
arg1:	rdi
arg2:	rsi
arg3:	rdx
arg4:	rcx
arg5:	r8
arg6:	r9

sysenter need rdx(rip) rcx(rsp)
syscall need rcx(rip) r11(rflags)

xchg rcx to r10

*/
int syscall(long a, long b, long c, long d, long e, long f)
{
    unsigned long num;
    __asm__ volatile("" : "=a"(num));   //这样rax中存的参数就到这了
    int retv = 0;
    switch (num) {
    case 11: retv = sys_open(a, b); break;
    case 12: retv = sys_close(a); break;
    case 13: retv = sys_read(a, b, c); break;
    case 14: retv = sys_write(a, b, c); break;
    case 15: retv = sys_lseek(a, b, c); break;
    case SYSCALL_EXIT: retv = sys_exit(a); break;
    case SYSCALL_CALL: exec_call(a); break;
    case SYSCALL_BRK: retv = sys_brk(a); break;
    case SYSCALL_FREE: retv = sys_free(a); break;
    case SYSCALL_FORK: retv = sys_fork(); break;
    case SYSCALL_EXECVE: retv = sys_execve(a, b, c); break;
    case SYSCALL_WAIT: retv = sys_wait(a, b, c); break;
    case SYSCALL_MMAP: retv = sys_mmap(a, b, c, d, e, f); break;
    case SYSCALL_MUNMAP: retv = sys_munmap(a, b); break;
    case SYSCALL_MKNOD: retv = sys_mknod(a, b, c); break;
    }
    // __asm__ volatile("mov %0,%%eax\r\n mov %1,%%ebx\r\n mov %2,%%ecx\r\n mov %3,%%edx\r\n mov %4,%%esi\r\n mov %5,%%edi"\
    // ::"m"(func),"m"(a),"m"(b),"m"(c),"m"(d),"m"(e));
    // __asm__ volatile("int $0x80\r\n leave\r\n ret");
    do_signals();
    return retv;
}
void wrmsr(unsigned long address, unsigned long value)
{
    __asm__ __volatile__("wrmsr	\n\t" ::"d"(value >> 32), "a"(value & 0xffffffff), "c"(address)
                         : "memory");
}
ksym* get_ksym(off_t addr)
{
    extern char _binary_bin_kallsyms_bin_start[] __attribute__((weak)),
        _binary_bin_kallsyms_bin_end[] __attribute__((weak));
    ksym *sym = _binary_bin_kallsyms_bin_start, *bef = sym;
    off_t func_belonged = sym->addr;   //所属函数
    while (sym < _binary_bin_kallsyms_bin_end && sym->addr < addr) {
        bef           = sym;
        func_belonged = sym->addr;
        int namelen   = sym->namelen;
        sym += 1;
        sym = (off_t)sym + namelen;
    }
    return bef;
}
//根据给定的地址找到相应的内核符号，然后输出，如果找不到，就当成单纯的值输出。
int print_ksym(off_t addr)
{
    ksym* ks = get_ksym(addr);
    if (!ks) {
        comprintf("%l\n", addr);
        return 0;
    }
    else {
        char buf[100];
        memcpy(buf, ks + 1, ks->namelen);
        buf[ks->namelen] = 0;
        comprintf("%l %s(%l)+%l\n", addr, buf, ks->addr, addr - ks->addr);
        return 1;
    }
}
void backtrace()
{
    off_t* ret_stack = 0;
    __asm__ volatile("mov %%rbp,%0" : "=m"(ret_stack));
    ret_stack  = ret_stack[0];
    off_t addr = ret_stack[2];   //第一级返回函数地址
    comprintf("Backtrace:\n");
    print_ksym(addr);
    //回到用户栈，回溯
    ret_stack = ret_stack[0];
    for (int i = 0; i < 10; i++) {
        if (ret_stack < KNL_BASE) break;   //超过栈顶
        print_ksym(ret_stack[1]);
        ret_stack = ret_stack[0];
    }
}