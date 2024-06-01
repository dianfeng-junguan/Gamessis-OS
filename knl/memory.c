#include "memory.h"
#include "typename.h"
#include "int.h"
//page bitmap. refers to pages of mem.
unsigned int page_map[PAGE_BITMAP_NR]={0};
page_item *page_index=PAGE_INDEX_ADDR;
page_item *page_table=PAGE_TABLE_ADDR;
unsigned int vmalloc_map[VMALLOC_PGN/32]={0};
int vmalloc()
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

int vmfree(int ptr)
{
    int num=ptr/PAGE_SIZE;
    int n=num/32;
    int r=num%32;
    vmalloc_map[n]=vmalloc_map[n]&~(unsigned int)(1<<r);
}
void page_err(){
    asm("cli");
    //puts("page err");
    unsigned int err_code=0,l_addr=0;
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
int req_a_page(){
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
int req_page_at(int base,int pgn)
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
