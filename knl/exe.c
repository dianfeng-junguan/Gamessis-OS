#include "vfs.h"
#include "mem.h"
#include "syscall.h"
#include "page.h"
#include "typename.h"
#include "pe.h"
#include "proc.h"
#include "exe.h"
#include "str.h"
#include "fcntl.h"
#include "errno.h"
#include "elf.h"
#include "memory.h"

DLL dlls[MAX_DLLS];
Module modules[MAX_MODULES];
/*

int load_library(char *path)
{
    extern dir_entry root_dir;
    dir_entry f,dir=root_dir;
    get_entry(path,&f,dir);
    if(!file_exist(f))return -1;
    
    //注册dll
    int ind=0;
    for(;ind<MAX_DLLS;ind++)
    {
        if(dlls[ind].flag==DLL_STAT_EMPTY)
        {
            get_fname(path,dlls[ind].name);
            dlls[ind].page_used=1;
            dlls[ind].flag=DLL_STAT_LOADED;
            break;
        }
    }
    if(ind>=MAX_DLLS)return -1;
    //int check_mem_available(int base,int len);

    //记录在案
    //dlls[ind].page_num[0]=header_pagen;

    //开始读取文件头
    IMAGE_DOS_HEADER tdosh;
    read_file(f,&tdosh,0,sizeof(IMAGE_DOS_HEADER));
    IMAGE_NT_HEADERS32 tnth;
    read_file(f,&tnth,tdosh.e_lfanew,sizeof(IMAGE_NT_HEADERS32));
    //检查imagebase处可否存放程序
    int nbase=tnth.OptionalHeader.ImageBase;
    //如果原来的位置放不了，就向后移动
    int *pgind,*pgt;
    asm volatile("mov %%cr3,%%eax\r\n mov %%eax,%0"::"m"(pgind));
    pgt=pgind[nbase/PAGE_INDEX_SIZE];
    while(!check_pgm(nbase,tnth.OptionalHeader.SizeOfImage/0x1000)&&\
    nbase+tnth.OptionalHeader.SizeOfImage<MEM_END){
        nbase+=tnth.OptionalHeader.SectionAlignment;
    }
    if(nbase+tnth.OptionalHeader.SizeOfImage>=MEM_END||\
    req_page_at(nbase,tnth.OptionalHeader.SizeOfImage/0x1000)==-1){
        return -1;//缺一个释放页代码
    }
    dlls[ind].addr=nbase;
    //开头一页存放文件头
    read_file(f,nbase,0,4096);
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
    PIMAGE_NT_HEADERS32 nth=nbase+dosh->e_lfanew;
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
    int secn=fh->NumberOfSections;
    PIMAGE_SECTION_HEADER sh=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
    //读load段
    for(int i=0;i<secn;i++)
    {
        u32 chars=sh[i].Characteristics;
        if(chars&IMAGE_SCN_MEM_DISCARDABLE)continue;//可以抛弃
        //计算出最要加载到的内存地址
        int dest=sh[i].VirtualAddress+nbase;
        read_file(f,dest,\
        sh[i].PointerToRawData,sh[i].SizeOfRawData);
        
    }
    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
    if(nth->OptionalHeader.DataDirectory[5].Size==0)goto dllmain;
    relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
                                +(u32)nbase);
    IMAGE_BASE_RELOCATION emptyr={0};
    u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
    u16 *rtype=reloc+1;
    int old_base=nth->OptionalHeader.ImageBase;
    while(memcmp(relp,&emptyr,sizeof(IMAGE_BASE_RELOCATION))!=0){
        int pgva=relp->VirtualAddress+nbase;
        for(int i=0;i<relp->SizeOfBlock/4;i++)
        {
            if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
            int *at=*reloc+pgva;//要重定位的数据的地址
            *at=*at-old_base+nbase;
            //下一个
            reloc+=2;
            rtype+=2;
        }
        relp=(int)relp+0x1000;
    }
    //重定位完毕，准备调用DllMain
dllmain:
    ;
    typedef int (*DllMain)(void*,u32,void*);
    DllMain dllmain=nth->OptionalHeader.AddressOfEntryPoint+nbase;
    dllmain(NULL,0,NULL);

    //完毕
    return ind;
}
*/

int execute(char *path, char **argv)
{
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
    if((fno=sys_open(path, O_EXEC)) <0)return -1;
    //
    char *p=path;
    for(;*p!='\0';p++);
    for(;*p!='/'&&p>path;p--);
    if(p>path)
    {
        *p='\0';
        if((cwd_fno=sys_open(path, O_DIRECTORY)) <0)return -1;
        *p='/';
    }
    extern struct file opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
    return pi;
}

