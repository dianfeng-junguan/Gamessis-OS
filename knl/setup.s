section .multiboot2 align=8
MULTIBOOT2_HEADER_MAGIC    equ 0xe85250d6
MULTIBOOT2_HEADER_LENGTH   equ multiboot2_header_end - multiboot2_header
MULTIBOOT2_HEADER_FLAGS    equ 0x00000000
multiboot2_header:
    dd MULTIBOOT2_HEADER_MAGIC
    dd MULTIBOOT2_HEADER_FLAGS ;要求有meminfo和bios dev info
    dd MULTIBOOT2_HEADER_LENGTH
    dd - (MULTIBOOT2_HEADER_MAGIC + MULTIBOOT2_HEADER_LENGTH)
mem_info_req:
    dd 4
    dd 16
    dd 0
    dd 0
end_tag:
    dd 0
    dd 8
multiboot2_header_end:

section .entry
global loader_start
extern loadermain
extern main
    
;一些全局变量的设置
;ADDRS WHERE GLOBAL VARS ARE STORED
KERNEL_SIZE equ 0xf000
GDT equ 0x500
IDT equ 0
PAGE_INDEX EQU 0x1000        ;必须是0x1000对齐不然会出问题
PAGES EQU 0x2000
STACK_AREA EQU 0x9d00        ;以节为单位
STACK_AREA_OFFSET equ 0x2c00-1

init32:
    
    ; ;填充页目录和页表
    ; ;fill_page_index
    ; mov esi,PAGE_INDEX
    ; shr esi,4
    ; mov es,si
    
    ; mov eax,PAGES
    ; mov ecx,1024
    ; mov edi,0
    ; add eax,7;+7=该页存在，用户可读写
    ; rep_PAGE_INDEX:
    ; stosd;mov es:[edi],eax
    ; add eax,4096
    ; loop rep_PAGE_INDEX
    

    ; mov ecx,8*1024;max: 1024*1024 PAGE_TABLE
    ; mov edi,PAGES
    ; shr edi,4
    ; mov es,di
    ; mov di,0

    ; mov eax,0x0+7
    ; rep_paging:
    ; ;mov dword es:[edi],eax
    ; stosd
    ; add eax,0x1000
    ; loop rep_paging
    

    ; mov esp,STACK_AREA_END;堆栈区0x29600-0x30000
    
    ; mov eax,PAGE_INDEX
    ; mov cr3,eax
    ; mov eax,cr0
    ; or eax,0x80000000
    ; mov cr0,eax
    
    ;进入内核
    jmp main

STACK_AREA_END equ 0x9fc00-1