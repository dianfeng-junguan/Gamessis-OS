#include "elf.h"
#include "errno.h"
#include "fat32.h"
#include "fcntl.h"
#include "int.h"
#include "log.h"
#include "com/mem.h"
#include "memman.h"
#include "memory.h"
#include "page.h"
#include "pe.h"
#include "proc.h"
#include "com/str.h"
#include "sys/mman.h"
#include "sys/types.h"
#include "syscall.h"
#include "typename.h"
#include "vfs.h"
#include "exe.h"

DLL  dlls[MAX_DLLS];
void fill_reloc(Elf64_Rel* rel, int modid, struct Elf64_Shdr* shdrs);
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
    __asm__ volatile("mov %%cr3,%%eax\r\n mov %%eax,%0"::"m"(pgind));
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

int execute(char* path, char** argv)
{
    //尚未切换到目标进程
    // syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno = -1, cwd_fno = -1;
    if ((fno = sys_open(path, O_EXEC)) < 0)
        return -1;
    //
    char* p = path;
    for (; *p != '\0'; p++)
        ;
    for (; *p != '/' && p > path; p--)
        ;
    if (p > path) {
        *p = '\0';
        if ((cwd_fno = sys_open(path, O_DIRECTORY)) < 0)
            return -1;
        *p = '/';
    }
    // extern struct file opened[];
    // int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
    return 0;
}
///将参数从内核空间拷贝到进程栈中，然后将指针数组本身也拷贝过去。args必须以一个NULL结尾。
///需要保证stktop有足够的空间。
///@return 返回数据底部
///@p arrsz argv数组项数（不包括NULL尾）
///@p new_arr 传入一个指针，函数会把指向的值设置为新的argv的地址。
char* copy_to_stack(addr_t* stktop, char** argv, size_t arrsz, addr_t* new_arr)
{
    addr_t* arr = stktop - arrsz - 1;   //指向填充argv的位置
    char*   p   = arr;
    int     i   = 0;
    for (; argv[i] && i < arrsz; i++) {
        p -= strlenk(argv[i]) + 1;
        strcpyk(p, argv[i]);
        arr[i] = p;
    }
    arr[i] = 0;   //添加NULL结尾
    if (argv[i]) {
        // argv里面存在非法的指针，需要手动添加NULL尾
        comprintf("copy_to_stack:invalid argv/environ[%d]:%l,truncated\n", i, argv[i]);
        *p = NULL;
    }
    *new_arr = arr;
    return p;
}
//检查指针是否指向一个实际存在的内存（标准是可读）
#define VALID_POINTER(p) verify_area(p, 1, PROT_READ)
//检查文件路径是否长度合法而且是合法指针
#define VALID_PATH(path) \
    (strnlenk(path, RECOMMENDED_MAXSTRLEN) < RECOMMENDED_MAXSTRLEN && VALID_POINTER(path))
/**
检查一个指针数组是否是合法的。
合法的依据是，数组指向一个合法内存，长度不超过512，里面的每一个指针都是合法指针，以NULL结尾。
 */
int valid_pointer_array(char** arr)
{
    if (!VALID_POINTER(arr)) {
        return 0;
    }
    int i = 0;
    for (; i < 512 && arr[i]; i++) {
        if (!VALID_POINTER(arr[i])) {
            return 0;
        }
    }
    if (arr[i]) {
        //不是0结尾的
        return 0;
    }
    return 1;
}
/**
获取指针数组长度。不检查是否是合法指针数组。
长度不会计入结尾的NULL。
 */
