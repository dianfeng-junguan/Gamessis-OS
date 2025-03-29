#include "int.h"
#include "clock.h"
#include "com.h"
#include "devman.h"
#include "driverman.h"
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
    // register_int(0, _debug, debug, TRAP_GATE);
    register_int(0, _divide_err, divide_err, TRAP_GATE);
    register_int(1, _debug, debug, TRAP_GATE);
    register_int(2, _default_int_proc, default_int_proc, TRAP_GATE);
    register_int(3, _breakpoint, breakpoint, TRAP_GATE);
    register_int(4, _overflow, overflow, TRAP_GATE);
    register_int(5, _bounds, bounds, TRAP_GATE);
    register_int(6, _undefined_operator, undefined_operator, TRAP_GATE);
    register_int(7, _coprocessor_notexist, coprocessor_notexist, TRAP_GATE);
    register_int(8, _double_ints, double_ints, TRAP_GATE);   // double_ints
    register_int(9, _coprocessor_seg_overbound, coprocessor_seg_overbound, TRAP_GATE);
    register_int(10, _invalid_tss, invalid_tss, TRAP_GATE);
    register_int(11, _segment_notexist, segment_notexist, TRAP_GATE);
    register_int(12, _stackseg_overbound, stackseg_overbound, TRAP_GATE);   //
    register_int(13, _general_protect, general_protect, TRAP_GATE);
    register_int(14, _page_err, page_err, TRAP_GATE);
    register_int(15, _default_int_proc, default_int_proc, TRAP_GATE);
    register_int(16, _coprocessor_err, coprocessor_err, TRAP_GATE);
    for (int i = 17; i < 48; i++)
        register_int(i, _default_int_proc, default_int_proc, TRAP_GATE);
    // register_int(0x21,(addr_t)key_proc,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
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
void die()
{
    com_puts("sys died.\n", PORT_COM1);
    printfk("sys died.\n");
    while (1) {
        // __asm__ volatile("hlt\n");
    }
}
void divide_err()
{
    comprintf("divide err\n");
}

void debug()
{
    comprintf("debug\n");
}
void default_int_proc()
{
    comprintf("default_int_proc\n");
}
void breakpoint()
{
    comprintf("breakpoint\n");
}
void overflow()
{
    comprintf("overflow\n");
}
void bounds()
{
    comprintf("bounds\n");
}
void undefined_operator(unsigned long long* rbp)
{
    comprintf("undef operator\nprogram has run to a non-code area.\n");
    backtrace(rbp);
    die();
}
void coprocessor_notexist()
{
    comprintf("coprocessor doesnt exist\n");
}
void double_ints()
{
    comprintf("FATAL:double interrupts\n");

    while (1) {}
}
void coprocessor_seg_overbound()
{
    comprintf("coprocessfor seg overdound\n");
}
void invalid_tss()
{
    comprintf("invalid tss\n");
}
void segment_notexist()
{
    comprintf("seg nonexistent\n");
}
void stackseg_overbound()
{
    comprintf("stack seg overbound\n");
}
void general_protect(long long rbp)
{
    com_puts("general protect.", PORT_COM1);
    long long* int_stk = current->tss.ists[0] - 48;
    long       addr = int_stk[1], err_code = int_stk[0];
    // __asm__ volatile("mov 16(%%rbp),%0" : "=r"(addr));
    // __asm__ volatile("mov 24(%%rbp),%0" : "=r"(err_code));
    comprintf("err code(seg descriptor):%x\n", err_code);
    comprintf("problem process pid:%d\n", current->pid);
    comprintf("occurred at %x\n", addr);
    backtrace(rbp);

    //处理问题进程
    if (current->pid == 1) {
        die();
    }
    //终结问题进程
    sys_exit(-1);
}

void coprocessor_err()
{
    comprintf("coprocessor err\n");
}

