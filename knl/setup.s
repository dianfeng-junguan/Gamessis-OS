section .multiboot2 align=8
MULTIBOOT2_HEADER_MAGIC    equ 0xe85250d6
MULTIBOOT2_HEADER_LENGTH   equ multiboot2_header_end - multiboot2_header
MULTIBOOT2_HEADER_FLAGS    equ 0x00000000

multiboot2_header:
    dd MULTIBOOT2_HEADER_MAGIC
    dd MULTIBOOT2_HEADER_FLAGS ;要求有meminfo和bios dev info
    dd MULTIBOOT2_HEADER_LENGTH
    dd - (MULTIBOOT2_HEADER_MAGIC + MULTIBOOT2_HEADER_LENGTH)
tag_info_req:
    dw 1
    dw 0
    dd 16
    dd 0
    dd 0
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
global gdt64
global gdtptr
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
[bits 32]
init32:
    ;开始准备64位
    ; 设置gdt_ptr
    cli
    ;这里写绝对地址是因为，objcopy转成64位代码之后，写标签就会地址错误
    mov eax, 0x103076
    add eax,2
    mov dword [eax], 0x10304e
    ; 加载GDTR和段寄存器
    db 0x66
    lgdt [0x103076]     ; gdt_ptr
    ; jmp dword 0x8:.switch_cs


switch_cs:
    mov ax,0x10
    mov ds,ax
    mov ss,ax
    mov es,ax
    mov gs,ax
    mov fs,ax

    mov esp,0x7e00
    
    ; 切换ia32e模式
    mov ecx, 0xc0000080 ; ia32_efer在msr中的地址
    rdmsr
    bts eax, 8
    wrmsr
    ;打开保护模式
    mov eax, cr0
    bts eax, 0
    mov cr0, eax

    ;进入内核
    push ebx
    push MULTIBOOT2_HEADER_MAGIC
    mov eax,main
    jmp eax
STACK_AREA_END equ 0x9fc00-1

global gdtptr
gdt64:
    dq  0
    dq  0x0020980000000000   ; 内核态代码段
    dq  0x0000920000000000   ; 内核态数据段
    dq  0x0020f80000000000   ; 用户态代码段
    dq  0x0000f20000000000   ; 用户态数据段
gdt_end:

gdtptr:
    dw  gdt_end - gdt64 - 1
    dq  gdt64