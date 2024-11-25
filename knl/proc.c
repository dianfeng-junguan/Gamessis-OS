//
// Created by Oniar_Pie on 2023/11/9.
//
#include "vfs.h"
#include "proc.h"
#include "memory.h"
#include "pe.h"
#include "int.h"
#include "mem.h"
#include "log.h"
#include "kb.h"
#include "syscall.h"
#include "tty.h"
#include "fcntl.h"
#include "clock.h"


struct process *task=0;//[MAX_PROC_COUNT];
struct process* current;
TSS scene_saver;
TSS *tss=0xffff800000108000ul;
int cur_proc=0;
int pidd=0;
int palloc_paddr=0;
static pid_t sidd=0;
void init_proc(){
    //task=(struct process*)get_global_var(TASK_PCBS_ADDR);//[MAX_TASKS];;
    task=(struct process*)kmallocat(0,13);
    for(int i=0;i<MAX_PROC_COUNT;i++){
        task[i].pid=-1;
        task[i].stat=TASK_EMPTY;
        task[i].parent_pid=-1;
    }
    cur_proc=0;//proc zero
    current=task;
    pidd=1;


    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
    set_tss(0x400000+KNL_BASE,0x400000+KNL_BASE,0x400000+KNL_BASE\
    ,0x800000+KNL_BASE,0x800000+KNL_BASE,0x800000+KNL_BASE,0x800000+KNL_BASE\
    ,0x800000+KNL_BASE,0x800000+KNL_BASE,0x800000+KNL_BASE);

    //===============创建0号进程======================
    int zi= init_proc0();
    task[zi].stat=TASK_READY;
    //IA32_INTERRUPT_SSP_TABLE_ADDR，准备IST
    wrmsr(0x6a8,tss->rsvd2);
    //把内核代码段选择子写到MSR寄存器中准备用于特权级转换(sysexit，现在没用)
    wrmsr(0x174,0x8);
    //准备用于特权级转换(sysret，正在使用)
    wrmsr(0xc0000081,0x0020000800000000ul);

    comprintf("proc init set.\r\ntss.ist=0x%p\r\n",tss->ists[0]);
    //创建一个测试进程
//    create_test_proc();
}
void create_test_proc(){

    int index=req_proc();
    task[index].stat=TASK_READY;
    int currsp=0x9fc00-1;
    asm volatile("mov %%rsp,%0":"=m"(currsp));
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
             0x7e00- sizeof(stack_store_regs), 0, 0, 0, (long)_syscall_sysret, 0, index);
    task[index].tss.rsp0=0x400000;
    task[index].mem_struct.stack_top=0x7e00;
    task[index].mem_struct.stack_bottom=0x6e00;
    task[index].mem_struct.heap_top=0x1101000;
    task[index].mem_struct.heap_base=0x1100000;

    //把还原现场时用到的堆栈设置好
    stack_store_regs *str= (stack_store_regs *) (0x7e00 - sizeof(stack_store_regs));
    str->rax=0;
    str->rbx=0;
    str->rcx=proc_zero;//sysret采用的返回地址
    str->rdx=0;
    str->rsi=0;
    str->rdi=0;
    str->r15=0;
    str->r14=0;
    str->r13=0;
    str->r12=0;
    str->r11=0x200;
    str->r10=0;
    str->r9=0;
    str->r8=0;
    str->rip=proc_zero;
    str->cs=0x8;
    str->rflags=0x00200206;
    str->rsp=0x7e00;
    str->ss=0x2b;
    str->ds=0x2b;
    str->es=0x2b;

}
int init_proc0()
{

    task[0].pid=pidd++;
    task[0].stat=TASK_RUNNING;
    task[0].utime=0;
    task[0].priority=0;

    struct process *pz=task;
    // addr_t currsp=KNL_BASE+0x400000;
    // set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
    //          currsp, 0, 0, 0, (long)proc_zero, 0, 0);
//    task[index].tss.eip=(long)proc_zero;
    extern struct dir_entry* dtty;
    //stdin stdout stderr
    //这里绕开了sys open，这样是为了尽量快
    extern struct file ftty;
    pz->openf[0]=(struct file*)&ftty;
    pz->openf[1]=(struct file*)&ftty;
    pz->openf[2]=(struct file*)&ftty;

    pz->mem_struct.stack_top=STACK_TOP;
    pz->mem_struct.stack_bottom=STACK_TOP;
    pz->mem_struct.heap_top=HEAP_BASE;
    pz->mem_struct.heap_base=HEAP_BASE;
    memcpy(&pz->tss,tss, sizeof(TSS));

    pz->child_procs=NULL;

    //这个是进程切换的时候要读取的值
    pz->regs.cr3=PML4_ADDR&~KNL_BASE;
    pz->pml4=PML4_ADDR;
    pz->cwd=root_sb->root;
    pz->exef=NULL;
    list_init(&pz->node);
    pz->node.data=pz;
    
    pz->gpid=pz->pid;
    pz->sid=pz->pid;
    pz->fg_pgid=pz->pid;
    pz->in_bgpg=0;
    return 0;
}
int req_proc(){
    int num=0;
    while(task[num].pid!=-1 && task[num].stat != TASK_EMPTY && \
    num<=MAX_PROC_COUNT){
        num++;
    }
    if(num>=MAX_PROC_COUNT)
        return -1;
    task[num].pid=pidd++;
    task[num].stat=TASK_ZOMBIE;
    task[num].utime=0;
    task[num].priority=0;
    return num;
}
void set_proc(long rax, long rbx, long rcx, long rdx, long es, long cs, long ss, long ds, long fs, long gs, long rsp,
              long rbp, long rsi, long rdi, long rip, long rflags, int proc_nr) {
    struct process* proc=&task[proc_nr];
    proc->regs.rax=rax;
    proc->regs.rbx=rbx;
    proc->regs.rcx=rcx;
    proc->regs.rdx=rdx;
    proc->regs.es=es;
    proc->regs.cs=cs;
    proc->regs.ss=ss;
    proc->regs.ds=ds;
    proc->regs.fs=fs;
    proc->regs.gs=gs;
    proc->regs.rsp=rsp;
    proc->regs.rbp=rbp;
    proc->regs.rsi=rsi;
    proc->regs.rdi=rdi;
    proc->regs.rflags=0x202;//设置为默认值:0b 0010 0000 0010
    //能接受中断
    proc->regs.rip=rip;

    proc->regs.cs=cs;
    proc->regs.ds=ds;
    proc->regs.es=es;
    proc->regs.cr3=PML4_ADDR;//get_phyaddr(n1);//暂时先搞成全局
    proc->pml4=PML4_ADDR;


}
void proc_zero()
{
//    asm volatile("mov $27,%rax\n"
//                 ".byte 0x48\n"
//                 "syscall");
//    long rax;
//    asm volatile("":"=a"(rax));
//    if(rax==0){
//        printf("child proc ret:%d\n",rax);
//    }else{
//        printf("parent proc ret:%d\n",rax);
//    }
    while (1)
    {
        char c= sys_analyse_key();
        putchar(c);
    }
}
void save_rsp(){
    //在时钟中断context下
    addr_t * p=INT_STACK_TOP-16;
    current->regs.rsp=*p;
}
void manage_proc(){
    if(cur_proc!=-1)
        task[cur_proc].utime++;
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
    task[cur_proc].stat != TASK_READY){
        if(cur_proc!=-1)
            task[cur_proc].utime=0;
        //find
        int i=cur_proc+1;
        int times=0;
        //轮询，直到有一个符合条件
        while(times<10){
            if(task[i].pid!=-1 && task[i].stat == TASK_READY && i != cur_proc){
                break;
            }
            i++;
            if(i>=MAX_TASKS){
                times++;
                i=0;
            }
        }
        if(times==10)return;//超过十次尝试都没有，暂时不切换
        //switch
        task[cur_proc].stat=TASK_READY;
        task[i].stat=TASK_RUNNING;
        switch_to(&task[cur_proc], &task[i]);
    }
    return;
}

