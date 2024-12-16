#include "memory.h"
#include "blk_dev.h"
#include "errno.h"
#include "framebuffer.h"
#include "int.h"
#include "log.h"
#include "mem.h"
#include "proc.h"
#include "signal.h"
#include "sys/mman.h"
#include "sys/types.h"
#include "syscall.h"
#include "typename.h"
#include "vfs.h"


malloc_hdr* mhdr_split(malloc_hdr* target, off_t split_point, malloc_hdr* array, size_t arraylen);
malloc_hdr* mhdr_merge(malloc_hdr* prev, malloc_hdr* next);
// page bitmap. refers to pages of mem.
unsigned int* page_map   = NULL;   //[PAGE_BITMAP_NR]={0};
page_item*    page_index = PAGE_INDEX_ADDR;
page_item*    page_table = PAGE_TABLE_ADDR;
// 64位用
page_item*    pml4        = PML4_ADDR;
page_item*    pdpt        = PDPT_ADDR;
page_item*    pd          = PD_ADDR;
unsigned int* vmalloc_map = VMALLOC_BASE;   //[VMALLOC_PGN/32]={0};
addr_t        usr_mem_pa  = 0;
mem_t         phy_mmap_struct[MAX_MEM_STRUCT];
int           kmalloc_entry_num = VMALLOC_PGN >> 5, kmalloc_pgc = VMALLOC_PGN, pmalloc_entc = 0;
//以kb为单位
int high_mem_base = 1024;
int mmap_t_i      = 0;

malloc_hdr *pmhdrs, *kmhdrs;
malloc_hdr *pmalloc_mhdr, *kmalloc_mhdr;
// stat_t mmap(addr_t pa,addr_t la,u32 attr)
// {
//     return smmap(pa,la,attr,current->pml4);
//     /*//从pml4中找到la所属的pml4项目，即属于第几个512GB
//     page_item *pdptp= (page_item *) (pml4[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
//     //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

//     //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
//     int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
//     page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
//     //检查pdptp是否被占用
//     if(!((unsigned long long)pdp&PAGE_PRESENT))
//     {
//         pdp=(page_item*)vmalloc();
//         memset(pdp,0,4096);
//         pdptp[pdpti]=(addr_t)pdp|attr;
//     }
//     pdp=(page_item*)((addr_t)pdp&~0xff);

//     //在pd中找到la指向的pt
//     page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
//     if(!((unsigned long long)pt & PAGE_PRESENT))
//     {
//         pt=(page_item*)vmalloc();
//         memset(pt,0,4096);
//         pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
//     }
//     pt=(page_item*)((addr_t)pt & ~0xff);

//     //在pt中找到la指向的page
//     pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
//     return NORMAL;*/
// }
stat_t smmap(addr_t pa, addr_t la, u32 attr, page_item* pml4p)
{
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    // canonical 高地址判断
    if (la > 0x7ffffffffffful) {
        la &= ~0xffff000000000000ul;
    }
    page_item* pdptp = (page_item*)(pml4p[la / PML4E_SIZE]);   //指向的pdpt表
    int        pml4i = la / PML4E_SIZE;
    if (!((unsigned long long)pdptp & PAGE_PRESENT)) {
        pdptp = (page_item*)kmalloc(0, PAGE_4K_SIZE);
        memset(pdptp, 0, 4096);
        //这里使用了狡猾的技巧：kmalloc的内存-KNL_BASE直接就是实际的物理地址
        pml4p[pml4i] = ((addr_t)pdptp & ~KNL_BASE) | attr;
    }
    pml4p[pml4i] |= attr;
    pdptp = (page_item*)(((addr_t)pdptp & ~0xff) | KNL_BASE);

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int        pdpti = la % PML4E_SIZE / PDPTE_SIZE;
    page_item* pdp   = (page_item*)pdptp[pdpti];   //指向的pd
    //检查pdptp是否被占用
    if (!((unsigned long long)pdp & PAGE_PRESENT)) {
        pdp = (page_item*)kmalloc(0, PAGE_4K_SIZE);
        memset(pdp, 0, 4096);
        pdptp[pdpti] = ((addr_t)pdp & ~KNL_BASE) | attr;
    }
    pdptp[pdpti] |= attr;
    pdp = (page_item*)(((addr_t)(pdp) & ~0xff) | KNL_BASE);

    //在pd中找到la指向的pt
    page_item* pt = (page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
    if (!((unsigned long long)pt & PAGE_PRESENT)) {
        pt = (page_item*)kmalloc(0, PAGE_4K_SIZE);
        memset(pt, 0, 4096);
        pdp[la % PDPTE_SIZE / PDE_SIZE] = ((addr_t)pt & ~KNL_BASE) | attr;
    }
    pdp[la % PDPTE_SIZE / PDE_SIZE] |= attr;
    pt = (page_item*)(((addr_t)pt & ~0xff) | KNL_BASE);

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_4K_SIZE] = pa | attr;   //映射
    // comprintf("mapped %l(pa) to %l(la)\n", pa, la);
    return NORMAL;
}


