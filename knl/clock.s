global clock
global clock_ret
extern eoi
extern clock_c
extern print
extern scene_saver
extern gdt
extern manage_proc_lock
extern save_rsp
extern save_float
extern restore_float
%include "context.inc"
clock:
    cli

    SAVE_GENERALS
    
    ;易变寄存器入栈
    SAVE_VOLATILES
    
    call save_float
    call save_rsp

    RESTORE_VOLATILES



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

    
    SAVE_VOLATILES
    call restore_float
    RESTORE_VOLATILES
    
    RESTORE_GENERALS
    iretq