void switch_proc_tss(int pnr)
{
    int sel=_TSS_IND(pnr)*8;
    cur_proc=pnr;
    switch_proc_asm(sel);
}
void switch_proc(int pnr){
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
    save_context(&task[cur_proc].tss);
//    //重新设置0号进程
//    task[0].tss.eip=proc_zero;
//    task[0].tss.cr3=PAGE_INDEX_ADDR;
//    task[0].tss.eflags=0x202;
    cur_proc=pnr;
    int sel=_TSS_IND(pnr)*8;
    switch_to(NULL, &task[pnr].tss);
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
void save_context_c(void* ctx,void *int_stk)
{
    unsigned long long* rs=ctx;
    current->regs.rbp=rs[0];
    current->regs.rip=((unsigned long long*)int_stk)[0];
}

/* int exec(char *path,int priority)
{
    //enter_dir(path);
    char name[20];
    //get_fname(path,name);
    strcpy(name,path);
    if(!verify_name(name))
    {
        //printf("err: invalid file name\n");
        return -1;
    }
    format_name(name);
    //printf("final format:%s\n",name);
    if(load_pe_header(name)==-1)
    {
        puts("err: shell not found");
        return -1;
    }
    IMAGE_NT_HEADERS32* h32=load_ntheader(name);
    dir_entry f=get_peentry();
    int index=create_proc();
    task[index].priority=priority;
    if(priority<3)
    {
        task[index].tss.es=0x10;
        task[index].tss.ds=0x10;
        task[index].tss.ss=0x10;
        task[index].tss.gs=0x10;
        task[index].tss.fs=0x10;
        task[index].tss.cs=0x8;
    }
    //printf("index:%d\n",index);
    if(index==-1)
    {
        puts("err:failed to req proc.");
        return -1;
    }
    int shell_addr=h32->OptionalHeader.AddressOfEntryPoint+\
    h32->OptionalHeader.ImageBase;
    task[index].tss.eip=shell_addr;
    //printf("EIP:%x===\n",shell_addr);
    //readFile(f,f.len,shell_addr);
    //为新进程分配内存页
    //计算所需的页
    int prog_size=h32->OptionalHeader.SizeOfImage;
    int page_count=prog_size/4096+prog_size%4096==0?0:1;
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
    //
    int pgind_n=req_a_page();
    if(pgind_n==-1)
    {
        puts("err: failed to req pgind");
        return -1;
    }
    page_item *pgind=get_phyaddr(pgind_n);
    task[index].tss.cr3=pgind;
    //printf("the cr3 should be:%x\n",pgind);
    //分配内核页目录
    set_page_item(pgind,PAGE_TABLE_ADDR,PAGE_PRESENT);
    //alloc pgind
    pgind+=start_pgind_item;
    for(int i=0;i<page_index_item_count;i++)
    {
        //alloc page table
        int pgtbln=req_a_page();
        if(pgtbln==-1)
        {
            puts("err: failed to req pgtbl");
            return -1;
        }
        page_item* pgtbladdr=get_phyaddr(pgtbln);
        set_page_item(pgind++,pgtbladdr,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
        for(int j=0;j<page_count&&j<1024;j++)
        {
            int pg=req_a_page();
            if(pg==-1)
            {
                puts("err: failed to req pg");
                return -1;
            }
            unsigned int pgaddr=get_phyaddr(pg);
            page_item *pp=pgtbladdr;
            set_page_item(pgtbladdr++,pgaddr,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
            //printf("page alloc:%x at %x\n",*pp,pgtbladdr-1);
        }
        page_count-=1024;
    }
    //sys_read sections
    IMAGE_NT_HEADERS32 copynth;
    memcpy(&copynth,h32,sizeof(copynth));
    h32=&copynth;
    IMAGE_SECTION_HEADER* psec=get_secheader(name);
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    h32->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
    int align=h32->OptionalHeader.FileAlignment;
    data_start=data_start%align?data_start-data_start%align+align:data_start;
    //printf("datastart:%x\n",data_start);
    //printf("number of sec:%d\n",h32->FileHeader.NumberOfSections);
    for(int i=0;i<h32->FileHeader.NumberOfSections;i++,psec++)
    {
        ////printf("[SEC %s]\n",psec->Name);
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
        if(disca)
            continue;
        int pgind_i=psec->VirtualAddress/PAGE_INDEX_SIZE;
        //printf("pgind_i:%x\n",pgind_i);
        int pg_i=psec->VirtualAddress%PAGE_INDEX_SIZE/PAGE_SIZE;
        page_item *pgindp=task[index].tss.cr3;
        pgindp+=pgind_i;
        page_item *pgp=*pgindp&0xfffff000;
        //printf("page index item at %x refers to the page table at %x\n",pgindp,pgp);
        //printf("RVA:%x\n",psec->VirtualAddress);
        //printf("RVA in page:%x\n",psec->VirtualAddress%PAGE_SIZE); 
        //printf("Section Size:%x\n",psec->SizeOfRawData);
        int load_addr=*pgp&0xfffff000;
        load_addr+=psec->VirtualAddress%PAGE_SIZE;
        //printf("loading sec to %x\n",load_addr);
        int fpos=psec->PointerToRawData;
        //printf("ptr to data:%x\n",fpos);
        int data_size=psec->SizeOfRawData;
        data_size+=4096-data_size%4096;
        int sec_rn=read_file(f,load_addr,fpos,data_size);
        if(sec_rn==-1)
        {
            //printf("err: sys_read file failure\n");
            return -1;
        }else
            //printf("[fs]sys_read %d secs.\n",sec_rn);
    }
    //申请栈内存空间,设置esp
    int stack_size=h32->OptionalHeader.SizeOfStackCommit;
    if(stack_size>0x1000)stack_size=0x1000;
    int stack_laddr=palloc(index,stack_size);
    int stack_paddr=palloc_paddr;
    task[index].tss.esp=stack_laddr+stack_size;
    //入栈main函数的参数和ret所需
    task[index].tss.esp-=12;
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;
    //printf("stack dat:%x %x %x\n",*pptr,*(pptr+1),*(pptr+2));
    //printf("esp :%x\n",task[index].tss.esp);
    //填充ldt
    /* fill_ldt_desc(stack_laddr,stack_size/4096,SEG_PRESENT|SEG_W|SEG_NON_SYS_GATE|\
    SEG_R|SEG_4KB_GRANUALITY,&task[index].ldt[3]);
    fill_ldt_desc(h32->OptionalHeader.ImageBase,h32->OptionalHeader.SizeOfImage/4096,\
    SEG_CONFORMING|SEG_X|SEG_PRESENT|SEG_R|SEG_NON_SYS_GATE|SEG_4KB_GRANUALITY,&task[index].ldt[1]);
    fill_ldt_desc(h32->OptionalHeader.ImageBase,h32->OptionalHeader.SizeOfImage/4096,\
    SEG_W|SEG_PRESENT|SEG_R|SEG_NON_SYS_GATE|SEG_4KB_GRANUALITY,&task[index].ldt[2]);
    fill_desc(task[index].ldt,sizeof(task[index].ldt),SEG_SYS_LDT|SEG_PRESENT,\
    _LDT_IND(index)); 
    task[index].stat=TASK_READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
    int page_c=size/4096+size%4096?1:0;
    int c=0;
    void *ptr=NULL;
    page_item *pgind=NULL;//task[proc_index].tss.cr3;
    pgind++;
    for(int i=1;i<1024;i++)
    {
        page_item* tblp=*pgind&0xfffff000;
        for(int j=0;j<1024;j++)
        {
            int v=*tblp&PAGE_PRESENT;
            if(!v)
            {
                int new_pg=req_a_page();
                if(new_pg==-1)
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
                    size+=c;
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
                    int tmp_attr=task[proc_index].ldt[2].attr;
                    tmp_attr&=0xfff0;
                    tmp_attr+=(size>>16)&0xf;
                    task[proc_index].ldt[2].attr=tmp_attr;
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
                }
                int addr=get_phyaddr(new_pg);
                set_page_item(tblp,addr,PAGE_PRESENT|\
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
                if(ptr==NULL)
                {
                   // ptr=laddr;
                    palloc_paddr=addr;
                }
                page_c--;
                c++;
                if(page_c==0)
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
                    size+=c;
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
                    int tmp_attr=task[proc_index].ldt[2].attr;
                    tmp_attr&=0xfff0;
                    tmp_attr+=(size>>16)&0xf;
                    task[proc_index].ldt[2].attr=tmp_attr;
                    return ptr;
                }
            }
            tblp++;
        }
        pgind++;
    }
    return NULL;
}
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
    return palloc(cur_proc,size);
}
void proc_end()
{
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    //asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
    del_proc(cur_proc);
    if(task[cur_proc].parent_pid!=-1){
        task[task[cur_proc].parent_pid].stat=TASK_READY;
        switch_proc_tss(task[cur_proc].parent_pid);
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
void del_proc(int pnr)
{
    task[pnr].stat=TASK_ZOMBIE;
//    task[pnr].pid=-1;
    //释放申请的页面
    release_mmap(&task[pnr]);
    //释放存放页目录的页面
    kmfree(task[pnr].pml4);
    //关闭打开的文件
    for(int i=3;i<MAX_PROC_OPENF;i++){
        if(task[pnr].openf[i]){
            sys_close(i);
        }
    }
    //三个std判断一下是否是会话leader，是的话再关闭
    if(task[pnr].sid==task[pnr].pid){
        //tty和console断联
        sys_ioctl(0,TTY_DISCONNECT,0);
        sys_close(0);
        sys_close(1);
        sys_close(2);
        //然后,关闭所有前台进程组的进程
        for(int i=0;i<MAX_TASKS;i++){
            if(task[i].gpid==task[pnr].pid){
                //TODO:发送SIGHUP信号使进程终结
            }
        }
    }
    //TODO 给子进程发送SIGHUP信号结束他们
    //
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}

int set_proc_stat(int pid,int stat)
{
    if(pid==-1)return -1;
    int i=0;
    for(;task[i].pid!=pid;i++);
    if(i==MAX_PROC_COUNT)return -1;
    task[i].stat=stat;
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
        task[cur_proc].utime=MAX_UTIME;
    return 0;
}
/* 
int exec_call(char * path,int priority)
{
    int tski=exec(path, priority);
    if(tski==-1)return -1;
    task[cur_proc].stat=TASK_SUSPENDED;
    
    task[tski].parent_pid=cur_proc;//设置父进程，这样进程结束后就能返回到父进程。

    int tss=_TSS_IND(tski)*8;

    switch_proc_tss(tski);

    return 0;
} */

//int add_proc_openf(struct index_node *entry)
//{
//    for(int i=0;i<MAX_PROC_OPENF;i++){
//        if(task[cur_proc].openf[i]==NULL)
//        {
//            task[cur_proc].openf[i]=entry;
//            return 0;
//        }
//    }
//    return -1;//full
//}
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
    current->exit_code=code;
    del_proc(cur_proc);
    while(1)
        manage_proc();
    return code;
}
/*int load_dll_at(char *path,int addr)
{
    extern dir_entry cur_dir;
    //第一页用作存储头
    req_page_at(addr,1);
    dir_entry f,dir=cur_dir;
    get_entry(path,&f,dir);
    //内核函数不检错
    read_file(f,addr,0,4096);
    PIMAGE_DOS_HEADER dh=addr;
    PIMAGE_NT_HEADERS32 nth=addr+dh->e_lfanew;
    PIMAGE_SECTION_HEADER sh=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
    int oldbase=nth->OptionalHeader.ImageBase;
    int msize=nth->OptionalHeader.SizeOfImage;
    req_page_at(addr,msize/4096);
    //读section
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++)
    {
        u32 chars=sh[i].Characteristics;
        if(chars&IMAGE_SCN_MEM_DISCARDABLE)continue;//可以抛弃
        read_file(f,addr+sh[i].VirtualAddress,\
        sh[i].PointerToRawData,sh[i].SizeOfRawData);
    }
    //重定位
    PIMAGE_BASE_RELOCATION relp=0;
    if(nth->OptionalHeader.DataDirectory[5].Size==0)goto dllmain;
    relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
                                +(u32)addr);
    IMAGE_BASE_RELOCATION emptyr={0};
    u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
    u16 *rtype=reloc+1;
    while(memcmp(relp,&emptyr,sizeof(IMAGE_BASE_RELOCATION))!=0){
        int pgva=relp->VirtualAddress+addr;
        for(int i=0;i<relp->SizeOfBlock/4;i++)
        {
            if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
            int *at=*reloc+pgva;//要重定位的数据的地址
            *at=*at-oldbase+addr;
            //下一个
            reloc+=2;
            rtype+=2;
        }
        relp=(int)relp+0x1000;
    }
dllmain:
    //重定位完毕，准备调用DllMain
    typedef int (*DllMain)(void*,u32,void*);
    DllMain dllmain=nth->OptionalHeader.AddressOfEntryPoint+addr;
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(addr_t entry, struct index_node *cwd, struct index_node *exef)
{
    
    int i=req_proc();
    if(i==-1)return -1;

    //栈顶设置在了4G处
    set_proc(0, 0, 0, 0, DS_USER, CS_USER, DS_USER, DS_USER\
, DS_USER, DS_USER, STACK_TOP, 0, 0, 0, entry, 0, i);
    task[i].pml4= kmalloc();
    task[i].pml4[0]= kmalloc();
    unsigned long *pdpt=task[i].pml4;
    //pdpt第一项(0-1GB)设置为内核空间，这样才能访问中断
    set_1gb_pdpt(pdpt,0,PAGE_PRESENT|PAGE_RWX);

    //申请一项pd,里面申请一2mb页用于堆栈
    addr_t *stackb= kmalloc();
    pdpt[3]=(unsigned long)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//3-4G分配栈空间
    set_2mb_pde(stackb + 511, get_phyaddr(req_a_page()), PAGE_FOR_ALL|PAGE_RWX);
    task[i].regs.cr3=task[i].pml4;

    task[i].stat=TASK_READY;
    task[i].cwd=cwd;
    task[i].exef=exef;

    return i;

/*
    //文件头基地址获取
    PIMAGE_DOS_HEADER dh=base;
    PIMAGE_NT_HEADERS32 nth=base+dh->e_lfanew;
    set_proc(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,i);
    task[i].tss.eip=nth->OptionalHeader.AddressOfEntryPoint+base;
    //申请内存存放页目录
    int pgind_addr=get_phyaddr(req_a_page());
    page_item *pgind=pgind_addr;
    set_page_item(pgind,PAGE_INDEX_ADDR,PAGE_PRESENT);//内核页
    set_page_item(pgind+7,PAGE_INDEX_ADDR+7*4,PAGE_PRESENT);//系统页
    int pgn=nth->OptionalHeader.SizeOfImage/4096;
    int vbase=nth->OptionalHeader.ImageBase;
    //设置程序所在的页面
    int pgin=pgn<1024?1:pgn/1024;
    int pgii=vbase/4096/1024;//开始的页目录索引号
    int pgn_used=0;
    for(int j=0;j<pgin;j++)
    {
        page_item *phy=get_phyaddr(req_a_page());
        //先设置页目录
        set_page_item(pgind+pgii+j,phy,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
        //再设置页表
        for(int k=0;k<1024;k++)
        {
            if(pgn_used>=pgn)break;
            set_page_item(phy,base+pgn_used*4096,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
            phy++;
            pgn_used++;
        }        
    }
    //写入cr3
    task[i].tss.cr3=pgind;
    task[i].tss.es=0x10;
    task[i].tss.ds=0x10;
    task[i].tss.ss=0x10;
    task[i].tss.gs=0x10;
    task[i].tss.fs=0x10;
    task[i].tss.cs=0x8;
    
    //申请栈内存空间,设置esp
    int stack_size=nth->OptionalHeader.SizeOfStackCommit;
    if(stack_size>0x1000)stack_size=0x1000;
    int stack_laddr=palloc(i,stack_size);
    int stack_paddr=palloc_paddr;
    task[i].tss.esp=stack_laddr+stack_size;
    //入栈main函数的参数和ret所需
    task[i].tss.esp-=12;
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}

void * sys_malloc(size_t size)
{
    /* //
    size_t new_heaptop=current->mem_struct.heap_top+size;
    size_t npgc=PAGE_4K_ALIGN(new_heaptop-current->mem_struct.heap_base)/PAGE_4K_SIZE;
    size_t opgc=PAGE_4K_ALIGN(current->mem_struct.heap_top-current->mem_struct.heap_base)/PAGE_4K_SIZE;
    off_t htop=PAGE_4K_ALIGN(current->mem_struct.heap_top);
    while (npgc>opgc)
    {
        smmap(pmalloc(),htop,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,current->pml4);
        htop=PAGE_4K_ALIGN(htop+1);
        opgc++;
    }
    void *data=current->mem_struct.heap_top;
    current->mem_struct.heap_top=new_heaptop;
    return data; */
    

    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
        hp=hp->next;
    if(hp->pgn<n)
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
        {
            //超过顶部
            return NULL;
        }
        int needed=n-hp->pgn;
        char* p=task[cur_proc].mem_struct.heap_top;
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
        {
            *p=0;//触发缺页中断
            p+=PAGE_SIZE;
        }
    }
    if(hp->pgn>n)
    {
        //在后面新建一个头
        char *p=hp;
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
        chunk_header *np=p;
        np->pgn=hp->pgn-n-1;
        np->next=hp->next;
        np->prev=hp;
        hp->next=np;
    }
    hp->alloc=1;//分配完毕
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
}
int sys_free(int ptr)
{
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
    hp->alloc=0;    //合并
    //向后合并
    chunk_header *p=hp->next;
    while(p!=NULL)
    {
        if(p->alloc==0)
        {
            hp->pgn+=p->pgn+1;//把区域合并
        }else
            break;
        p=p->next;
    }
    //向前合并
    p=hp->prev;
    while(p!=NULL)
    {
        if(p->alloc==0)
        {
            p->pgn+=hp->pgn+1;//把区域合并
        }else
            break;
        p=p->prev;
    }
    //合并完成
    return 0;
}

