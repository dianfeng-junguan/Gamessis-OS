#include "memory.h"
#include "typename.h"
#include "sys/types.h"
#include "int.h"
#include "framebuffer.h"
#include "log.h"
#include "proc.h"
#include "mem.h"

//page bitmap. refers to pages of mem.
unsigned int *page_map=NULL;//[PAGE_BITMAP_NR]={0};
page_item *page_index=PAGE_INDEX_ADDR;
page_item *page_table=PAGE_TABLE_ADDR;
//64位用
page_item* pml4=PML4_ADDR;
page_item* pdpt=PDPT_ADDR;
page_item* pd=PD_ADDR;
unsigned int *vmalloc_map=VMALLOC_BASE;//[VMALLOC_PGN/32]={0};
mem_t mmap_struct[MAX_MEM_STRUCT];
int kmalloc_entry_num=VMALLOC_PGN>>5,kmalloc_pgc=VMALLOC_PGN;
//以kb为单位
int high_mem_base=1024;
int mmap_t_i=0;

stat_t mmap(addr_t pa,addr_t la,u32 attr)
{
    return smmap(pa,la,attr,current->pml4);
   /* //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
    {
        pdp=(page_item*)vmalloc();
        memset(pdp,0,4096);
        pdptp[pdpti]=(addr_t)pdp|attr;
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
    if(!((unsigned long long)pt & PAGE_PRESENT))
    {
        pt=(page_item*)vmalloc();
        memset(pt,0,4096);
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
    }
    pt=(page_item*)((addr_t)pt & ~0xff);

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
    return NORMAL;*/
}

stat_t smmap(addr_t pa,addr_t la,u32 attr,page_item* pml4p)
{
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    //canonical 高地址判断
    if(la>0x7ffffffffffful){
        la&=~0xffff000000000000ul;
    }
    page_item *pdptp= (page_item *) (pml4p[la / PML4E_SIZE]);//指向的pdpt表
    int pml4i=la / PML4E_SIZE;
    if(!((unsigned long long)pdptp&PAGE_PRESENT))
    {
        pdptp=(page_item*) kmalloc();
        memset(pdptp,0,4096);
        //这里使用了狡猾的技巧：kmalloc的内存-KNL_BASE直接就是实际的物理地址
        pml4[pml4i]=((addr_t)pdptp&~KNL_BASE)|attr;
    }
    pdptp=(page_item*)(((addr_t)pdptp&~0xff)|KNL_BASE);

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
    {
        pdp=(page_item*) kmalloc();
        memset(pdp,0,4096);
        pdptp[pdpti]=((addr_t)pdp&~KNL_BASE)|attr;
    }
    pdp=(page_item*)(((addr_t)(pdp)&~0xff)|KNL_BASE);

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
    if(!((unsigned long long)pt & PAGE_PRESENT))
    {
        pt=(page_item*) kmalloc();
        memset(pt,0,4096);
        pdp[la%PDPTE_SIZE/PDE_SIZE]= ((addr_t)pt&~KNL_BASE) | attr;
    }
    pt=(page_item*)(((addr_t)pt & ~0xff)|KNL_BASE);

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_4K_SIZE]=pa|attr;//映射
    return NORMAL;
}

