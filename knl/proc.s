global create_zero
;global fill_desc
global switch_proc_asm
global move_to_user_mode
extern req_proc
extern set_proc
extern save_context_c
extern _proc_end
extern manage_proc
extern do_signals
global test_create_proc_asm
global switch_to_
global save_context
global discard_context
global move_to_user_mode
global proc_end
global schedule
extern save_float
extern restore_float
%include "context.inc"
[bits 64]
create_zero:
call req_proc
cmp eax,0xffffffff
je .retu
call set_proc
mov eax,[esp];proc_nr
add esp,16*4
.retu:
ret
;参数：
;rdi:to->regs.rsp
;rsi:from->
; switch_to_:
proc_end:
    mov rdi,rax
    jmp _proc_end

save_context:
    push rbp

    mov rsi,rsp
    mov rdi,rsi
    add rdi,24
    call save_context_c
    ret
discard_context:
    ret
;move_to_user_mode:
;    mov ax,0x20
;    mov ds,ax
;    mov es,ax
;    mov gs,ax
;
;    push 0x20
;    push rsp
;    ;pushf
;    push 0x18
;    push .done
;    iret
;.done:
;    ret
%include "gdtdefine.inc"
desc:
    GDTdescriptor 0,0,0
global ret_sys_call
ret_sys_call:

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

tmp:
    db 0x48
    sysret
global ret_normal_proc
ret_normal_proc:
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
    ret
move_to_user_mode:
    mov rcx,.result
    pushf
    pop r11
    db 0x48
    sysret
.result:
    mov rax,0x2b
    mov es,ax
    mov ds,ax
    mov fs,ax
    mov gs,ax
    ret
schedule:
    push rbp
    mov rbp,rsp

    ;save context
    SAVE_GENERALS
    
    
    SAVE_VOLATILES
    call save_float
    RESTORE_VOLATILES

    mov ax,es
    push rax
    mov ax,ds
    push rax

    call manage_proc
    call do_signals

    pop rbx
    mov ds,bx
    pop rbx
    mov es,bx

    
    SAVE_VOLATILES
    call restore_float
    RESTORE_VOLATILES
    
    RESTORE_GENERALS

    leave
    ret