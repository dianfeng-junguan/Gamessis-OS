#pragma once
/* 
这部分负责内存的按页分配，内存上下界的检测，和页表页目录的管理。
 */
#include "page.h"
#include "typename.h"
#include "multiboot2.h"
#ifdef IA32
typedef struct
{
    int base;
    int len;
    int type;
}mem_t;
#else
typedef struct
{
    unsigned long base;
    unsigned long len;
    unsigned long type;
}mem_t;
#endif
#define MAX_MEM_STRUCT 20
#define MEM_TYPE_RSVD 0
#define MEM_TYPE_AVAILABLE 1
#define MEM_TYPE_DEFECTED 5
#define MEM_TYPE_ACPI 3
#define MEM_TYPE_HIBER_PRESERVE 4
//不定义IA32，默认是64位
#ifdef IA32
#define PAGE_INDEX_ADDR 0x100000
#define PAGE_TABLE_ADDR 0x101000
typedef unsigned int page_item;
#else
#define PML4_ADDR 0x101000
#define PDPT_ADDR 0x102000
#define PD_ADDR 0x103000
#define PML4E_SIZE 0x8000000000ul
#define PDPTE_SIZE 0x40000000ul
#define PDE_SIZE 0x200000
#define PAGE_4K_SIZE 0x1000
#define PAGE_2M_SIZE 0x200000
#define PAGE_4K_MASK 0xfffffffff000ul
#define PAGE_2M_MASK 0xfffffff00000ul
///向上对齐。
#define PAGE_2M_ALIGN(addr) (((unsigned long) (addr) + PAGE_2M_SIZE - 1) &PAGE_2M_MASK)
///向上对齐。
#define PAGE_4K_ALIGN(addr) (((unsigned long) (addr) +PAGE_4K_SIZE - 1) &PAGE_4K_MASK)
typedef unsigned long long page_item;
#endif
//内存页的分配-不是指页表
void init_memory();
void set_mem_area(unsigned long base, unsigned long len, unsigned long type);
void set_high_mem_base(int base);
//申请一页内存，返回内存地址。
addr_t req_a_page();
addr_t req_page_at(addr_t base,int pgn);

int free_page(char *paddr);
int free_pages_at(int base,int pgn);

//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn);
int check_page(int num);

int get_phyaddr(int num);
//页表页目录部分
void set_page_item(page_item *item_addr,int phy_addr,int attr);
void set_2mb_pde(page_item *pde, int pa, int extra_attr);
void set_1gb_pdpt(page_item* ppdpt,int pa,unsigned int extra_attr);
//映射一页4KB内存
stat_t mmap(u64 pa,u64 la,u32 attr);

stat_t smmap(addr_t pa,addr_t la,u32 attr,page_item* pml4p);
//解除映射
stat_t mdemap(u64 la);

void page_err();
//vmalloc区部分
addr_t vmalloc();
int vmfree(addr_t ptr);
int chk_vm(int base, int pgn);

int init_paging();