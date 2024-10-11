//
// Created by Oniar_Pie on 2023/11/9.
//
#include "vfs.h"
#include "proc.h"
#include "memory.h"
#include "pe.h"
#include "int.h"
#include "mem.h"
struct process task[MAX_PROC_COUNT];
struct process* current;
TSS scene_saver;
TSS *tss=0x108000;
int cur_proc=0;
int pidd=0;
int palloc_paddr=0;
void init_proc(){
    //task=(struct process*)get_global_var(TASK_PCBS_ADDR);//[MAX_TASKS];;
    for(int i=0;i<MAX_PROC_COUNT;i++){
        task[i].pid=-1;
        task[i].stat=ENDED;
        task[i].parent_pid=-1;
    }
    cur_proc=0;//no proc
    current=task;
    pidd=1;
     //创建0号进程
    int zi=create_proc();
    task[zi].stat=READY;
    int xi= _LDT_IND(zi)*8;
    zi=_TSS_IND(zi)*8;
    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
    set_tss(0x400000,0x400000,0x400000,0x800000,0x800000,0x800000,0x800000,0x800000,0x800000,0x800000);
    //IA32_INTERRUPT_SSP_TABLE_ADDR，准备IST
    wrmsr(0x6a8,tss->rsvd2);
    //把内核代码段选择子写到MSR寄存器中准备用于特权级转换(sysexit，现在没用)
    wrmsr(0x174,0x8);
    //准备用于特权级转换(sysret，正在使用)
    wrmsr(0xc0000081,0x0020000800000000ul);
    //创建一个测试进程
    create_test_proc();
}
void create_test_proc(){

    int index=req_proc();
    task[index].stat=READY;
    int currsp=0x9fc00-1;
    asm volatile("mov %%rsp,%0":"=m"(currsp));
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
             0x7e00- sizeof(stack_store_regs), 0, 0, 0, (long)ret_sys_call, 0, index);
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
int create_proc()
{
    int index=req_proc();
    if(index==-1)return -1;
    int currsp=0x9fc00-1;
    asm volatile("mov %%rsp,%0":"=m"(currsp));
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
             currsp, 0, 0, 0, (long)proc_zero, 0, index);