stat_t mdemap(addr_t la)
{
    return mmap(0l,la,0);
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
    unsigned int pt=PAGE_TABLE_ADDR;
    page_item *pde=page_index;
    for(int i=0;i<256;i++)//256 PDE表示内核空间
    {
        set_page_item(pde+i,pt,PAGE_PRESENT|PAGE_RWX);
        for(int j=0;j<1024;j++)
        {
            set_page_item(pt,i*0x400000+j*0x1000,PAGE_PRESENT|PAGE_RWX);
            pt+=4;
        }
        
    }
    //开启分页模式
    asm volatile("mov %0,%%eax\r\n mov %%rax,%%cr3\r\n"\
                    "mov %%cr0,%%rax\r\n"
                    "or $0x80000000,%%eax\r\n"
                    "mov %%rax,%%cr0":"=m"(page_index));
    #else
    //设置PML4
//    set_page_item(pml4,PDPT_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);
    //设置第一项pdpte，也就是内核空间
//    set_1gb_pdpt(pdpt,0,PAGE_RWX);//设置PDPT0x40000000ul
//    set_page_item(pdpt+1,PD_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);

    #endif
}
void set_high_mem_base(int base)
{
    high_mem_base=base;
}
void set_mem_area(unsigned long base, unsigned long len, unsigned long type)
{
    mmap_struct[mmap_t_i].base=base;
    mmap_struct[mmap_t_i].len=len;
    mmap_struct[mmap_t_i++].type=type;
}
addr_t kmalloc()
{
    for(int i=0;i<VMALLOC_PGN/32;i++)
    {
        for(int j=0;j<32;j++)
        {
            if(!(vmalloc_map[i]&(1<<j)))
            {
                vmalloc_map[i]|=(1<<j);
                return VMALLOC_BASE+(i*32+j)*0x1000;
            }
        }
    }
}
addr_t kmallocat(addr_t addr,int pgc)
{
    int pi=(addr-VMALLOC_BASE)/PAGE_4K_SIZE;
    if(addr==0){
        int l=0,p=0;
        for(int i=0;i<kmalloc_pgc;i++){
            if(!(vmalloc_map[i/32]&(1u<<(i%32)))){
                if(l==0)
                    p=i;//开头空页
                l++;
            } else
                l=0;
            if(l==pgc)break;
        }
        if(l<pgc)return -1;
        //开始占用
        for(int i=0;i<pgc;i++){
            vmalloc_map[(p+i)/32]|=1u<<((p+i)%32);
        }
        return VMALLOC_BASE+PAGE_4K_SIZE*p;
    }
    for(int i=0;i<pgc;i++){
        if(vmalloc_map[(pi+i)/32]&(1<<((pi+i)%32)))
            return -1;
    }
    //
    for(int i=0;i<pgc;i++){
        vmalloc_map[(pi+i)]|=(1<<((pi+i)%32));
    }
    return addr;

}

