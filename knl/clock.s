global clock
global clock_ret
extern eoi
extern clock_c
extern print
extern scene_saver
extern gdt
extern manage_proc_lock
extern save_rsp
clock:
    push rax
    push rbx
    push rcx
    push rdx
    push rdi
    push rsi

    push r8
    push r9
    push r10
    push r11
    push r12
    push r13
    push r14
    push r15

    call save_rsp

    mov ax,es
    push rax
    mov ax,ds
    push rax

    mov ax,0x10
    mov es,ax
    mov ds,ax
.normal_part:
	mov al,0x20
	out 0xa0,al
	out 0x20,al
    call clock_c
clock_ret:
    pop rax
    mov ds,ax
    pop rax
    mov es,ax

    pop r15
    pop r14
    pop r13
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8

    pop rsi
    pop rdi
    pop rdx
    pop rcx
    pop rbx
    pop rax
    iretq