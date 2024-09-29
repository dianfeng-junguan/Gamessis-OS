section .multiboot2 align=8
MULTIBOOT2_HEADER_MAGIC    equ 0xe85250d6
MULTIBOOT2_HEADER_LENGTH   equ multiboot2_header_end - multiboot2_header
MULTIBOOT2_HEADER_FLAGS    equ 0x00000000

multiboot2_header:
    dd MULTIBOOT2_HEADER_MAGIC
    dd MULTIBOOT2_HEADER_FLAGS ;要求有meminfo和bios dev info
    dd MULTIBOOT2_HEADER_LENGTH
    dd - (MULTIBOOT2_HEADER_MAGIC + MULTIBOOT2_HEADER_LENGTH)
bootinfo_request_tag:
    dd 1
    dd bootinfo_request_tag_end - bootinfo_request_tag
    dd 4    ; basic mamory info
    dd 1    ; boot command line
    dd 8    ; framebuffer info
    dd 12   ; efi64 system table pointer
bootinfo_request_tag_end:
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
framebuffer_tag:
    dd 5
    dd 20
    dd 1920 ; width
    dd 1080 ; height
    dd 32   ; depth
framebuffer_tag_end:
dd  0
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

global gdtptr


[bits 32]
init32:
    ;开始准备64位
    ; 设置gdt_ptr
    cli

    mov esi,ebx
    mov edi,eax
    ;这里写绝对地址是因为，objcopy转成64位代码之后，写标签就会地址错误
    mov eax, 0x105000
    add eax,2
    mov dword [eax], 0x104000

    mov eax,0x105000
    ; 加载GDTR和段寄存器
    db 0x66
    lgdt [eax]     ; gdt_ptr
    ; jmp dword 0x8:.switch_cs
set_paging:
    mov ax,0x10
    mov ds,ax
    mov ss,ax
    mov es,ax
    mov gs,ax
    mov fs,ax

    ; 打开PAE
    mov eax, cr4
    bts eax, 5
    mov cr4, eax

    ;设置页面
    ;先关闭分页
    mov eax,cr0
    mov ebx,0x80000000
    not ebx
    and eax,ebx
    mov cr0,eax

    ;PML4
    mov eax,0x101000
    mov dword [eax],0x102007
    mov dword [eax+4],0
    ;PDPT
    mov eax,0x102000
    mov dword [eax],0x183;0x103007
    mov dword [eax+4],0

;    mov ecx,32
;    mov eax,0x103000
;    mov edx,0x183
;.set_pd0:
;    ;PD0
;    mov dword [eax],edx
;    add eax,4
;    mov dword [eax],0
;    add eax,4
;    add edx,0x200000;2MB
;    loop .set_pd0

    ;加载
    mov eax,0x101000
    mov cr3,eax

switch_cs:

    mov esp,0x400000;4M位置
    
    ; 切换ia32e模式
    mov ecx, 0xc0000080 ; ia32_efer在msr中的地址
    rdmsr
    bts eax, 8
    wrmsr
    ;打开保护模式
    mov eax, cr0
    bts eax, 0
    bts eax,31
    mov cr0, eax

    ;进入内核
    ;push ebx
    ;push MULTIBOOT2_HEADER_MAGIC
    ;mov esi,ebx
    ;mov edi,MULTIBOOT2_HEADER_MAGIC
    mov eax,main
    jmp dword 0x8:main
    ;jmp dword 0x8:main
STACK_AREA_END equ 0x9fc00-1
section .pgtbl align=4096
PML4:
    dq 0x7+PDPT
    resq 511
PDPT:
    dq 0x7+PD0
    resq 511
PD0:
    resq 512
section .gdt align=4096
;之后就不会动了，也不会用TSS了
gdt64:
    dq  0
    dq  0x0020980000000000   ; 内核态代码段
    dq  0x0000920000000000   ; 内核态数据段
    dq  0x0020f80000000000   ; 用户态代码段
    dq  0x0000f20000000000   ; 用户态数据段
gdt_end:
section .gdtptr
gdtptr:
    dw  gdt_end - gdt64 - 1
    dq  gdt64