void switch_to(struct process *from, struct process *to) {
    cur_proc=to-task;
    current=&task[cur_proc];
    //cr3需要物理地址,regs.cr3里面填的就是物理地址
    asm volatile("mov %0,%%rax\n"
                 "mov %%rax,%%cr3\n":"=m"(to->regs.cr3));
    asm volatile("mov %%rsp,%0\r\n"
                 "lea done(%%rip),%%rax\r\n"
                 "mov %%rax,%1\r\n"
                 "mov %%fs,%2\r\n"
                 "mov %%gs,%3\r\n"
                 "mov %6,%%rsp\r\n"
                 "pushq %7\r\n"
                 "jmp __switch_to\r\n"
                 "done:\r\n"
                 "nop":"=m"(from->regs.rsp),"=m"(from->regs.rip),
                 "=m"(from->regs.fs),"=m"(from->regs.gs):
                "m"(to->regs.fs),"m"(to->regs.gs),"m"(to->regs.rsp),"m"(to->regs.rip),
                "D"(from),"S"(to));

}
void __switch_to(struct process *from, struct process *to) {
    set_tss(to->tss.rsp0,to->tss.rsp1,to->tss.rsp2,to->tss.ists[0],to->tss.ists[1],
            to->tss.ists[2],to->tss.ists[3],to->tss.ists[4],to->tss.ists[5],to->tss.ists[6]);
    asm volatile("mov %%fs,%0\r\n"
                 "mov %%gs,%1\r\n"
                 "mov %2,%%fs\r\n"
                 "mov %3,%%gs\r\n"
                 "sti":"=m"(to->regs.fs),"=m"(to->regs.gs):
                 "m"(from->regs.fs),"m"(from->regs.gs));
}

