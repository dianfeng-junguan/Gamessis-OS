
#define PAGE_AVAILABLE 0 
#define PAGE_USED 1
#define PAGE_BITMAP_NR 64

#define PAGE_PRESENT 1
#define PAGE_RWX 2
#define PAGE_FOR_ALL 4
#define PAGE_4MB_PAGE 0x80
#define PDE_4MB_PAT 0x1000
#define PAGE_INDEX_SIZE 0x400000
#define PAGE_SIZE 0x1000
//64位独有
#define PDE_4MB 0X80
#define PDPTE_1GB 0x80


#define PAGE_INDEX_ADDR 0x1000
#define PAGE_TABLE_ADDR 0x2000
#define MEM_END 0xffffffff

#define VMALLOC_BASE 0x20000
#define VMALLOC_PGN ((0xb8000-0x20000)/0x1000)