int init_paging()
{
/*
 * 目前的情况是：
 * 0x4000000000(1G)开始的2BF200内存分给了显示缓存
 * pml4的第一项，pdpt的第二项已经分配了
 *
 * */
#ifdef IA32
    //设置页目录
    unsigned int pt  = PAGE_TABLE_ADDR;
    page_item*   pde = page_index;
    for (int i = 0; i < 256; i++)   // 256 PDE表示内核空间
    {
        set_page_item(pde + i, pt, PAGE_PRESENT | PAGE_RWX);
        for (int j = 0; j < 1024; j++) {
            set_page_item(pt, i * 0x400000 + j * 0x1000, PAGE_PRESENT | PAGE_RWX);
            pt += 4;
        }
    }
    //开启分页模式
    __asm__ volatile("mov %0,%%eax\r\n mov %%rax,%%cr3\r\n"
                     "mov %%cr0,%%rax\r\n"
                     "or $0x80000000,%%eax\r\n"
                     "mov %%rax,%%cr0"
                     : "=m"(page_index));
#else
    //设置PML4
    //    set_page_item(pml4,PDPT_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);
    //设置第一项pdpte，也就是内核空间
    //    set_1gb_pdpt(pdpt,0,PAGE_RWX);//设置PDPT0x40000000ul
    //    set_page_item(pdpt+1,PD_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);
    //把低512GB的空间取消映射，留给用户
    pml4[0] = 0;
#endif
}
void set_high_mem_base(int base)
{
    high_mem_base = base;
}
void set_mem_area(unsigned long base, unsigned long len, unsigned long type)
{
    phy_mmap_struct[mmap_t_i].base   = base;
    phy_mmap_struct[mmap_t_i].len    = len;
    phy_mmap_struct[mmap_t_i++].type = type;
    comprintf("mem info:base=0x%l,len=0x%l,type=%d\n", base, len, type);
}
addr_t _kmalloc()
{
    for (int i = 0; i < VMALLOC_PGN / 32; i++) {
        for (int j = 0; j < 32; j++) {
            if (!(vmalloc_map[i] & (1 << j))) {
                vmalloc_map[i] |= (1 << j);
                return VMALLOC_BASE + (i * 32 + j) * 0x1000;
            }
        }
    }
}
addr_t kmallocat(addr_t addr, int pgc)
{
    int pi = (addr - VMALLOC_BASE) / PAGE_4K_SIZE;
    if (addr == 0) {
        int l = 0, p = 0;
        for (int i = 0; i < kmalloc_pgc; i++) {
            if (!(vmalloc_map[i / 32] & (1u << (i % 32)))) {
                if (l == 0)
                    p = i;   //开头空页
                l++;
            }
            else
                l = 0;
            if (l == pgc)
                break;
        }
        if (l < pgc)
            return -1;
        //开始占用
        for (int i = 0; i < pgc; i++) {
            vmalloc_map[(p + i) / 32] |= 1u << ((p + i) % 32);
        }
        return VMALLOC_BASE + PAGE_4K_SIZE * p;
    }
    for (int i = 0; i < pgc; i++) {
        if (vmalloc_map[(pi + i) / 32] & (1 << ((pi + i) % 32)))
            return -1;
    }
    //
    for (int i = 0; i < pgc; i++) {
        vmalloc_map[(pi + i)] |= (1 << ((pi + i) % 32));
    }
    return addr;
}