int kmfree(addr_t ptr)
{
    int num=ptr/PAGE_SIZE;
    int n=num/32;
    int r=num%32;
    vmalloc_map[n]=vmalloc_map[n]&~(unsigned int)(1<<r);
}
void page_err(){
    asm("cli");
    printf("page err\n");
    unsigned long err_code=0,l_addr=0;
    asm volatile("mov 0(%%rbp),%0":"=r"(err_code));
    asm volatile("mov %%cr2,%0":"=r"(l_addr));//试图访问的地址
    int p=err_code&1;

    if(!p)
    {
        //accessing non-existent page
        //检查地址合法性
        if(l_addr>=MEM_END)
            ;
        //在进程的页表中申请新页
        smmap(get_phyaddr(req_a_page()),l_addr&~0xfff,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,current->pml4);
//        int *pdet=0,*pt=0;
//        asm volatile("mov %%cr3,%0":"=r"(pdet));
//        if(!(pdet[l_addr/PAGE_INDEX_SIZE]&PAGE_PRESENT))
//        {
//            //PDE没分配
//            pt=(int *)vmalloc();
//            pdet[l_addr/PAGE_INDEX_SIZE]=(int)pt|PAGE_PRESENT|PAGE_FOR_ALL;
//        }else
//            pt=pdet[l_addr/PAGE_INDEX_SIZE]&0xfffff000;
//        //分配PTE
//        int ptei=l_addr%PAGE_INDEX_SIZE/PAGE_SIZE;
//        pt[ptei]|=get_phyaddr(req_a_page())|PAGE_PRESENT|PAGE_FOR_ALL;
    }
    else
    {
        //page level protection
    }
    p=err_code&2;
    if(p)printf("when writing\n");else //puts("when reading");
    p=err_code&4;
    if(!p)printf("supervisor mode\n");else //puts("user mode");
    p=err_code&16;
    if(p)printf("an instruction tries to fetch\n");
    unsigned int addr=0;
    asm volatile("mov 8(%%rbp),%0":"=r"(addr));
    printf("occurred at %x(paddr), %x(laddr)\n",addr,l_addr);
    extern int cur_proc;
    extern struct process *task;
    if(task[cur_proc].pid==1)//系统进程
    {
        printf("sys died. please reboot.\n");
        asm volatile("jmp .");
    }
    //杀死问题进程
//    del_proc(cur_proc);
    // printf("killed the problem process.\n");
    // printf("shell:>");
    eoi();
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    __asm__ volatile ("sti \r\n  leave\n add $8,%rsp \n iretq");
}
void init_memory()
{
    extern addr_t _knl_end,_knl_start;//lds中声明的内核的结尾地址，放置位图
    //获取内存大小
    size_t mem_size=mmap_struct[mmap_t_i-1].base+mmap_struct[mmap_t_i-1].len;
    //计算出所需内存页数量
    /*
     * 注：物理内存的一半会分给内核，所以除以2，内核空间page map不表示。
     * 前半部分是计算内存大小使多少个页，在位图中，一页表示为一位，所以除以后面部分，
     * 即一页位图可以有多少位。
     * */
    int pgc=(mem_size/2/PAGE_4K_SIZE)/(PAGE_4K_SIZE*8);
    //计算出位图所需的字节数
    int pg_bytes=pgc>>5;//=/32
    //初始化vmalloc内存位图
    //计算位图需要多少个int
    size_t vmec= (mem_size/2-0x1000000)/PAGE_4K_SIZE/32;//去掉内核代码16M
    size_t vmms=vmec*4/PAGE_4K_SIZE;//位图自己需要多少页
    comprintf("tot memsize:0x%x,kmalloc pages count:%d,kmalloc bitmap taking 0x%d pages\n", mem_size,vmec,vmms);
    if(vmec*4%PAGE_4K_SIZE)
        vmms++;
    for(int i=0;i<vmec;i++){
        vmalloc_map[i]=0;
    }
    //位图占用前几页
    for(int i=0,j=0;j*32+i<vmms;i++)
    {
        if(i==32)
        {
            i=0;
            j++;
        }
        vmalloc_map[j]|=1u<<i;
    }
    //kmalloc连续的内存
    page_map=kmallocat(0,pgc);//(unsigned int*)PAGE_4K_ALIGN(0xc00000);
    int* p=page_map;
    addr_t curp=0;
    for(int i=0;i<mmap_t_i;i++){
        int cont=0;
        if(mmap_struct[i].type!=MULTIBOOT_MEMORY_AVAILABLE)
            cont=-1;
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
            *(p++)=cont;
        }
    }
    /*//低16M空间直接被内核占用
    for(int i=0;i<128;i++){
        page_map[i]=0xffffffff;
    }*/
    //然后把1gb的pdpt改成许多个2MB页（4KB的话太多了），然后把映射区设置成4KB页，这样之后可以使用映射区
    //这里不能用smmap
    /*page_item *pd=kmalloc();//之后pdpt的第一项就会指向这里。
    memset(pd,0,PAGE_4K_SIZE);
    addr_t pdpm=(addr_t)pd-KNL_BASE;
    //上面用了一个不得已的措施：利用高地址前1G实际对应物理内存低1G，所以直接减掉高地址基地址获得对应物理地址。
    //理想情况下，这个东西以后不会动
    for(int i=0;i<512;i++){
        set_2mb_pde(pd+i,i*PAGE_2M_SIZE,PAGE_PRESENT|PAGE_RWX);
    }
    //设置索引区
    int mapai=(MAPPING_AREA-KNL_BASE)/PAGE_2M_SIZE;//映射区开始处对应索引
    for(int i=0;i<MAPPING_AREA_SIZE/PAGE_2M_SIZE;i++){
        page_item *pt=kmalloc();
        addr_t ptpm=(addr_t)pt-KNL_BASE;
        for(int j=0;j<512;j++){
            set_page_item(pt+j,MAPPING_AREA-KNL_BASE+j*PAGE_4K_SIZE,PAGE_PRESENT|PAGE_RWX);
        }
        pd[i+mapai]=ptpm|PAGE_PRESENT|PAGE_RWX;
    }
    page_item *pdpt=(addr_t)pml4[256]&PAGE_4K_MASK+KNL_BASE;
    pdpt[0]=pdpm|PAGE_PRESENT|PAGE_RWX;*/

}
/*
page_map存储方式:
0x00000000
little end
*/
addr_t req_a_page(){
    for(int i=0;i<PAGE_BITMAP_NR;i++){
        for(int j=0;j<32;j++){
            unsigned int bit=page_map[i]&(1<<j);
            if((i*32+j)*4096>=0x100000&&!bit)
            {
                page_map[i]=page_map[i]|(1<<j);
                return i*32+j;//num of page

            }
        }
    }
}