int sys_execve(char *path, int argc, char **argv) {
    int fno=-1,cwd_fno=-1;
    if((fno=sys_open(path, O_EXEC)) <0)return -ENOENT;

    //重新设置进程数据
    //清空原来的页表
    release_mmap(current);
    current->regs.rsp=STACK_TOP;//清空栈
    extern TSS* tss;

    current->exef=current->openf[fno];//改变执行文件
    addr_t entry= load_elf(current->exef);
    extern struct file opened[];
    extern struct process task[];
    if(sys_close(current->exef-opened)<0)return -1;

    //sysret直接返回到新程序的main
    void *retp= (void *) entry;
    stack_store_regs *rs= (stack_store_regs *) (tss->ists[0] - sizeof(stack_store_regs));
    rs->rcx= (unsigned long) retp;
    //第一个参数argc
    rs->rsi=argc;
    //第二个参数argv需要把内容从内核空间拷贝到用户堆里面
    char* p= (char *) current->mem_struct.heap_base;
    for(int i=0;i<argc;i++){
        strcpy(p,argv[i]);
        p+= strlen(argv[i])+1;
    }
    rs->rdi=current->mem_struct.heap_base;
    //以下部分是临时测试代码
//    int (*pmain)(int argc,char **argv)=(int (*)(int, char **)) entry;
//    pmain(argc, (char **) rs->rdi);
    return 0;
}
int exec_call(char *path)
{
    int pi= execute(path, NULL);
    int tss= _TSS_IND(pi)*8;
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
    while(task[pi].stat != TASK_ZOMBIE);
    return task[pi].exit_code;
}
int proc_start()
{
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
    //释放进程资源
    sys_exit(0);
}
//在cr3切换到目标进程下的加载程序
int load_pe(struct process *proc)
{
    // 读取文件头
    struct file *f=proc->exef;
    int exefno=-1;
    for(int i=0;i<MAX_PROC_OPENF;i++)
        if(current->openf[i]==f)
        {
            exefno=i;
            break;
        }
    if(exefno==-1)return ERR;

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
    sys_lseek(exefno,tdh.e_lfanew,SEEK_SET);
    sys_read(exefno, &tnth, sizeof(tnth));

    //是否需要移动base(先不检查)
    addr_t nbase=tnth.OptionalHeader.ImageBase;
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
    //use_pgm_ava检查在页表中这个范围是否可用，可用就使用
//    while(1)
//    {
//        cont:
//        ;
//        int pdpti=nbase/0x40000000;
//        int pdei=nbase%0x40000000/PAGE_INDEX_SIZE;
//        int ptei=nbase%PAGE_INDEX_SIZE/PAGE_SIZE;
//        addr_t *pdpt=(proc->pml4[0]&~0xffful);
//
//        for(int i=0;i<pgn;i++)
//        {
//            if(pt[ptei+i%1024]&PAGE_PRESENT&&pt!=NULL)
//            {
//                //移动base
//                nbase+=0x1000;
//                goto cont;
//            }
//        }
//        break;
//    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_lseek(exefno,0,SEEK_SET);
    sys_read(exefno, nbase, PAGE_SIZE);
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
    PIMAGE_NT_HEADERS64 nth=nbase+dosh->e_lfanew;
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
    int page_count=prog_size/4096;

    addr_t shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
    int align=nth->OptionalHeader.FileAlignment;
    data_start=data_start%align?data_start-data_start%align+align:data_start;
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
        if(disca)
            continue;
        //直接读，缺页内核解决
        sys_lseek(exefno,psec->PointerToRawData,SEEK_SET);
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
    if(impd->Size>0)
    {
        int tmpi=impd->VirtualAddress+nbase;
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
        int dllp;
        while (impdes->Characteristics)
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
            {
                dllp=0x1c00000;
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
            int funcn=dllexp->NumberOfNames;
            char **fnames=dllexp->AddressOfNames+dllp;
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
            char **siataddrs=impdes->FirstThunk+nbase;
            while (*iataddrs)
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
                    *iataddrs=funcaddrs[ord]+dllp;
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
                    import_by_name_p+=2;//跳过开头两字节序号
                    int i=0;
                    for(;i<funcn;i++)
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
                        {
                            int ordi=funcords[i];
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
                        }
                    }
                }
                iataddrs++;
                siataddrs++;
            }
            impdes++;

        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
                                +(u32)nbase);
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
        u16 *rtype=reloc+1;
        int old_base=nth->OptionalHeader.ImageBase;
        while(relp->VirtualAddress){
            int pgva=relp->VirtualAddress+nbase;
            for(int i=0;i<relp->SizeOfBlock/4;i++)
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
                int *at=*reloc+pgva;//要重定位的数据的地址
                *at=*at-old_base+nbase;
                //下一个
                reloc+=2;
                rtype+=2;
            }
            relp=(int)relp+0x1000;
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
            .alloc=0,
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
    //设置栈
    task[cur_proc].mem_struct.stack_top=STACK_TOP;



    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
    int ecode=main(0,NULL);
    do_syscall(SYSCALL_EXIT,ecode,0,0,0,0,0);
    //
    //不应该执行到这
    while(1);
    return task[cur_proc].exit_code;
}