//    task[index].tss.eip=(long)proc_zero;

    return index;
}
int req_proc(){
    int num=0;
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
    num<=MAX_PROC_COUNT){
        num++;
    }
    if(num>=MAX_PROC_COUNT)
        return -1;
    task[num].pid=pidd++;
    task[num].stat=ENDED;
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


}
void proc_zero()
{
    asm volatile("mov $27,%rax\n"
                 ".byte 0x48\n"
                 "syscall");
    while(1);
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
    task[cur_proc].stat!=READY){
        if(cur_proc!=-1)
            task[cur_proc].utime=0;
        //find
        int i=0;
        for(i=0;i<MAX_PROC_COUNT;i++){
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
                break;
            }
        }
        if(i>=MAX_PROC_COUNT)
            return;
        //switch
        task[cur_proc].stat=READY;
        task[i].stat=RUNNING;
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
void save_context(TSS *tss)
{
//    tss->eip=scene_saver.eip;
//    tss->eax=scene_saver.eax;
//    tss->ebx=scene_saver.ebx;
//    tss->ecx=scene_saver.ecx;
//    tss->edx=scene_saver.edx;
//    tss->esi=scene_saver.esi;
//    tss->edi=scene_saver.edi;
//    tss->eflags=scene_saver.eflags;
//    tss->esp=scene_saver.esp;
//    tss->ebp=scene_saver.ebp;
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
    task[index].stat=READY;
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
        task[task[cur_proc].parent_pid].stat=READY;
        switch_proc_tss(task[cur_proc].parent_pid);
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
void del_proc(int pnr)
{
    task[pnr].stat=ENDED;
    task[pnr].pid=-1;
    //释放申请的页面
    page_item *p;//task[pnr].tss.cr3;
    p++;
    for(;(*p&PAGE_PRESENT)!=0;p++)
    {
        page_item *tp=*p&0xfffff000;
        for(int i=0;i<1024;i++)
        {
            unsigned int present=*tp&PAGE_PRESENT;
            if(present)
            {
                free_page(*tp&0xfffff000);
                //printf("freed page at %x.\n",*tp&0xfffff000);
            }
            tp++;
        }
        vmfree(tp);
    }
    //释放存放页目录的页面
    vmfree(p);
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
    task[cur_proc].stat=SUSPENDED;
    
    task[tski].parent_pid=cur_proc;//设置父进程，这样进程结束后就能返回到父进程。

    int tss=_TSS_IND(tski)*8;

    switch_proc_tss(tski);

    return 0;
} */

int add_proc_openf(struct index_node *entry)
{
    for(int i=0;i<MAX_PROC_OPENF;i++){
        if(task[cur_proc].openf[i]==NULL)
        {
            task[cur_proc].openf[i]=entry;
            return 0;
        }
    }
    return -1;//full
}
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
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
    task[i].pml4=vmalloc();
    task[i].pml4[0]=vmalloc();
    unsigned long *pdpt=task[i].pml4;
    //pdpt第一项(0-1GB)设置为内核空间，这样才能访问中断
    set_1gb_pdpt(pdpt,0,PAGE_PRESENT|PAGE_RWX);

    //申请一项pd,里面申请一2mb页用于堆栈
    addr_t *stackb=vmalloc();
    pdpt[3]=(unsigned long)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//3-4G分配栈空间
    set_2mb_pde(stackb + 511, get_phyaddr(req_a_page()), PAGE_FOR_ALL|PAGE_RWX);
    task[i].regs.cr3=task[i].pml4;

    task[i].stat=READY;
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

void * sys_malloc(int size)
{
    //
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
    hp->alloc=0;
    //合并
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
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
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
    int pid=req_proc();
    if(pid==-1)return -1;
    task[pid].regs=current->regs;
    //使得子程序处于刚调用完系统调用的状态
    task[pid].regs.rip=ret_normal_proc;
    task[pid].regs.rsp-=sizeof(stack_store_regs);
    stack_store_regs *r=task[pid].regs.rsp;
    r->rax=0;
    r->ds=DS_USER;
    r->ss=DS_USER;
    r->es=DS_USER;
    r->rax=task[pid].regs.rax;
    r->rbx=task[pid].regs.rbx;
    r->rcx=task[pid].regs.rcx;
    r->rdx=task[pid].regs.rdx;
    r->rsi=task[pid].regs.rsi;
    r->rdi=task[pid].regs.rdi;

    r->r8 =task[pid].regs.r8 ;
    r->r9 =task[pid].regs.r9 ;
    r->r10=task[pid].regs.r10;
    r->r11=task[pid].regs.r11;
    r->r12=task[pid].regs.r12;
    r->r13=task[pid].regs.r13;
    r->r14=task[pid].regs.r14;
    r->r15=task[pid].regs.r15;

    asm volatile("mov %%r10,%0"::"m"(r->rip));

    task[pid].tss=current->tss;
    task[pid].stat=READY;
    task[pid].parent_pid=cur_proc;
    //复制打开文件
    memcpy(task[pid].openf,current->openf,sizeof(struct file*)*MAX_PROC_OPENF);
    task[pid].utime=0;
    task[pid].mem_struct=current->mem_struct;
    //TODO:根据是子进程还是父进程设置返回值的不同

    //TODO:设置新堆栈
    //复制父进程的内存映射到子进程，然后重新映射并复制子进程的堆栈和数据段
    copy_mmap(current,&task[pid]);
    //复制完毕，开始更改堆栈
    //栈
    /*
     * 这里使用vmalloc是一个权宜之策。
     * 本来是分配用户空间内存的，但是这样的话当前进程内存空间下就访问不到这个新申请的内存了（除非mmap一下），
     * 方便以前先用vmalloc。
     * */
    addr_t stk=task[pid].mem_struct.stack_top-PAGE_4K_SIZE;
    for(;stk>=task[pid].mem_struct.stack_bottom;stk-=PAGE_4K_SIZE){
        addr_t new_stkpg=vmalloc();
        memcpy(new_stkpg,stk,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
        //把新的页面映射到进程页表里
        smmap(new_stkpg,stk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
    }
    //中断使用的栈空间
    addr_t intstk=INT_STACK_TOP-PAGE_4K_SIZE;
    int f=1;
    for(;intstk>=INT_STACK_BASE;intstk-=PAGE_4K_SIZE){
        addr_t new_stkpg=vmalloc();
        memcpy(new_stkpg,intstk,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
        if(f){
            f=0;
            addr_t *raxp=new_stkpg+PAGE_4K_SIZE-56;//指向中断堆栈，里面存着rax的值
            *raxp=0;//这样进程切换到子进程的done标签，从时钟中断返回弹出堆栈的时候rax弹出来的就是0，成为返回值。
        }
        //把新的页面映射到进程页表里
        smmap(new_stkpg,intstk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
    }
    //堆
    addr_t hp=task[pid].mem_struct.heap_top-PAGE_4K_SIZE;
    for(;hp>=task[pid].mem_struct.heap_base;hp-=PAGE_4K_SIZE){
        addr_t new_hppg=vmalloc();
        memcpy(new_hppg,hp,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
        //把新的页面映射到进程页表里
        smmap(new_hppg,hp,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
    }
    //父进程运行到这里
    return pid;
}
void copy_mmap(struct process* from, struct process *to){
    page_item * pml4p=vmalloc();
    memcpy(pml4p,from->regs.cr3,PAGE_4K_SIZE);//复制pml4
    to->regs.cr3=pml4p;
    to->pml4=pml4p;
    //复制pdpt

    page_item *pml4e= pml4p;
    for(int i=0;i<512;i++)
    {
        if(pml4e[i]&PAGE_PRESENT){
            addr_t old_data=pml4e[i];//旧的数据，里面保存了属性和要拷贝的数据的地址
            pml4e[i]=vmalloc()|(old_data&~PAGE_4K_MASK);
            memcpy(pml4e[i]&PAGE_4K_MASK,old_data&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
            page_item *pdpte=pml4e[i]&PAGE_4K_MASK;
            for(int j=0;j<512;j++)
            {
                if(pdpte[j]&PAGE_PRESENT&&!(pdpte[j]&PDPTE_1GB)){
                    addr_t old_data2=pdpte[j];//旧的数据，里面保存了属性和要拷贝的数据的地址
                    pdpte[j]=vmalloc()|(old_data2&~PAGE_4K_MASK);
                    memcpy(pdpte[j]&PAGE_4K_MASK,old_data2&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
                    page_item *pde=pdpte[j]&PAGE_4K_MASK;
                    for(int k=0;k<512;k++)
                    {
                        if(pde[j]&PAGE_PRESENT&&!(pde[j]&PDE_4MB)){
                            addr_t old_data3=pde[j];//旧的数据，里面保存了属性和要拷贝的数据的地址
                            pde[j]=vmalloc()|(old_data3&~PAGE_4K_MASK);
                            memcpy(pde[j]&PAGE_4K_MASK,old_data3&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
                        }
                    }
                }
            }
        }
    }
}