void * pmalloc(){
    return (void*)get_phyaddr(req_a_page());
}
int free_page(char *paddr){
    int num=(int)paddr/4096;
    int n=num/32;
    int r=num%32;
    page_map[n]=page_map[n]&~(unsigned int)(1<<r);
}

int free_pages_at(int base,int pgn){
    for(int i=0;i<pgn;i++){
        free_page(base+i*PAGE_4K_SIZE);
    }
}
int check_page(int num){
    int n=num/32;
    int r=num%32;
    int bit=page_map[n]&(1<<r);
    return bit;
}
/*
 * 获得这个页对应的物理内存地址
 * */
int get_phyaddr(int num){
    return num*0x1000;
}

void set_page_item(page_item *item_addr,int phy_addr,int attr)
{
    *item_addr=0;
    *item_addr|=phy_addr&0xfffff000;
    *item_addr|=attr;
}
void set_1gb_pdpt(page_item* ppdpt,int pa,unsigned int extra_attr)
{
    *ppdpt=0;
    *ppdpt|=PAGE_PRESENT|PDPTE_1GB|extra_attr;
    unsigned int hipa=pa&0xffffc0000000ul;
    *ppdpt|=hipa;
}
void set_2mb_pde(page_item *pde, int pa, int extra_attr)
{
    *pde=0;
    *pde|=PAGE_PRESENT|PAGE_4MB_PAGE|PDE_4MB_PAT|extra_attr;
    unsigned int hipa=pa&0xffc00000;
    *pde|=hipa;
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
addr_t req_page_at(addr_t base,int pgn)
{
    if(base==0)//不指定地址
    {
        return get_phyaddr(req_a_page());
    }
    if(!is_pgs_ava(base,pgn))return -1;//先检查
    int pgni=base/4096;
    int pgi=pgni/32;
    int pgj=pgni%32;
    for(int i=0;i<pgn;i++)
    {
        page_map[i]|=(1<<pgj);
    }
    return 0;

}
int chk_vm(int base, int pgn)
{
    int *pdet=0;
    asm volatile("mov %%cr3,%0":"=r"(pdet));
    int *pt=pdet[base/PAGE_INDEX_SIZE]&0xfffff000;
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
    !(pt[base%PAGE_INDEX_SIZE/PAGE_SIZE]&PAGE_PRESENT))
    {
        return -1;
    }
    return 0;
}
//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn)
{
    int pgi=base/4096;
    for(int i=0;i<pgn;i++)
    {
        if(check_page(pgi+i)!=0)return 0;
    }
    return 1;

}