int _kmfree(addr_t ptr)
{
    int num        = ptr / PAGE_SIZE;
    int n          = num / 32;
    int r          = num % 32;
    vmalloc_map[n] = vmalloc_map[n] & ~(unsigned int)(1 << r);
}

///查询当前进程该地址是否有对应的映射
mmap_struct* get_mmap(off_t addr)
{
    mmap_struct* mp = current->mmaps;
    for (; mp && !(mp->base <= addr && mp->base + mp->len > addr); mp = list_next(mp, &mp->node)) {
        // comprintf("mmaps[],base=%l,len=%l,addr=%l\n",mp->base,mp->len,addr);
    }
    if (!mp)
        return NULL;
    return mp;
}
///获取该物理地址的malloc header。
malloc_hdr* get_pmhdr(off_t pm)
{
    malloc_hdr* mp = pmhdrs;
    for (; mp && mp->base != pm; mp = mp->next) {
        // comprintf("phdr:%l,next=%l\n",mp,mp->next);
    }
    return mp;
}
void page_err(long* int_stk)
{
    cli();
    comprintf("page err\n");
    off_t err_code = int_stk[0], l_addr = 0;
    off_t addr = int_stk[1];
    // __asm__ volatile("push %%rax\nmov 8(%%rbp),%%rax\nmov %%rax,%0\n" : "=m"(err_code));
    __asm__ volatile("mov %%cr2,%%rax\nmov %%rax,%0\n" : "=m"(l_addr));   //试图访问的地址
    // __asm__ volatile("mov 16(%%rbp),%%rax\nmov %%rax,%0\npop %%rax\n" : "=m"(addr));
    comprintf("occurred at %x(paddr), trying to access %x(laddr)\n", addr, l_addr);
    comprintf("error process pid:0x%x\n", current->pid);
    comprintf("cr2=%x\nerr code=%x\n", l_addr, err_code);
    if (err_code & PF_LEVEL_VIOLATION)
        comprintf("non-existent page item\n");
    if (err_code & PF_WRITING)
        comprintf("when writing\n");
    else
        comprintf("when reading\n");
    if (!(err_code & PF_USER_MODE))
        comprintf("supervisor mode\n");
    else
        comprintf("user mode\n");
    if (err_code & PF_INS_FETCH)
        comprintf("instruction fetch\n");
    if (err_code & PF_PROTECT_KEY)
        comprintf("data access not allowed by protection key\n");
    backtrace(int_stk);

    if (!(err_code & PF_LEVEL_VIOLATION)) {
        // accessing non-existent page
        //检查地址合法性
        if (l_addr >= MEM_END)
            ;
        mmap_struct* mp = NULL;
        if ((mp = get_mmap(l_addr)) == NULL) {
            // TODO  没有映射，报错
            comprintf("page_err:page acceessed without mmap\n");
            // if (current->pid == 1)
            die();
            //结束问题进程
            sys_exit(-1);
        }
        else {
            unsigned int attr = PAGE_PRESENT | PAGE_FOR_ALL;
            if ((mp->flags & PROT_WRITE))
                attr |= PAGE_RWX;
            off_t mbase = mp->base & PAGE_4K_MASK;
            off_t mtop  = PAGE_4K_ALIGN(mp->base + mp->len);
            int   pgn   = (mtop - mbase) / PAGE_4K_SIZE;
            //在进程的页表中申请新页
            void* pm = pmalloc(pgn * PAGE_4K_SIZE);
            for (int i = 0; i < pgn; i++) {
                smmap(pm + i * PAGE_4K_SIZE, mbase + i * PAGE_4K_SIZE, attr, current->pml4);
            }
            mp->pmhdr = get_pmhdr(pm);   //填写pmhdr
            //读取文件
            if (mp->file) {
                int fd = mp->fd;
                sys_lseek(fd, mp->offset, SEEK_SET);
                sys_read(fd, mp->base, mp->len);
            }
        }
    }
    else {
        // page level protection
        comprintf("page err caused by level protection\n");
        sys_exit(-1);
    }
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    // __asm__ volatile("leave\n add $8,%rsp \n iretq");
}
void init_memory()
{
    extern addr_t _knl_end, _knl_start;   // lds中声明的内核的结尾地址，放置位图
    //获取可用内存大小mem_size
    size_t tot_mem_size = phy_mmap_struct[mmap_t_i - 1].base + phy_mmap_struct[mmap_t_i - 1].len,
           mem_size     = 0;
    for (int i = 0; i < mmap_t_i; i++) {
        if (phy_mmap_struct[i].type == MULTIBOOT_MEMORY_AVAILABLE)
            mem_size += phy_mmap_struct[i].len;
    }
    usr_mem_pa = PAGE_4K_ALIGN(mem_size / 2);


    //计算出所需内存页数量
    /*
     * 注：物理内存的一半会分给内核。
     * 前半部分是计算内存大小使多少个页，在位图中，一页表示为一位，所以除以后面部分，
     * 即一页位图可以有多少位。
     * */
    pmalloc_entc = tot_mem_size / PAGE_4K_SIZE / 32;
    int pgc      = (tot_mem_size / PAGE_4K_SIZE) / (PAGE_4K_SIZE * 8);
    //计算出位图所需的字节数
    int pg_bytes = pgc >> 5;   //=/32
    //初始化vmalloc内存位图
    //计算位图需要多少个int
    // size_t vmec= (mem_size/2-0x1000000)/PAGE_4K_SIZE/32;//去掉内核代码16M
    size_t vmms = (mem_size / 2 - 0x1000000);
    comprintf("tot memsize:0x%l,available size 0x%l,kmalloc bitmap taking %l bytes\n",
              tot_mem_size,
              mem_size,
              vmms);
    //创建mhdr
    kmalloc_mhdr = kmhdrs = VMALLOC_BASE;
    for (int i = 0; i < MAX_KMHDRS; i++)
        kmhdrs[i].type = -1;
    //先占用两页作为mhdrs
    kmhdrs[0].base = VMALLOC_BASE;
    kmhdrs[0].len  = vmms;
    kmhdrs[0].prev = NULL;
    kmhdrs[0].next = NULL;
    kmhdrs[0].type = MEM_TYPE_AVAILABLE;
    kmhdrs[0].flag = MEM_FLAG_R | MEM_FLAG_W;
    kmalloc(VMALLOC_BASE, PAGE_4K_SIZE * 2);

    pmhdrs = kmalloc(0, PAGE_4K_SIZE);
    for (int i = 0; i < MAX_PMHDRS; i++) {
        pmhdrs[i].type = -1;
        pmhdrs[i].next = NULL;
        pmhdrs[i].prev = NULL;
    }
    for (int i = 0; i < mmap_t_i; i++) {
        pmhdrs[i].base = phy_mmap_struct[i].base;
        pmhdrs[i].len  = phy_mmap_struct[i].len;
        pmhdrs[i].flag = 0;
        pmhdrs[i].next = pmhdrs + i + 1;
        pmhdrs[i].prev = pmhdrs + i - 1;
        switch (phy_mmap_struct[i].type) {
        case MULTIBOOT_MEMORY_AVAILABLE:
            pmhdrs[i].type = MEM_TYPE_AVAILABLE;
            pmhdrs[i].flag = MEM_FLAG_R;
            break;
        default: pmhdrs[i].type = MEM_TYPE_RSVD; break;
        }
    }
    pmhdrs[0].prev            = NULL;
    pmhdrs[mmap_t_i - 1].next = NULL;
    for (malloc_hdr* mh = pmhdrs; mh && mh->base < 0x40000000; mh = mh->next) {
        //内核占用低1GB
        if (mh->type == MEM_TYPE_AVAILABLE) {
            if (mh->base + mh->len < 0x40000000) {
                mh->type = MEM_TYPE_USED;
                mh->flag = MEM_FLAG_R | MEM_FLAG_W | MEM_FLAG_X;
            }
            else if (mh->base < 0x40000000) {
                mhdr_split(mh, 0x40000000, pmhdrs, MAX_PMHDRS);
                mh->type = MEM_TYPE_USED;
                mh->flag = MEM_FLAG_R | MEM_FLAG_W | MEM_FLAG_X;
            }
        }
    }
    pmalloc_mhdr = pmhdrs;
}
/*
page_map存储方式:
0x00000000
little end
*/
addr_t req_a_page()
{
    for (int i = 0; i < pmalloc_entc; i++) {
        for (int j = 0; j < 32; j++) {
            unsigned int bit = page_map[i] & (1 << j);
            if ((i * 32 + j) * 4096 >= 0x100000 && (bit == 0u)) {
                // comprintf("req_a_page:before:page_map[%d]=0x%x,",i,page_map[i]);
                page_map[i] = page_map[i] | (1 << j);
                // comprintf("now = 0x%x",page_map[i]);
                return i * 32 + j;   // num of page
            }
        }
    }
    return -1;
}
/// @brief
/// 将mhdr对应内存分成两块，返回高地址块内存的mhdr，其属性等复制自原来mhdr，低地址的mhdr来自被分割的mhdr。
/// @param target 被分割的mhdr
/// @param split_point 分割地址点
/// @return
/// 高地址块内存的mhdr,即被分割出来的mhdr;如果割出来高地址内存大小为0，返回低地址mhdr，如果低地址内存大小为0，返回高地址mhdr。
malloc_hdr* mhdr_split(malloc_hdr* target, off_t split_point, malloc_hdr* array, size_t arraylen)
{
    //内部实现的时候出现大小为0的mhdr不创建
    if (target->base >= split_point || target->base + target->len <= split_point)
        return target;
    malloc_hdr* nmh = 0;   // kmalloc(0, sizeof(malloc_hdr));
    for (int i = 0; i < arraylen; i++) {
        if (array[i].type == -1) {
            nmh = array + i;
            break;
        }
    }
    if (!nmh) {
        comprintf("mhdr split err: no more space\n");
        return NULL;
    }
    nmh->next = target->next;
    if (target->next)
        target->next->prev = nmh;

    nmh->prev    = target;
    target->next = nmh;

    nmh->base = split_point;
    nmh->len  = target->len - split_point + target->base;
    nmh->flag = target->flag;
    nmh->type = target->type;

    target->len = split_point - target->base;

    return nmh;
}
//把后者指向的内存合并到前者里面去，然后释放后者，返回前者。
//如果二者的内存不相邻，或者属性不同，则不会做操作。
malloc_hdr* mhdr_merge(malloc_hdr* prev, malloc_hdr* next)
{
    //向前合并属性相同的分配头
    if (!prev || !next)
        return prev;
    off_t base = next->base;
    if (prev->base + prev->len >= base && next->type == prev->type && next->flag == prev->flag) {
        prev->len  = base + next->len - prev->base;
        prev->next = next->next;
        if (next->next)
            next->next->prev = prev;
        next->type = -1;
        next->prev = 0;
        next->next = 0;
        next->base = 0;
        next->len  = 0;
        next->flag = 0;
        // kmfree(next);
        // comprintf("merged mhdr: base %l new size%l\n", prev->base, prev->len);
    }
    return prev;
}
void* kmalloc(off_t addr, size_t size)
{
    addr = PAGE_4K_ALIGN(addr);
    size = PAGE_4K_ALIGN(size);
    for (malloc_hdr* mh = kmalloc_mhdr; mh; mh = mh->next) {

        if (mh->type != MEM_TYPE_AVAILABLE || mh->len < size)
            continue;
        //以下为符合要求
        //分割空闲内存
        malloc_hdr* nmh = mhdr_split(mh, mh->base + size, kmhdrs, MAX_KMHDRS);
        // malloc_hdr* top=mhdr_split(nmh,addr+size,kmhdrs,MAX_KMHDRS);
        mh->type = MEM_TYPE_USED;
        mh->flag |= MEM_FLAG_W | MEM_FLAG_X | MEM_FLAG_R;

        off_t ret_base = mh->base;
        //向前合并属性相同的分配头
        mhdr_merge(mh->prev, mh);
        // memset(addr, 0, size);

        return ret_base;
    }
    return NULL;
}
int kmfree(off_t addr)
{
    for (malloc_hdr* mh = kmalloc_mhdr; mh; mh = mh->next) {
        if (mh->base != addr)
            continue;
        mh->type = MEM_TYPE_AVAILABLE;
        mh->flag = 0;
        //合并空闲项
        mhdr_merge(mh->prev, mh);
        // malloc_hdr* mp;
        // for(mp=mh;mp->prev&&mh->type==MEM_TYPE_AVAILABLE;mp=mp->prev);
        // while (mp->next&&mp->next==MEM_TYPE_AVAILABLE)
        // {
        //     mp->len+=mp->next->len;
        //     //drop the next
        //     mp->next->type=-1;
        //     mp->next->prev=mp;
        //     mp->next=mp->next->next;
        // }
        return 1;
    }
    return 0;
}
void* pmalloc(size_t size)
{
    for (malloc_hdr* mh = pmalloc_mhdr; mh; mh = mh->next) {
        // comprintf("pmalloc iterate: mh: base=%l,len=%l,type=%l\n", mh->base, mh->len, mh->type);
        if (mh->type != MEM_TYPE_AVAILABLE || mh->len < size)
            continue;
        //以下为符合要求
        //分割空闲内存
        malloc_hdr* nmh = mhdr_split(mh, mh->base + size, pmhdrs, MAX_PMHDRS);

        mh->type = MEM_TYPE_USED;
        mh->flag |= MEM_FLAG_W | MEM_FLAG_X | MEM_FLAG_R;

        // comprintf("pmalloc at %l, size:%l. type=%l\n", mh->base, size, mh->type);
        void* retv = mh->base;
        //向前合并属性相同的分配头
        malloc_hdr* fin = mhdr_merge(mh->prev, mh);
        // comprintf(
        //     "now the merged pmalloc base=%l,len=%l,type=%l\n", fin->base, fin->len, fin->type);
        fin->link++;
        return retv;
    }
    comprintf("failed pmalloc\n");
    return NULL;

    /* void *ret=(void*)(get_phyaddr(req_a_page()));
    // comprintf("pmalloc(PAGE_4K_SIZE):%l\n",ret);
    return ret; */
}
int pmfree(void* addr, size_t len)
{
    malloc_hdr* prev = pmalloc_mhdr;
    for (malloc_hdr* mh = pmalloc_mhdr; mh; mh = mh->next) {
        if (mh->base < addr) {
            prev = mh;
            continue;
        }
        mh->link--;
        if (mh->link > 0)
            return 1;
        if (prev->base < addr) {
            //分割
            prev = mhdr_split(prev, addr, pmalloc_mhdr, MAX_PMHDRS);
        }
        prev->type = MEM_TYPE_AVAILABLE;
        prev->flag = 0;
        //合并空闲项
        mhdr_merge(prev->prev, prev);
        // malloc_hdr* mp;
        // for(mp=prev;mp->prev&&prev->type==MEM_TYPE_AVAILABLE;mp=mp->prev);
        // while (mp->next&&mp->next==MEM_TYPE_AVAILABLE)
        // {
        //     mp->len+=mp->next->len;
        //     //drop the next
        //     mp->next->type=-1;
        //     mp->next->prev=mp;
        //     mp->next=mp->next->next;
        // }
        return 1;
    }
    return 0;
}
int free_page(char* paddr)
{
    int num     = (int)paddr / 4096;
    int n       = num / 32;
    int r       = num % 32;
    page_map[n] = page_map[n] & ~(unsigned int)(1 << r);
}

