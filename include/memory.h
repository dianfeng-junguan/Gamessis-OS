#pragma once
/* 
这部分负责内存的按页分配，内存上下界的检测，和页表页目录的管理。
 */
#include "page.h"
#include "typename.h"
#include <sys/types.h>
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
typedef struct _malloc_header
{
    off_t base;
    size_t len;
    char type;
    char flag;
    struct _malloc_header* next;
    struct _malloc_header* prev;
    int link;//引用次数
}malloc_hdr;
#define MAX_PMHDRS 85
#define MAX_KMHDRS 170
#endif
#define MAX_MEM_STRUCT 20
#define MEM_TYPE_RSVD 0
#define MEM_TYPE_AVAILABLE 1
#define MEM_TYPE_ACPI 3
#define MEM_TYPE_HIBER_PRESERVE 4
#define MEM_TYPE_DEFECTED 5
#define MEM_TYPE_USED 6

#define MEM_FLAG_R 1
#define MEM_FLAG_W 2
#define MEM_FLAG_X 4
//不定义IA32，默认是64位
#ifdef IA32
#define PAGE_INDEX_ADDR 0x100000
#define PAGE_TABLE_ADDR 0x101000
typedef unsigned int page_item;
#else
#define PML4_ADDR 0xffff800000101000
#define PDPT_ADDR 0xffff800000102000
#define PD_ADDR 0xffff800000103000
#define PML4E_SIZE 0x8000000000ul
#define PDPTE_SIZE 0x40000000ul
#define PDE_SIZE 0x200000
#define PAGE_4K_SIZE 0x1000
#define PAGE_2M_SIZE 0x200000
#define PAGE_4K_MASK 0xfffffffffffff000ul
#define PAGE_2M_MASK 0xfffffffffff00000ul
#define KNL_BASE 0xffff800000000000ul
#define MAPPING_AREA (KNL_BASE+0x1000000ul)
#define MAPPING_AREA_SIZE (0x1000000ul)
///向上对齐。
#define PAGE_2M_ALIGN(addr) (((unsigned long) (addr) + PAGE_2M_SIZE - 1) &PAGE_2M_MASK)
///向上对齐。
#define PAGE_4K_ALIGN(addr) (((unsigned long) (addr) +PAGE_4K_SIZE - 1) &PAGE_4K_MASK)

#define PF_LEVEL_VIOLATION 1
#define PF_WRITING  2
#define PF_USER_MODE 4
#define PF_RSVD 8
#define PF_INS_FETCH 16
#define PF_PROTECT_KEY 32
#define PF_SHADOW_STK_ACCESS 64
#define PF_HLAT 128
#define PF_SGX (0x8000)
typedef unsigned long long page_item;
#endif
//内存页的分配-不是指页表
void init_memory();
void set_mem_area(unsigned long base, unsigned long len, unsigned long type);
void set_high_mem_base(int base);
//申请一页内存，返回内存页的编号。
addr_t req_a_page();
addr_t req_page_at(addr_t base,int pgn);
//申请一页空闲的物理内存，返回的是物理地址。
void * pmalloc(size_t size);
int pmfree(void *addr,size_t len);

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
// stat_t mmap(u64 pa,u64 la,u32 attr);

stat_t smmap(addr_t pa,addr_t la,u32 attr,page_item* pml4p);
//解除映射
stat_t mdemap(u64 la);

void page_err();
//申请一块内核缓存。
//addr用于指定内核缓存地址，
//size和addr都会做4K对齐之后分配。
//*addr参数已经废弃不用。
void *kmalloc(off_t addr,size_t size);
addr_t kmallocat(addr_t addr,int pgc);
int kmfree(off_t addr);
int chk_vm(int base, int pgn);

int init_paging();
int do_munmap(void *addr,int len);

int verify_area(void* addr,int len,int prot);
extern addr_t usr_mem_pa;