
#define PAGE_AVAILABLE 0 
#define PAGE_USED 1
#define PAGE_BITMAP_NR 64

#define PAGE_PRESENT 1
#define PAGE_RWX 2
#define PAGE_FOR_ALL 4
#define PAGE_4MB_PAGE 0x80
#define PDE_4MB_PAT 0x1000
#define PAGE_INDEX_SIZE 0x200000
#define PAGE_SIZE 0x1000
//64位独有
#define PDE_2MB 0X80
#define PDPTE_1GB 0x80


#define PAGE_INDEX_ADDR 0xffff800000001000ul
#define PAGE_TABLE_ADDR 0xffff800000002000ul
#define MEM_END 0xffffffffffffffff

#define VMALLOC_BASE (0xffff800000000000ul+0x2000000ul)
#define VMALLOC_PGN (4096)
extern int kmalloc_entry_num,kmalloc_pgc,pmalloc_entc;