int pointer_array_len(char** arr, int maxlen)
{
    int l = 0;
    for (; l < maxlen && arr[l]; l++) {}
    return l;
}
int sys_execve(char* path, char** argv, char** environ)
{

    cli();
    //防御性编程，检查三个指针的有效性。
    if (!valid_pointer_array(argv) || !valid_pointer_array(environ) || !VALID_PATH(path)) {
        comprintf("sys_execve: params invalid.\n");
        return -1;
    }
    //拷贝三个指针的数据，因为之后就会释放用户区内存
    char* path_copy = kmalloc(PAGE_4K_SIZE, NO_ALIGN);
    strncpyk(path_copy, path, RECOMMENDED_MAXSTRLEN);
    path = path_copy;
    //指针数组先拷贝数组，然后拷贝数组指向的内容
    int   argc = 0, environc = 0, arg_memsz = 0, environ_memsz = 0;
    char* argv_copy = kmalloc(PAGE_4K_SIZE, NO_ALIGN);

    memcpy(argv_copy, argv, (argc = pointer_array_len(argv, 512)) * sizeof(char*));
    char* environ_copy = kmalloc(PAGE_4K_SIZE, NO_ALIGN);
    memcpy(environ_copy, environ, (environc = pointer_array_len(environ, 512)) * sizeof(char*));
    argv    = argv_copy;   //替换原来的指针数组
    environ = environ_copy;
    //简单粗暴的拷贝
    for (int i = 0; i < argc; i++) {
        size_t argl = strnlenk(argv[i], RECOMMENDED_MAXSTRLEN);
        arg_memsz += argl;
        char* move_to = kmalloc(argl, NO_ALIGN);
        strncpyk(move_to, argv[i], RECOMMENDED_MAXSTRLEN);
        argv[i] = move_to;
    }
    for (int i = 0; i < environc; i++) {
        size_t argl = strnlenk(environ[i], RECOMMENDED_MAXSTRLEN);
        environ_memsz += argl;
        char* move_to = kmalloc(argl, NO_ALIGN);
        strncpyk(move_to, environ[i], RECOMMENDED_MAXSTRLEN);
        environ[i] = move_to;
    }
    //拷贝完成
    int exec_result = do_execve(path_copy, argv_copy, environ_copy, argc, environc);

    //释放拷贝到内核空间的argv和environ
    for (int i = 0; i < argc; i++) {
        kfree(argv[i]);
    }
    for (int i = 0; i < environc; i++) {
        kfree(environ[i]);
    }
    kfree(argv);
    kfree(environ);
    kfree(path);
    return exec_result;
}
int do_execve(char* path, char** argv, char** environ, int argc, int environc)
{
    int    fno = -1, cwd_fno = -1;
    size_t arg_memsz     = argc * sizeof(addr_t);
    size_t environ_memsz = environc * sizeof(addr_t);
    if ((fno = sys_open(path, O_EXEC)) < 0)
        return -ENOENT;
    //重新设置进程数据
    //清空原来的页表
    release_mmap(current);
    //释放映射数据结构
    for (mmap_struct* mp = current->mmaps; mp; mp = list_next(mp, &mp->node)) {
        if (mp->pmhdr)   //这里的pmfree不是立即释放物理内存，只是减少引用次数，fork来的内存因为父进程还有用所以不会马上被释放
            pmfree(mp->pmhdr->base, mp->pmhdr->len);
        kfree(mp);
    }
    current->mmaps = NULL;
    // current->regs.rsp=STACK_TOP;//清空栈
    extern TSS* tss;

    current->exef = current->openf[fno];   //改变执行文件
    off_t entry   = load_elf(fno);
    if (entry == -1) {
        comprintf("failed execve, errcode:%d\n", current->regs.errcode);
        //释放拷贝到内核空间的argv和environ
        for (int i = 0; i < argc; i++) {
            kfree(argv[i]);
        }
        for (int i = 0; i < environc; i++) {
            kfree(environ[i]);
        }
        kfree(argv);
        kfree(environ);
        kfree(path);
        return -1;
    }
    //之后page err还需要这个fno
    // if(sys_close(fno)<0)return -1;

    // sysret直接返回到新程序的main
    void*             retp = (void*)entry;
    stack_store_regs* rs   = (stack_store_regs*)(tss->ists[1] - sizeof(stack_store_regs));
    rs->rcx                = (unsigned long)retp;   //返回地址
    //第二个参数argv需要把内容从内核空间拷贝到用户堆里面
    //计算argv和environ所需要的栈的空间
    //
    //参数放栈
    int tot_argsz = arg_memsz + environ_memsz + 16;   //结尾两个NULL还要16字节
    int needed    = (tot_argsz + PAGE_4K_SIZE - 1) / PAGE_4K_SIZE;
    do_mmap(STACK_TOP - PAGE_4K_SIZE * (needed),
            needed * PAGE_4K_SIZE,
            PROT_READ | PROT_WRITE,
            MAP_ANNONYMOUS | MAP_FIXED | MAP_IMMEDIATE,
            0,
            0,
            0);

    //拷贝argv
    addr_t  argv_cp    = 0;
    addr_t  environ_cp = 0;
    addr_t* p          = copy_to_stack(STACK_TOP, argv, argc, &argv_cp);
    //拷贝environ
    addr_t* ep = copy_to_stack(p, environ, environc, &environ_cp);

    // argp_aryp指向的是argv指针数组的地址，应该把用户栈设在这里
    unsigned long* stp = ep;
    stp -= 2;
    // syscall返回依赖这个
    //做16字节的向下对齐，因为有的指令要求rsp 16字节对齐，否则会出错
    tss->rsp2 = (unsigned long long)stp & ~0xfull;
    stp[0]    = 0;   // rbp占位符-反正返回到main,会mov rbp,rsp
    stp[1]    = proc_end;
    rs->r11 |= RFLAGS_IF;   // rflags存在r11里面

    //第一个参数argc
    if (current->dl) {
        //设置回开头，不然dl还得自己设置
        sys_lseek(fno, 0, SEEK_SET);
        rs->rdi = fno;
        rs->rsi = argv_cp;
        rs->rdx = environ_cp;
        // rcx被syscall用了，所以最多只能传3个参数
    }
    else {
        rs->rdi = argc;
        rs->rsi = argv_cp;
        rs->rdx = environ_cp;
    }
    //设置线程控制块TCB，需要立即加载内存
    do_mmap(STACK_TOP,
            PAGE_4K_SIZE,
            PROT_READ | PROT_WRITE,
            MAP_ANNONYMOUS | MAP_FIXED | MAP_PRIVATE | MAP_IMMEDIATE,
            0,
            0,
            0);
    // sys_mmap(STACK_TOP, PAGE_4K_SIZE, PROT_READ | PROT_WRITE, MAP_ANNONYMOUS | MAP_FIXED, 0, 0);
    tcbhead_t* tcb        = STACK_TOP;
    tcb->stack_guard      = STACK_PROTECTOR;
    current->regs.fs_base = STACK_TOP;
    wrmsr(MSR_FS_BASE, STACK_TOP);
    return 0;
}
int exec_call(char* path)
{
    int        pi  = execute(path, NULL);
    int        tss = _TSS_IND(pi) * 8;
    extern int cur_proc;
    switch_proc_tss(pi);
    while (task[pi].stat != TASK_ZOMBIE)
        ;
    return task[pi].exit_code;
}
int proc_start()
{
    extern int cur_proc;
    load_pe(&task[cur_proc]);
    //释放进程资源
    sys_exit(0);
}
//在cr3切换到目标进程下的加载程序
int load_pe(struct process* proc)
{
    // 读取文件头
    struct file* f      = proc->exef;
    int          exefno = -1;
    for (int i = 0; i < MAX_PROC_OPENF; i++)
        if (current->openf[i] == f) {
            exefno = i;
            break;
        }
    if (exefno == -1)
        return ERR;

    IMAGE_DOS_HEADER   tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
    sys_lseek(exefno, tdh.e_lfanew, SEEK_SET);
    sys_read(exefno, &tnth, sizeof(tnth));

    //是否需要移动base(先不检查)
    off_t nbase = tnth.OptionalHeader.ImageBase;
    int   pgn   = tnth.OptionalHeader.SizeOfImage / PAGE_SIZE;
    // use_pgm_ava检查在页表中这个范围是否可用，可用就使用
    //    while(1)
    //    {
    //        cont:
    //        ;
    //        int pdpti=nbase/0x40000000;
    //        int pdei=nbase%0x40000000/PAGE_INDEX_SIZE;
    //        int ptei=nbase%PAGE_INDEX_SIZE/PAGE_SIZE;
    //        off_t *pdpt=(proc->pml4[0]&~0xffful);
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

    // proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_lseek(exefno, 0, SEEK_SET);
    sys_read(exefno, nbase, PAGE_SIZE);
    // dos头
    PIMAGE_DOS_HEADER   dosh = nbase;
    PIMAGE_NT_HEADERS64 nth  = nbase + dosh->e_lfanew;
    PIMAGE_FILE_HEADER  fh   = &nth->FileHeader;
    //为新进程分配内存页
    //计算所需的页
    int prog_size  = nth->OptionalHeader.SizeOfImage;
    int page_count = prog_size / 4096;

    off_t shell_addr            = nth->OptionalHeader.AddressOfEntryPoint + nbase;
    int   page_index_item_count = page_count / 1024 + page_count % 1024 == 0 ? 0 : 1;
    int   start_pgind_item      = shell_addr / PAGE_INDEX_SIZE;

    // sys_read sections
    PIMAGE_SECTION_HEADER psec       = (u32)nth + sizeof(IMAGE_NT_HEADERS32);
    int                   data_start = sizeof(IMAGE_DOS_HEADER) + sizeof(IMAGE_NT_HEADERS32) +
                     nth->FileHeader.NumberOfSections * sizeof(IMAGE_SECTION_HEADER);
    int align  = nth->OptionalHeader.FileAlignment;
    data_start = data_start % align ? data_start - data_start % align + align : data_start;
    for (int i = 0; i < nth->FileHeader.NumberOfSections; i++, psec++) {
        int disca = psec->Characteristics & IMAGE_SCN_MEM_DISCARDABLE;
        if (disca)
            continue;
        //直接读，缺页内核解决
        sys_lseek(exefno, psec->PointerToRawData, SEEK_SET);
        sys_read(exefno, psec->VirtualAddress + nbase, psec->SizeOfRawData);
    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd = &nth->OptionalHeader.DataDirectory[1];
    if (impd->Size > 0) {
        int                      tmpi   = impd->VirtualAddress + nbase;
        PIMAGE_IMPORT_DESCRIPTOR impdes = tmpi;
        int                      dllp;
        while (impdes->Characteristics) {
            //加载dll
            char* dllname = impdes->Name + nbase;
            //此处应有加载dll代码
            int dlli;
            if (strcmpk(dllname, "sys.dll") == 0)   //加载系统dll的部分由内核已经完成
            {
                dllp = 0x1c00000;
            }
            else {
                // load_pe要记录module的加载
                dlli = load_pe(proc);
                // dlli=load_library(dllname);
                //这个是线性地址
                // dllp = get_module_addr(dlli);
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER       dlldos = dllp;
            PIMAGE_NT_HEADERS32     dllnth = dllp + dlldos->e_lfanew;
            PIMAGE_EXPORT_DIRECTORY dllexp =
                (dllnth->OptionalHeader.DataDirectory[0].VirtualAddress + dllp);
            int    funcn     = dllexp->NumberOfNames;
            char** fnames    = dllexp->AddressOfNames + dllp;
            int*   funcaddrs = dllexp->AddressOfFunctions + dllp;
            short* funcords  = dllexp->AddressOfNameOrdinals + dllp;
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base = dllexp->Base;
            //开始将导入表IAT的内容更新为函数地址
            unsigned int* iataddrs = impdes->FirstThunk + nbase;   // IAT和INT内容一样，只用IAT
            char**        siataddrs = impdes->FirstThunk + nbase;
            while (*iataddrs) {
                //判断是序号导入还是名称导入
                if (((unsigned)*iataddrs) & 0x80000000) {
                    //序号导入
                    unsigned int ord = ((*iataddrs) & 0x7fffffff) - ord_base;
                    *iataddrs        = funcaddrs[ord] + dllp;
                }
                else {
                    //名称导入
                    char* import_by_name_p = *iataddrs;   //指向IMPORT_BY_NAME
                    import_by_name_p += 2;                //跳过开头两字节序号
                    int i = 0;
                    for (; i < funcn; i++) {
                        if (strcmpk(import_by_name_p, fnames[i]) == 0) {
                            int ordi = funcords[i];
                            *iataddrs = funcaddrs[ordi] + dllp;   //导入表中的IAT内容修改成地址
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
    PIMAGE_BASE_RELOCATION relp = 0;
    if (nth->OptionalHeader.DataDirectory[5].Size > 0) {
        relp          = (u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress + (u32)nbase);
        u16* reloc    = relp + sizeof(IMAGE_BASE_RELOCATION);
        u16* rtype    = reloc + 1;
        int  old_base = nth->OptionalHeader.ImageBase;
        while (relp->VirtualAddress) {
            int pgva = relp->VirtualAddress + nbase;
            for (int i = 0; i < relp->SizeOfBlock / 4; i++) {
                if (*rtype == IMAGE_REL_BASED_ABSOLUTE)
                    continue;              //不用重定位
                int* at = *reloc + pgva;   //要重定位的数据的地址
                *at     = *at - old_base + nbase;
                //下一个
                reloc += 2;
                rtype += 2;
            }
            relp = (int)relp + 0x1000;
        }
    }
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp = {.alloc = 0, .next = NULL, .pgn = 0, .prev = NULL};   //空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE, &hdrtmp, sizeof(hdrtmp));
    task[cur_proc].mem_struct.heap_base = HEAP_BASE;
    task[cur_proc].mem_struct.heap_top  = HEAP_BASE + CHUNK_SIZE;
    //设置栈
    task[cur_proc].mem_struct.stack_top = STACK_TOP;



    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int, void*);
    Main main  = shell_addr;
    int  ecode = main(0, NULL);
    do_syscall(SYSCALL_EXIT, ecode, 0, 0, 0, 0, 0);
    //
    //不应该执行到这
    while (1)
        ;
    return task[cur_proc].exit_code;
}

int dispose_library(int dlln)
{
    if (dlln < 0 || dlln >= MAX_DLLS)
        return -1;
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag = DLL_STAT_EMPTY;
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

int   sys_insmod(char* path) {}
int   sys_rmmod(char* name) {}
off_t new_load_elf(struct file* elf)
{
    //读取文件头
    // if ET_DYN
    // load dl
    // else
    // load elf
}
//切换进程前,在execve系统调用中
//只具备简单的加载功能，用来加载程序和动态加载器，剩下的工作交给动态加载器
off_t load_elf(int fildes)
{
    // 读取文件头
    struct file* elf         = current->openf[fildes];
    struct file* elf_storage = elf;
    off_t        tmpla       = kmalloc(PAGE_4K_SIZE, NO_ALIGN);
ready:
    if (tmpla == -1) {
        current->regs.errcode = -ENOMEM;
        return -1;
    }
    elf->position = 0;
    //读取文件头
    elf->f_ops->read(elf, (char*)tmpla, PAGE_4K_SIZE, &elf->position);

    Elf64_Ehdr* ehdr = (Elf64_Phdr*)tmpla;
    u16         entn = ehdr->e_phnum;
    u16         ents = ehdr->e_phentsize;
    elf->position    = ehdr->e_shoff;
    off_t shla       = kmalloc(ehdr->e_shnum * ehdr->e_shentsize, NO_ALIGN);
    sys_lseek(fildes, ehdr->e_shoff, SEEK_SET);
    sys_read(fildes, shla, ehdr->e_shnum * ehdr->e_shentsize);
    // elf->f_ops->read(elf,(char*)shla,ehdr->e_shnum*ehdr->e_shentsize,&elf->position);
    struct Elf64_Shdr* sh     = (struct Elf64_Shdr*)(shla);
    Elf64_Phdr*        ph     = (Elf64_Phdr*)(tmpla + ehdr->e_phoff);
    size_t             tot_sz = 0;
    off_t              base = ph->p_vaddr, offset = 0;
    int                reloc_flag = 0;
    //判断是否为DYN
    // if (ehdr->e_type == ET_DYN) {
    //     reloc_flag = 1;
    //     for (int i = 0; i < ehdr->e_phnum; i++) {
    //         tot_sz += ph[i].p_memsz;
    //         if (ph[i].p_vaddr < base)
    //             base = ph[i].p_vaddr;
    //     }
    //     /*
    //     似乎有的系统支持单个段的重定位。但是这样在有些重定位方式下，尤其是跨段的相对地址调用来说，这会带来大难度，
    //     所以这里先整体移动。*/

    // if (!chk_mmap(base, tot_sz)) {
    //     //原来的地方已经被映射
    //     //需要重定位
    //     //找到另一块大小符合的连续虚拟内存，然后返回首地址（不映射，下面手动映射）
    //     reloc_flag     = 2;
    //     off_t new_base = base + PAGE_4K_SIZE;
    //     while (!chk_mmap(new_base, tot_sz)) {
    //         new_base += PAGE_4K_SIZE;
    //     }
    //     if (new_base >= KNL_BASE) {
    //         return -ENOMEM;
    //     }
    //     offset = new_base - base;
    // }


    // module* mod = 0;
    // // module项设置
    // for (int i = 0; i < MAX_MODULES; i++) {
    //     if (modules[i].type == ET_NONE) {
    //         modules[i].type        = ehdr->e_type;
    //         modules[i].load_offset = offset;
    //         modules[i].base        = base;
    //         modules[i].p_shdrs     = shla;
    //         mod                    = modules + i;
    //         break;
    //     }
    // }

    // for (int i = 0; i < ehdr->e_shnum; i++) {
    //     if (sh[i].sh_type == SHT_DYNSYM) {
    //         mod->s_symtabsz = sh[i].sh_size;
    //     }
    // }
    //程序占用的最高地址，这里就是堆开始分配的地方
    off_t max_allocated           = 0;
    current->mem_struct.text_base = -1;
    current->mem_struct.text_top  = 0;
    for (int i = 0; i < entn; i++) {
        //加载段
        if (ph->p_type == PT_LOAD) {
            unsigned long off  = ph->p_offset;
            unsigned long fs   = ph->p_filesz;
            size_t        ms   = ph->p_memsz;
            char*         vptr = (char*)ph->p_vaddr + offset;
            if (max_allocated < vptr + ms)
                max_allocated = vptr + ms;
            elf->position = off;
            if (off == 0) {
                // mod->header = vptr;
            }
            //先映射好内存，访问时再分配内存
            int attr = PROT_READ;
            if ((ph->p_flags & PF_W))
                attr |= PROT_WRITE;
            if ((ph->p_flags & PF_X)) {
                attr |= PROT_EXEC;
                //代码段底部
                if (current->mem_struct.text_base > vptr)
                    current->mem_struct.text_base = vptr;
                //代码段顶部
                if (current->mem_struct.text_top < vptr + ms)
                    current->mem_struct.text_top = vptr + ms;
            }
            do_mmap(vptr, ms, attr, MAP_FIXED | MAP_PRIVATE, fildes, off, fs);
        }
        else if (ph->p_type == PT_INTERP) {
            if (current->dl)
                break;
            int fd      = sys_open("/dl.so", O_EXEC);
            current->dl = ehdr;
            fildes      = fd;
            kfree(shla);   // section header 缓存可能需要更大，所以要重新分配
            elf = current->openf[fd];
            goto ready;
        }
        ph++;
    }

    //堆一开始不分配，通过后边brk分配
    current->mem_struct.heap_base = max_allocated;
    current->mem_struct.heap_top  = max_allocated;
    // memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
    //设置栈
    current->mem_struct.stack_top = STACK_TOP;
    off_t entry                   = 0;
    entry                         = ehdr->e_entry;
    kfree(tmpla);
    // kfree(shla);
    //从系统调用返回
    return entry;
}