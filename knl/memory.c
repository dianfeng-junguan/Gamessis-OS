#include "memory.h"
#include "typename.h"
#include "int.h"
//page bitmap. refers to pages of mem.
unsigned int page_map[PAGE_BITMAP_NR]={0};
page_item *page_index=PAGE_INDEX_ADDR;
page_item *page_table=PAGE_TABLE_ADDR;
//64位用
page_item* pml4=PML4_ADDR;
page_item* pdpt=PDPT_ADDR;
page_item* pd=PD_ADDR;
unsigned int vmalloc_map[VMALLOC_PGN/32]={0};
mem_t mmap_struct[MAX_MEM_STRUCT];
//以kb为单位
int high_mem_base=1024;
int mmap_t_i=0;

stat_t mmap(addr_t pa,addr_t la,u32 attr)
{
    //内核空间映射不能更改
    if(la/PML4E_SIZE==0)return ERR;
    page_item *pdptp=pml4[la/PML4E_SIZE];//指向的pdpt表
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
    page_item* pdp=pdptp[pdpti];//指向的pd
    if(*pdp&PAGE_PRESENT)return ALREADY_USED;//已分配pd
    //分配pd
    addr_t pdaddr=vmalloc();
    *pdp=pdaddr&PAGE_MASK|attr;
    page_item* ptp=pdp[la%PDPTE_SIZE/PDE_SIZE];
    //新分配的pd里面肯定没有已经被占用的项
    //if(*ptp&PAGE_PRESENT)return -1;//已分配pt
    //分配pt
    addr_t ptaddr=vmalloc();
    *ptp=ptaddr&PAGE_MASK|attr;
    page_item* pte=ptp[la%PDE_SIZE/PAGE_SIZE];
    *pte=pa&PAGE_MASK|attr;//映射
    return NORMAL;
}

stat_t mdemap(addr_t la)
{
    return mmap(0l,la,0);
}
int init_paging()
{
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
    set_page_item(pml4,PDPT_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);
    set_1gb_pdpt(pdpt,0x40000000ul,PAGE_RWX);//设置PDPT
    set_page_item(pdpt+1,PD_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);
    //打开PAE(physical address extension)
    asm volatile("mov %cr4,%rax\r\n or $5,%rax\r\n mov %rax,%cr4");
    //加载PML4
    asm volatile("mov %0,%%rax\r\n mov %%rax,%%cr4":"=m"(pml4));
    //打开分页机制
    asm volatile("mov %cr0,%rax\r\n"
                    "or $0x80000000,%eax\r\n"
                    "mov %rax,%cr0");
    #endif
}
void set_high_mem_base(int base)
{
    high_mem_base=base;
}
void set_mem_area(int base,int len,int type)
{
    mmap_struct[mmap_t_i].base=base;
    mmap_struct[mmap_t_i].len=len;
    mmap_struct[mmap_t_i++].type=type;
}
addr_t vmalloc()
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

int vmfree(addr_t ptr)
{
    int num=ptr/PAGE_SIZE;
    int n=num/32;
    int r=num%32;
    vmalloc_map[n]=vmalloc_map[n]&~(unsigned int)(1<<r);
}
void page_err(){
    asm("cli");
    //puts("page err");
    unsigned long err_code=0,l_addr=0;
    asm volatile("mov 4(%%ebp),%0":"=r"(err_code));
    asm volatile("mov %%cr2,%0":"=r"(l_addr));//试图访问的地址
    int p=err_code&1;

    if(!p)
    {
        //accessing non-existent page
        //检查地址合法性
        if(l_addr>=MEM_END)
            ;
        //在进程的页表中申请新页
        int *pdet=0,*pt=0;
        asm volatile("mov %%cr3,%0":"=r"(pdet));
        if(!(pdet[l_addr/PAGE_INDEX_SIZE]&PAGE_PRESENT))
        {
            //PDE没分配
            pt=(int *)vmalloc();
            pdet[l_addr/PAGE_INDEX_SIZE]=(int)pt|PAGE_PRESENT|PAGE_FOR_ALL;
        }else
            pt=pdet[l_addr/PAGE_INDEX_SIZE]&0xfffff000;
        //分配PTE
        int ptei=l_addr%PAGE_INDEX_SIZE/PAGE_SIZE;
        pt[ptei]|=get_phyaddr(req_a_page())|PAGE_PRESENT|PAGE_FOR_ALL;
    }
    else
    {
        //page level protection
    }
    /*p=err_code&2;
    if(p)//puts("when writing");else //puts("when reading");
    p=err_code&4;
    if(!p)//puts("supervisor mode");else //puts("user mode");
    p=err_code&16;
    if(p)//puts("an instruction tries to fetch");
    unsigned int addr=0;
    asm volatile("mov 8(%%ebp),%0":"=r"(addr));
    printf("occurred at %x(paddr), %x(laddr)\n",addr,l_addr);
    extern int cur_proc;
    extern struct process *task;
    if(task[cur_proc].pid==1)//系统进程
    {
        printf("sys died. please reboot.\n");
        asm volatile("jmp .");
    }
    //杀死问题进程
    del_proc(cur_proc);*/
    // printf("killed the problem process.\n");
    // printf("shell:>");
    eoi();
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    __asm__ volatile ("sti \r\n leave\r\n add $4,%esp \r\n iret");
}
void init_memory()
{
    for(int i=0;i<8;i++){
        page_map[i]=0xffffffff;
    }
    //内核页表初始化
    //目前32mb如下分配：
    /* 
    高4mb映射到高1g的起始4mb
    剩下正常。
    asm volatile("mov ")
     */
    //page_index[768]=page_index[7];
    //page_index[7]=0;
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

int free_page(char *paddr){
    int num=(int)paddr/4096;
    int n=num/32;
    int r=num%32;
    page_map[n]=page_map[n]&~(unsigned int)(1<<r);
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
void set_2mb_pde(page_item* pde,int pa)
{
    *pde=0;
    *pde|=PAGE_PRESENT|PAGE_4MB_PAGE|PDE_4MB_PAT;
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