void set_tss(u64 rsp0,u64 rsp1,u64 rsp2,u64 ist0,u64 ist1,u64 ist2,u64 ist3,u64 ist4,u64 ist5,u64 ist6){
    tss->rsp0=rsp0;
    tss->rsp1=rsp1;
    tss->rsp2=rsp2;
    tss->ists[0]=ist0;
    tss->ists[1]=ist1;
    tss->ists[2]=ist2;
    tss->ists[3]=ist3;
    tss->ists[4]=ist4;
    tss->ists[5]=ist5;
    tss->ists[6]=ist6;
}

int fork_child_ret(){
    return 0;

}

int sys_fork(void){
    cli();
    int pid=req_proc();
    int pids=task[pid].pid;
    if(pid==-1)return -1;
    //首先完全复制
    task[pid]=*current;
    task[pid].pid=pids;
    task[pid].stat=TASK_ZOMBIE;
    

//    asm volatile("mov %%r10,%0"::"m"(r->rip));
    // r->rip=current->regs.rip;

    // memcpy(&task[pid].tss,tss, sizeof(TSS));
    task[pid].parent_pid=current->pid;
    //设置父子关系以及初始化子进程的的list节点
    list_init(&task[pid].node);
    task[pid].child_procs=NULL;
    task[pid].node.data=&task[pid];
    if(!current->child_procs)
        current->child_procs=&task[pid].node;
    else
        list_add(current->child_procs,&task[pid].node);

    task[pid].utime=0;

    //复制父进程的内存映射到子进程，然后重新映射并复制子进程的堆栈和数据段
    copy_mmap(current,&task[pid]);
    
    //复制完毕，开始更改堆栈
    //栈
    //首先获取物理内存，然后临时映射到一个地方，然后拷贝数据，再解除映射，再映射到目标进程的页表。
    addr_t stk=task[pid].mem_struct.stack_top-PAGE_4K_SIZE;
    addr_t tmpla=KNL_BASE+0x80000000;
    for(;stk>=task[pid].mem_struct.stack_bottom;stk-=PAGE_4K_SIZE){
        addr_t new_stkpg= pmalloc();
        smmap(new_stkpg,tmpla,PAGE_PRESENT|PAGE_RWX,current->pml4);
        memcpy(tmpla,stk,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
        
        //把新的页面映射到进程页表里
        smmap(new_stkpg,stk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
    }
    if(task[pid].mem_struct.stack_top<=task[pid].mem_struct.stack_bottom){
        //父进程没有栈空间（一般是不可能的，这个几乎就是为了内核进程fork而写）
        //开辟一页空栈。
        addr_t new_stkpg= (addr_t) pmalloc();
        stk=task[pid].mem_struct.stack_top-PAGE_4K_SIZE;
        //把新的页面映射到进程页表里
        smmap(new_stkpg,stk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
        //给新进程分配一页栈
        task[pid].mem_struct.stack_bottom=stk;
        //给这页新的栈填上恢复上下文需要的内容
        
    }
    //中断使用的栈空间
    //ist一页就够
    addr_t new_stkpg= kmalloc();
    memcpy(new_stkpg,current->tss.ists[0]-PAGE_4K_SIZE,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
    stack_store_regs* ctx_dup=new_stkpg+PAGE_4K_SIZE-sizeof(stack_store_regs);//拷贝的上下文
    ctx_dup->rax=0;//这样进程切换到子进程的done标签，从时钟中断返回弹出堆栈的时候rax弹出来的就是0，成为返回值。
    task[pid].regs.rip=clock_ret;
    task[pid].regs.rsp=ctx_dup;
    task[pid].tss.ists[0]=new_stkpg+PAGE_4K_SIZE;
    task[pid].tss.ists[1]=new_stkpg+PAGE_4K_SIZE;
    task[pid].tss.ists[2]=new_stkpg+PAGE_4K_SIZE;
    task[pid].tss.ists[3]=new_stkpg+PAGE_4K_SIZE;
    task[pid].tss.ists[4]=new_stkpg+PAGE_4K_SIZE;
    task[pid].tss.ists[5]=new_stkpg+PAGE_4K_SIZE;
    task[pid].tss.ists[6]=new_stkpg+PAGE_4K_SIZE;

    //堆
    addr_t hp=task[pid].mem_struct.heap_top-PAGE_4K_SIZE;
    for(;hp>=task[pid].mem_struct.heap_base;hp-=PAGE_4K_SIZE){
        addr_t new_hppg= pmalloc();
        smmap(new_hppg,tmpla,PAGE_PRESENT|PAGE_RWX,current->pml4);
        memcpy(tmpla,hp,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
        //把新的页面映射到进程页表里
        smmap(new_hppg,hp,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
    }
    smmap(0,tmpla,0,current->pml4);//解除映射
    task[pid].stat=TASK_READY;
    

    sti();
    //如果父进程没有堆，不开辟。留给load_xx函数。
    //父进程运行到这里
    return pid;
}
//释放进程页表映射的内存，内核空间除外。
void release_mmap(struct process* p){
    page_item * pml4p=p->pml4;
    //复制pdpt
    page_item *pml4e= pml4p;
    for(int i=0;i<256;i++)//高地址不释放（内核空间）
    {
        if(pml4e[i]&PAGE_PRESENT){
            page_item *pdpte=pml4e[i]&PAGE_4K_MASK|KNL_BASE;
            for(int j=0;j<512;j++)
            {
                if(pdpte[j]&PAGE_PRESENT&&!(pdpte[j]&PDPTE_1GB)){
                    page_item *pde=pdpte[j]&PAGE_4K_MASK|KNL_BASE;
                    for(int k=0;k<512;k++)
                    {
                        if(pde[k]&PAGE_PRESENT&&!(pde[k] & PDE_2MB)){
                            page_item *pte=pde[k]&PAGE_4K_MASK|KNL_BASE;
                            for(int l=0;l<512;l++){
                                if(pte[l]&PAGE_PRESENT){
                                    //释放申请的物理内存
                                    free_page(pte[l]&PAGE_4K_MASK);
                                }
                            }
                            //里面的项释放完了，这一项指向的vmalloc内存可以释放了
                            kmfree(pde[k] & PAGE_4K_MASK|KNL_BASE);
                        }else if((pde[k]&PAGE_PRESENT)&&(pde[k] & PDE_2MB)){
                            //释放2MB页
                            free_pages_at(pde[k]&PAGE_4K_MASK,512);
                        }
                    }
                    //这一页pde的内容释放完了，这一项指向的vmalloc可以释放了
                    kmfree(pdpte[j] & PAGE_4K_MASK|KNL_BASE);
                }//1GB先不写，目前还没有初始化之后动态申请1GB页的

            }
            //这一页pdpte的内容释放完了，这一项指向的vmalloc可以释放了
            kmfree(pml4e[i] & PAGE_4K_MASK|KNL_BASE);
        }
    }
}
void copy_mmap(struct process* from, struct process *to){
    page_item * pml4p= kmalloc();
    memcpy(pml4p, (unsigned char *) from->pml4, PAGE_4K_SIZE);//复制pml4
    to->regs.cr3=(unsigned long)pml4p&~KNL_BASE;
    to->pml4=pml4p;
    //复制pdpt

    page_item *pml4e= pml4p;
    for(int i=0;i<512;i++)
    {
        if((pml4e[i]&PAGE_PRESENT)==0)
            continue;
        addr_t old_data=pml4e[i];//旧的数据，里面保存了属性和要拷贝的数据的地址
        addr_t m4=kmalloc();
        pml4e[i]= (m4&~KNL_BASE) | (old_data & ~PAGE_4K_MASK);
        memcpy((unsigned char *) m4, old_data & PAGE_4K_MASK | KNL_BASE, PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
        page_item *pdpte= (page_item *) m4;
        for(int j=0;j<512;j++)
        {
            if((pdpte[j]&PAGE_PRESENT)==0||(pdpte[j]&PDPTE_1GB)!=0)
                continue;
            addr_t old_data2=pdpte[j];//旧的数据，里面保存了属性和要拷贝的数据的地址
            addr_t m3=kmalloc();
            pdpte[j]= (m3&~KNL_BASE) | (old_data2 & ~PAGE_4K_MASK);
            memcpy((unsigned char *) m3, old_data2 & PAGE_4K_MASK | KNL_BASE, PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
            page_item *pde= (page_item *) m3;
            for(int k=0;k<512;k++)
            {
                if((pde[k]&PAGE_PRESENT)==0||(pde[k]&PDE_2MB)!=0)
                    continue;
                addr_t old_data3=pde[k];//旧的数据，里面保存了属性和要拷贝的数据的地址
                addr_t m2=kmalloc();
                pde[k]= (m2&~KNL_BASE) | (old_data3 & ~PAGE_4K_MASK);
                memcpy((unsigned char *) m2, old_data3 & PAGE_4K_MASK | KNL_BASE, PAGE_4K_SIZE);//把老的数据拷贝到新的页面里

            }

        }

    }
}

int chk_mmap(off_t base, size_t mem_size){
    size_t nr_pte;
    size_t ndx_pml4=0,ndx_pdpt=0,ndx_pd=0,ndx_pt=0;
    page_item *pml4e= current->pml4;
    nr_pte=  (mem_size-1+PAGE_4K_SIZE)/PAGE_4K_SIZE;
    ndx_pt=  base/PAGE_4K_SIZE;
    ndx_pd=  ndx_pt/512%512;
    ndx_pdpt=ndx_pd/512%512;
    ndx_pml4=ndx_pdpt/512%512;
    while (nr_pte)
    {
        if(ndx_pdpt==512){
            ndx_pml4++;
            ndx_pdpt=0;
        }
        if(pml4e[ndx_pml4]%PAGE_PRESENT==0){
            ndx_pml4++;
            ndx_pdpt=0;
            continue;
        }
        unsigned long *pdpt=pml4e[ndx_pml4]&~0xfff|KNL_BASE;
        if(ndx_pd==512){
            ndx_pdpt++;
            ndx_pd=0;
        }
        if(pdpt[ndx_pdpt]&PAGE_PRESENT==0){
            ndx_pdpt++;
            ndx_pd=0;
            continue;
        }
        if(pdpt[ndx_pdpt]&PDPTE_1GB)return 0;
        unsigned long* pd=pdpt[ndx_pdpt]&~0xfff|KNL_BASE;
        if(ndx_pt==512){
            ndx_pd++;
            ndx_pt=0;
        }
        if(pd[ndx_pd]&PAGE_PRESENT==0){
            ndx_pd++;
            ndx_pt=0;
            continue;
        }
        if(pd[ndx_pd]&PDE_2MB)return 0;
        unsigned long* pt=pd[ndx_pd]&~0xfff|KNL_BASE;
        if(pt[ndx_pt]&PAGE_PRESENT)return 0;
        ndx_pt++;
        nr_pte--;
    }
    
    return 1;
}
pid_t sys_getpgrp(void){
    return current->gpid;
}

int sys_getpgid(pid_t pid,gid_t gid){
    if(pid==0)
        return current->gpid;
    for (int i = 0; i <MAX_TASKS; ++i) {
        if(task[i].pid==pid)
            return task[i].gpid;
    }
    return -1;
}
int sys_setpgid(pid_t pid,gid_t gid){
    if(pid==0)
    {
        if(current->sid==current->pid)
            return -1;
        current->gpid=gid;
        return 0;
    }
    for (int i = 0; i <MAX_TASKS; ++i) {
        if(task[i].pid==pid)
        {
            if(task[i].sid==task[i].pid)
                return -1;
            task[i].gpid=gid;
            return 0;
        }
    }
    return -1;
}

pid_t sys_setsid(void){
    current->sid=current->pid;
}
pid_t sys_getsid(pid_t pid){
    if(pid==0)
        return current->sid;
    for (int i = 0; i <MAX_TASKS; ++i) {
        if(task[i].pid==pid)
            return task[i].sid;
    }
    return -1;
}
int sys_tcsetpgrp(int fildes,pid_t pgid_id){
    //当前controlling terminal断联
    sys_ioctl(fildes,TTY_DISCONNECT,0);
    int sid= sys_getsid(0);//获取session id
    struct process* new_fgl=NULL;
    for (int i = 0; i <MAX_TASKS; ++i) {
        if(task[i].stat == TASK_ZOMBIE||task[i].stat == TASK_EMPTY)continue;
        if(task[i].sid==sid){
            task[i].fg_pgid=pgid_id;
            if(task[i].pid==pgid_id){
                //这是新前台进程组的leader
                new_fgl=&task[i];
            }
        }
    }
    //新leader把tty连接
    new_fgl->openf[new_fgl->tty_fd]->f_ops->ioctl(new_fgl->openf[fildes]->dentry->dir_inode,new_fgl->openf[fildes]\
    ,TTY_CONNECT,0);
}
pid_t sys_tcgetpgrp(int fildes){
    return current->fg_pgid;
}
//===============

int sys_ioctl(int fildes, int request, unsigned long args){
    current->openf[fildes]->f_ops->ioctl(current->openf[fildes]->dentry->dir_inode,current->openf[fildes]\
    ,request,args);
}
void set_errno(int errno){
    current->regs.errcode=errno;
}