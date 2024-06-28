//
// Created by Oniar_Pie on 2023/11/9.
//
#include "virfs.h"
#include "proc.h"
#include "memory.h"
#include "pe.h"
struct process task[MAX_PROC_COUNT];
TSS scene_saver;
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
    pidd=1;
     //创建0号进程
    int zi=create_proc();
    task[zi].stat=READY;
    int xi= _LDT_IND(zi)*8;
    zi=_TSS_IND(zi)*8;
    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
}

int create_proc()
{
    int index=req_proc();
    if(index==-1)return -1;
    int curesp=0x9fc00-1;
    asm volatile("mov %%esp,%0":"=m"(curesp));
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0,0,0,0,0x17,0xf,0x17,0x17,0x17,0x17,curesp,0,0,0,0,index);
    task[index].tss.eip=(long)proc_zero;

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
void set_proc(long eax,long ebx,long ecx,long edx,long es,long cs,long ss,long ds,long fs,long gs\
,long esp,long ebp,long esi,long edi,long eflags,int proc_nr){
    struct process* proc=&task[proc_nr];
    proc->tss.eax=eax;
    proc->tss.ebx=ebx;
    proc->tss.ecx=ecx;
    proc->tss.edx=edx;
    proc->tss.es=es;
    proc->tss.cs=cs;
    proc->tss.ss=ss;
    proc->tss.ss0=ss;
    proc->tss.ss1=ss;
    proc->tss.ss2=ss;
    proc->tss.ds=ds;
    proc->tss.fs=fs;
    proc->tss.gs=gs;
    proc->tss.esp=esp;
    proc->tss.esp0=esp;
    proc->tss.esp1=esp;
    proc->tss.esp2=esp;
    proc->tss.ebp=ebp;
    proc->tss.esi=esi;
    proc->tss.edi=edi;
    proc->tss.eflags=0x202;//设置为默认值:0b 0010 0000 0010
    //能接受中断
    proc->tss.eip=(long)proc_zero;

    proc->tss.cs=cs;
    proc->tss.ds=ds;
    proc->tss.es=es;
    proc->tss.cr3=PAGE_INDEX_ADDR;//get_phyaddr(n1);//暂时先搞成全局

    proc->tss.ldt= _LDT_IND(proc_nr)*8;
    //在gdt中添加tss
    fill_desc(&proc->tss,0xffff,SEG_SYS_TSS|SEG_PRESENT,_TSS_IND(proc_nr));
    //添加ldt
    fill_desc(proc->ldt, sizeof(proc->ldt),SEG_SYS_LDT|SEG_PRESENT, _LDT_IND(proc_nr));
    //设置ldt
    fill_ldt_desc(0,0xffffffff,\
    SEG_CONFORMING_RW_CODE|SEG_DPL_3,&proc->ldt[0]);
    fill_ldt_desc(0,0xffffffff,\
    SEG_RW_DATA|SEG_DPL_3,&proc->ldt[1]);
    fill_ldt_desc(0x1c00000-0x1000,0x1000,\
    SEG_STACK|SEG_DPL_3,&proc->ldt[2]);

}
void proc_zero()
{

    while(1);
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
        switch_proc_tss(i);
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
    //重新设置0号进程
    task[0].tss.eip=proc_zero;
    task[0].tss.cr3=PAGE_INDEX_ADDR;
    task[0].tss.eflags=0x202;
    cur_proc=pnr;
    int sel=_TSS_IND(pnr)*8;
    switch_to(&task[pnr].tss);
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
void save_context(TSS *tss)
{
    tss->eip=scene_saver.eip;
    tss->eax=scene_saver.eax;
    tss->ebx=scene_saver.ebx;
    tss->ecx=scene_saver.ecx;
    tss->edx=scene_saver.edx;
    tss->esi=scene_saver.esi;
    tss->edi=scene_saver.edi;
    tss->eflags=scene_saver.eflags;
    tss->esp=scene_saver.esp;
    tss->ebp=scene_saver.ebp;
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
    page_item *pgind=task[proc_index].tss.cr3;
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
                    ptr=laddr;
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
    asm volatile("mov %0,%%esp"::"r"(task[0].tss.esp));
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
    page_item *p=task[pnr].tss.cr3;
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

int add_proc_openf(vfs_dir_entry *entry)
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

int reg_proc(int entry, vfs_dir_entry *cwd, vfs_dir_entry *exef)
{
    
    int i=req_proc();
    if(i==-1)return -1;
    /*set_proc(0,0,0,0,SEL_LDT_DATA,SEL_LDT_CODE,SEL_LDT_STACK,SEL_LDT_DATA\
    ,SEL_LDT_DATA,SEL_LDT_DATA,0x1c00000-4,0,0,0,0,i);*/
    set_proc(0,0,0,0,0x10,0x8,0x10,0x10\
    ,0x10,0x10,0x1c00000-4,0,0,0,0,i);
    task[i].pdet=vmalloc();
    int *pt=vmalloc();
    task[i].pdet[0]=PAGE_TABLE_ADDR|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;
    /*for(int j=0;j<32;j++)
        pt[j]=(PAGE_TABLE_ADDR+j*0x1000)|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;//复制内核页表*/
    //PAGE_TABLE_ADDR|PAGE_PRESENT;//复制内核页表
    //task[i].pdet[7]=PAGE_TABLE_ADDR+7*0x1000|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//sys.dll
    int *stackb=vmalloc();
    task[i].pdet[6]=(int)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
    stackb[1023]=get_phyaddr(req_a_page())|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
    task[i].tss.cr3=task[i].pdet;

    task[i].stat=READY;
    task[i].cwd=cwd;
    task[i].exef=exef;
    /*task[i].tss.es=0x10;
    task[i].tss.ds=0x10;
    task[i].tss.ss=0x10;
    task[i].tss.gs=0x10;
    task[i].tss.fs=0x10;
    task[i].tss.cs=0x8;*/
    task[i].tss.eip=entry;
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