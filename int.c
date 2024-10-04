#include "int.h"
#include "clock.h"
#include "devman.h"
#include "proc.h"
#include "memory.h"
#include "virfs.h"
#include "exe.h"
#include "syscall.h"
#include "kb.h"
#include "framebuffer.h"

gate *idt= (gate *) IDT_ADDR;
extern int disk_int_handler();
void init_int(){
    //asm volatile("sidt %0"::"m"(idt));
    set_gate(0,(addr_t)divide_err,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
    set_gate(1,(addr_t)debug,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
    set_gate(2,(addr_t)default_int_proc,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
    set_gate(3,(addr_t)breakpoint,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
    set_gate(4,(addr_t)overflow,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
    set_gate(5,(addr_t)bounds,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
    set_gate(6,(addr_t)undefined_operator,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
    set_gate(7,(addr_t)coprocessor_notexist,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
    set_gate(8,(addr_t)double_ints,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);//double_ints
    set_gate(9,(addr_t)coprocessor_seg_overbound,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
    set_gate(10,(addr_t)invalid_tss,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
    set_gate(11,(addr_t)segment_notexist,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
    set_gate(12,(addr_t)stackseg_overbound,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);//
    set_gate(13,(addr_t)general_protect,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
    set_gate(14,(addr_t)page_err,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
    set_gate(15,(addr_t)default_int_proc,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
    set_gate(16,(addr_t)coprocessor_err,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
    for (int i=17;i<48;i++)
        set_gate(i,(addr_t)default_int_proc,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
	set_gate(0x21,(addr_t)key_proc,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//
    //set_gate(0x2c,mouse_proc,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
    //启动8259A
    
	//ICW1
	outb(0x20,0x11);
	outb(0xA0,0x11);
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
	outb(0xA1,0x28);
	//ICW3
	outb(0x21,0x04);
	outb(0xA1,0x02);
	//ICW4
	outb(0x21,0x01);
	outb(0xA1,0x01);

    turn_on_int();

}
void set_gate(u8 index,addr_t offset,u16 selector,u16 attr)
{
#ifdef IA32
    idt[index].offset_low=offset&0xffffu;
    idt[index].offset_high=(offset>>16)&0xffffu;
    idt[index].attr=attr;
    idt[index].selector=selector;
#else
    idt[index].offset_low=offset&0xffff;
    idt[index].offset_mid=(offset>>16)&0xffff;
    idt[index].offset_high=(offset>>32)&0x0000ffff;
    idt[index].attr=attr;
    idt[index].selector=selector;
    idt[index].rsvd=0;
#endif
}

void divide_err(){
    asm("cli");
    //puts("divide err");
    eoi();
    __asm__ volatile ("sti \r\n leave \r\n iretq");
}

void debug(){
    asm("cli");
    //puts("debug");
    eoi();
    __asm__ volatile ("sti \r\n leave \r\n iretq");
}
void default_int_proc(){
    asm("cli");
    //puts("default_int_proc");
    eoi();
    __asm__ volatile ("sti \r\n leave \r\n iretq");
}
void breakpoint(){
    asm("cli");
    //puts("breakpoint");
    eoi();
    __asm__ volatile ("sti \r\n leave \r\n iretq");
}
void overflow(){
    asm("cli");
    //puts("overflow");
    eoi();
    __asm__ volatile ("sti \r\n leave \r\n iretq");
}
void bounds(){
    asm("cli");
    //puts("bounds");
    eoi();
    __asm__ volatile ("sti \r\n leave \r\n iretq");
}
void undefined_operator(){
    //puts("undef operator");
    eoi();
    report_back_trace_of_err();
    __asm__ volatile ("jmp .\r\n leave \r\n iretq");
}
void coprocessor_notexist(){
    asm("cli");
    //puts("coprocessor doesnt exist");
    eoi();
    __asm__ volatile ("sti \r\n leave \r\n iretq");
}
void double_ints(){
    asm("cli");
    //puts("double interrupts");
    eoi();
    __asm__ volatile ("sti \r\n leave \r\n iretq");
}
void coprocessor_seg_overbound(){
    //puts("coprocessfor seg overdound");
    eoi();
    __asm__ volatile ("leave \r\n iretq");
}
void invalid_tss(){
    asm("cli");
    //puts("invalid tss");
    eoi();
    __asm__ volatile ("sti \r\n leave \r\n iretq");
}
void segment_notexist(){
    asm("cli");
    //puts("seg nonexistent");
    eoi();
    __asm__ volatile ("sti \r\n leave \r\n iretq");
}
void stackseg_overbound(){
    asm("cli");
    //puts("stack seg overbound");
    eoi();
    __asm__ volatile ("sti \r\n leave \r\n iretq");
}
void general_protect(){
    //print("general protect.");
    int err_code=0;
    /* asm volatile("mov 4(%%ebp),%0":"=r"(err_code));
    printf("err code:%x\n",err_code);
    unsigned int addr=0;
    asm volatile("mov 8(%%ebp),%0":"=r"(addr));
    printf("occurred at %x\n",addr);
    extern int cur_proc;
    extern struct process *task;
    if(task[cur_proc].pid==1)//系统进程
    {
        printf("sys died. please reboot.\n");
        asm volatile("jmp .");
    }
    //杀死问题进程
    del_proc(cur_proc);
    printf("killed the problem process.\n");
	printf("shell:>");
    switch_proc_tss(0); */
    eoi();
    __asm__ volatile ("leave\r\n add $8,%rsp \r\n iretq");
}

void coprocessor_err(){
    asm("cli");
    //puts("coprocessor err");
    eoi();
    __asm__ volatile ("sti \r\n leave \r\n iretq");
}
int syscall(int func,int b,int c,int d,int e,int f)
{
    switch (func)
    {
        case 0:return reg_device(b);
        case 1:return dispose_device(b);
        case 2:return reg_driver(b);
        case 3:return dispose_driver(b);
        case 4:return call_drv_func(b,c,d);
        case 5:return req_page_at(b,c);
        case 6:return free_page(b);
        case 7:return reg_proc(b, c, d);
        case 8:del_proc(b);
        case 10:chk_vm(b,c);
        case 11:return sys_open(b,c);
        case 12:return sys_close(b);
        case 13:return sys_read(b,c,d);
        case 14:return sys_write(b,c,d);
        case 15:return sys_seek(b,c,d);
        case 16:return sys_tell(b);
        case 17:return reg_vol(b,c,d);
        case 18:return free_vol(b);
        case 19:return execute(b);
        case SYSCALL_EXIT:return sys_exit(b);
        case SYSCALL_CALL:return exec_call(b);
        case SYSCALL_MKFIFO:return sys_mkfifo(b);
        case SYSCALL_MALLOC:return sys_malloc(b);
        case SYSCALL_FREE:return sys_free(b);
        case SYSCALL_KB_READC:return sys_getkbc();
        case SYSCALL_FIND_DEV:return sys_find_dev(b);
        case SYSCALL_OPERATE_DEV:return sys_operate_dev(b,c,d);
    }
    // __asm__ volatile("mov %0,%%eax\r\n mov %1,%%ebx\r\n mov %2,%%ecx\r\n mov %3,%%edx\r\n mov %4,%%esi\r\n mov %5,%%edi"\
    // ::"m"(func),"m"(a),"m"(b),"m"(c),"m"(d),"m"(e));
    // __asm__ volatile("int $0x80\r\n leave\r\n ret");
}
void wrmsr(unsigned long address,unsigned long value)
{
    __asm__ __volatile__	("wrmsr	\n\t"::"d"(value >> 32),"a"(value & 0xffffffff),"c"(address):"memory");
}