int free_pages_at(int base, int pgn)
{
    for (int i = 0; i < pgn; i++) {
        free_page(base + i * PAGE_4K_SIZE);
    }
}
int check_page(int num)
{
    int n   = num / 32;
    int r   = num % 32;
    int bit = page_map[n] & (1 << r);
    return bit;
}
/*
 * 获得这个页对应的物理内存地址
 * */
int get_phyaddr(int num)
{
    if (num == -1)
        return -1;
    return num * 0x1000;
}

void set_page_item(page_item* item_addr, int phy_addr, int attr)
{
    *item_addr = 0;
    *item_addr |= phy_addr & 0xfffff000;
    *item_addr |= attr;
}
void set_1gb_pdpt(page_item* ppdpt, int pa, unsigned int extra_attr)
{
    *ppdpt = 0;
    *ppdpt |= PAGE_PRESENT | PDPTE_1GB | extra_attr;
    unsigned int hipa = pa & 0xffffc0000000ul;
    *ppdpt |= hipa;
}
void set_2mb_pde(page_item* pde, int pa, int extra_attr)
{
    *pde = 0;
    *pde |= PAGE_PRESENT | PAGE_4MB_PAGE | PDE_4MB_PAT | extra_attr;
    unsigned int hipa = pa & 0xffc00000;
    *pde |= hipa;
}
/*
int req_page_at(int addr,int pgn)
{
    int ret=0;
    int n=addr/0x1000;
    int i=n/32,j=n%32;
    //先检查
    for(int k=0;k<pgn;k++)
        if(page_map[i]&(u32)(1<<j))
        {
            ret=-1;
            break;
        }
    //再申请
    for(int k=0;k<pgn;k++)
        page_map[i]&=(u32)(1<<j);
    return ret;
} */
//在bitmap申请指定的页面,base默认0x1000对齐
addr_t req_page_at(addr_t base, int pgn)
{
    if (base == 0)   //不指定地址
    {
        return get_phyaddr(req_a_page());
    }
    if (!is_pgs_ava(base, pgn))
        return -1;   //先检查
    int pgni = base / 4096;
    int pgi  = pgni / 32;
    int pgj  = pgni % 32;
    for (int i = 0; i < pgn; i++) {
        page_map[i] |= (1 << pgj);
    }
    return 0;
}
int chk_vm(int base, int pgn)
{
    int* pdet = 0;
    __asm__ volatile("mov %%cr3,%0" : "=r"(pdet));
    int* pt = pdet[base / PAGE_INDEX_SIZE] & 0xfffff000;
    if (!(pdet[base / PAGE_INDEX_SIZE] & PAGE_PRESENT) ||
        !(pt[base % PAGE_INDEX_SIZE / PAGE_SIZE] & PAGE_PRESENT)) {
        return -1;
    }
    return 0;
}
//查看指定区域的页内存是否可用
int is_pgs_ava(int base, int pgn)
{
    int pgi = base / 4096;
    for (int i = 0; i < pgn; i++) {
        if (check_page(pgi + i) != 0)
            return 0;
    }
    return 1;
}
//取消映射，调用前应当将addr和len对齐4K，而且不允许释放的内存跨越多个映射块
int do_munmap(void* addr, int len)
{

    mmap_struct* lp = current->mmaps;
    for (; lp; lp = lp->node.next) {
        mmap_struct* mp = lp;
        if (mp->base <= addr && mp->base + mp->len >= addr + len) {
            //去掉取消映射的部分，将原先分配的整块映射一分为二
            if (mp->base + mp->len > addr + len) {
                mmap_struct* extra = kmalloc(0, sizeof(mmap_struct));
                list_add(all_mmaps, extra);
                extra->base = addr + len;
                extra->len  = mp->len - (size_t)addr - len;
                //加到进程映射链表
                list_add(current->mmaps, extra);
            }
            mp->len = addr - mp->base;
            //把相应的物理内存分配也释放
            pmfree(mp->pmhdr->base + addr - mp->base, len);
            //修改页表
            for (int i = 0; i < TO_MPGN(len); i++) {
                smmap(0, addr + i * PAGE_4K_SIZE, 0, current->pml4);
            }
            return 0;
        }
    }
    set_errno(-ENOMEM);
    return -1;
}
//检验一个地址指向的内存是否可以做相应的操作。可以访问的标准是，有无在进程映射结构中做好映射。
int verify_area(void* addr, int len, int prot)
{
    int off = 0;
    //可能这个内存区跨越了好几个映射
    while (off < len) {
        mmap_struct* mp = get_mmap(addr + off);
        if (!mp) {
            return 0;
        }
        int flags = mp->flags;
        if ((prot & PROT_WRITE) && !(flags & PROT_WRITE))
            return 0;
        if ((prot & PROT_EXEC) && !(flags & PROT_EXEC))
            return 0;
        off += mp->len;
    }
    return 1;
}