int get_module_addr(int mi)
{
    return modules[mi].base;
}
int dispose_library(int dlln)
{
    if(dlln<0||dlln>=MAX_DLLS)return -1;
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
    return 0;
}
/* #include <elf.h>
int load_elf(struct process* proc)
{
    int fno=proc->exef->fno;
    struct elf32_hdr hdr;
    sys_read(fno, &hdr, 0, sizeof(hdr));
    int nbase=0;
    int pgn=0;
    while(1)
    {
        int pdei=nbase/PAGE_INDEX_SIZE;
        int ptei=nbase%PAGE_INDEX_SIZE/PAGE_SIZE;
        int *pt=(proc->pdet[pdei]&0xfffff000);
        for(int i=0;i<pgn;i++)
        {
            if(proc->pdet[pdei+i/1024]&PAGE_PRESENT||pt[ptei+i%1024]&PAGE_PRESENT)
            {
                //移动base
                nbase+=0x1000;
                break;
            }
        }
        break;
    }
    //判断elf文件类型
    if(hdr.e_type==ET_DYN)
    {
        //共享库
    }
    //可执行文件
    int seg_num=hdr.e_phnum;
    struct Elf32_phdr phdrs[seg_num];
    sys_read(fno, phdrs, hdr.e_phoff, hdr.e_phentsize);
    //加载程序段
    for(int i=0;i<seg_num;i++)
    {
        if(!(phdrs[i].p_type&PT_LOAD))continue;
        sys_read(fno, phdrs[i].p_vaddr, phdrs[i].p_offset, phdrs[i].p_filesz);

    }
    proc->tss.eip=hdr.e_entry;
    //加载依赖库

    return 0;
} */

int sys_insmod(char *path)
{

}
int sys_rmmod(char *name)
{

}
//切换进程前,在execve系统调用中
addr_t load_elf(struct file *elf) {
    // 读取文件头

    addr_t tmpla=KNL_BASE+0x80000000;
    //读取文件头，当前就是要加载程序的进程，所以不用搞临时映射
    addr_t pma= (addr_t) pmalloc();
    smmap(pma , 0x400000, PAGE_PRESENT | PAGE_RWX | PAGE_FOR_ALL, current->pml4);
    elf->position=0;
    //读取文件头
    elf->f_ops->read(elf, (char *) 0x400000, PAGE_4K_SIZE, &elf->position);

    unsigned long bin= (unsigned long) 0x400000;
    Elf64_Ehdr *ehdr=(Elf64_Phdr*)bin;
    u16 entn=ehdr->e_phnum;
    u16 ents=ehdr->e_phentsize;
    struct Elf64_Shdr* sh= (struct Elf64_Shdr *) (bin + ehdr->e_shoff);
    Elf64_Phdr *ph= (Elf64_Phdr *) (bin + ehdr->e_phoff);
    for(int i=0;i<entn;i++){
        //加载节
        if((ph->p_type|PT_LOAD)!=0){
            unsigned long off=ph->p_offset;
            unsigned long fs=ph->p_filesz;
            char* vptr= (char *) ph->p_vaddr;
            elf->position=off;

            //先映射好内存
            int attr=PAGE_PRESENT|PAGE_FOR_ALL;
            if((ph->p_flags|PF_X)!=0||(ph->p_flags|PF_W)!=0)
                attr|=PAGE_RWX;
            int pgc=fs/PAGE_4K_SIZE;
            if(!pgc)pgc=1;
            for(int j=0;j<pgc;j++){
                addr_t dest=(addr_t) (vptr + j * PAGE_4K_SIZE);
                if(dest==0x400000)continue;
                smmap((addr_t) pmalloc(), dest, attr, current->pml4);
            }
            //读取
            elf->f_ops->read(elf,vptr,fs,&elf->position);

        }
        ph++;
    }
    //初始化堆
    chunk_header hdrtmp={
            .alloc=0,
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };
    //空堆
    //分配堆
    smmap((addr_t) pmalloc(), HEAP_BASE, PAGE_PRESENT | PAGE_FOR_ALL | PAGE_RWX, current->pml4);
    memset((unsigned char *) HEAP_BASE, 0, CHUNK_SIZE);
    current->mem_struct.heap_base=HEAP_BASE;
    current->mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
    //设置栈
    current->mem_struct.stack_top=STACK_TOP;
    addr_t entry=ehdr->e_entry;
    //从系统调用返回
    return entry;
}