syscall_func_t syscall_table[MAX_SYSCALLS] = {
    [0 ... MAX_SYSCALLS - 1]               = (syscall_func_t)blank_syscall,
    [SYSCALL_EXIT]                         = (syscall_func_t)sys_exit,
    [SYSCALL_OPEN]                         = (syscall_func_t)sys_open,
    [SYSCALL_CLOSE]                        = (syscall_func_t)sys_close,
    [SYSCALL_READ]                         = (syscall_func_t)sys_read,
    [SYSCALL_WRITE]                        = (syscall_func_t)sys_write,
    [SYSCALL_SEEK]                         = (syscall_func_t)sys_lseek,
    [SYSCALL_TELL]                         = (syscall_func_t)sys_tell,
    [SYSCALL_EXIT]                         = (syscall_func_t)sys_exit,
    [SYSCALL_CALL]                         = (syscall_func_t)exec_call,
    [SYSCALL_BRK]                          = (syscall_func_t)sys_brk,
    [SYSCALL_FREE]                         = (syscall_func_t)sys_free,
    [SYSCALL_FORK]                         = (syscall_func_t)sys_fork,
    [SYSCALL_EXECVE]                       = (syscall_func_t)sys_execve,
    [SYSCALL_WAIT]                         = (syscall_func_t)sys_wait,
    [SYSCALL_MMAP]                         = (syscall_func_t)sys_mmap,
    [SYSCALL_MUNMAP]                       = (syscall_func_t)sys_munmap,
    [SYSCALL_MKNOD]                        = (syscall_func_t)sys_mknod,
    [SYSCALL_CHKMMAP]                      = (syscall_func_t)sys_chk_mmap,
    [SYSCALL_SBRK]                         = (syscall_func_t)sys_sbrk,
    [SYSCALL_READDIR]                      = (syscall_func_t)sys_readdir,
    [SYSCALL_CHDIR]                        = (syscall_func_t)sys_chdir,
    [SYSCALL_RENAME]                       = (syscall_func_t)sys_rename,
    [SYSCALL_REMOVE]                       = (syscall_func_t)sys_remove,
    [SYSCALL_DRV_IOCTL]                    = (syscall_func_t)drv_ioctl,
    [SYSCALL_REBOOT]                       = (syscall_func_t)sys_reboot,
    [SYSCALL_GETCWD]                       = sys_getcwd,
    [SYSCALL_CREATE_WINDOW]                = sys_create_window,
    [SYSCALL_DESTROY_WINDOW]               = sys_destroy_window,
    [SYSCALL_SHOW_WINDOW]                  = sys_show_window,
    [SYSCALL_HIDE_WINDOW]                  = sys_hide_window,
    [SYSCALL_RESIZE_WINDOW]                = sys_resize_window,
    [SYSCALL_MOVE_WINDOW]                  = sys_move_window,
    [SYSCALL_SET_WINDOW_TEXT]              = sys_set_window_text,
    [SYSCALL_ATTACH_WINDOW]                = sys_attach_window,
    [SYSCALL_DETACH_WINDOW]                = sys_detach_window,
    [SYSCALL_ADD_WINDOW_EVENT_LISTENER]    = sys_add_window_event_listener,
    [SYSCALL_REMOVE_WINDOW_EVENT_LISTENER] = sys_remove_window_event_listener,
    [SYSCALL_SEND_WINDOW_EVENT]            = sys_send_window_event,
    [SYSCALL_GET_WINDOW_TEXT]              = sys_get_window_text,
    [SYSCALL_GET_EVENT]                    = sys_fetch_event,
    [SYSCALL_DEFAULT_DEAL_WINDOW_EVENT]    = sys_default_deal_window_event,
    [SYSCALL_CREATE_CONSOLE]               = sys_create_console,
    [SYSCALL_DESTROY_CONSOLE]              = sys_destroy_console,
    [SYSCALL_ATTACH_CONSOLE]               = sys_attach_console,
    [SYSCALL_DETACH_CONSOLE]               = sys_detach_console,
    [SYSCALL_SEND_SIGNAL]                  = sys_send_signal,

};
int blank_syscall()
{
    return 0;
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
unsigned long long syscall(long a, long b, long c, long d, long e, long f)
{
    unsigned long num;
    __asm__ volatile("" : "=a"(num));   //这样rax中存的参数就到这了
    if (num >= MAX_SYSCALLS) {
        return -1;
    }
    unsigned long long retv = syscall_table[num](a, b, c, d, e, f);
    do_signals();
    //处理信号之后，可能进程状态被改变,需要重新调度。
    while (current && current->stat == TASK_SUSPENDED) {
        schedule();
    }
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
        sym = (off_t)sym + namelen + 1;
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
void backtrace(unsigned long long* rbp)
{
    // off_t* ret_stack = 0;
    // __asm__ volatile("mov %%rbp,%0" : "=m"(ret_stack));
    // ret_stack  = current->tss.ists[0] - 48;
    comprintf("Backtrace:\n");
    unsigned long long* pc = current->tss.ists[0] - 40;
    print_ksym(*pc);
    print_ksym(rbp[1]);
    rbp = rbp[0];
    //回到用户栈，回溯
    for (int i = 0; i < 10; i++) {
        if (rbp < KNL_BASE)
            break;   //超过栈顶
        print_ksym(rbp[1]);
        rbp = rbp[0];
    }
}