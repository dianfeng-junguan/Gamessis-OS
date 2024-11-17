global create_zero
;global fill_desc
global switch_proc_asm
global move_to_user_mode
extern req_proc
extern set_proc
global test_create_proc_asm
global switch_to
;global save_context
global move_to_user_mode
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

;fill_desc:
;push rbp
;mov rbp,rsp
;mov eax,[ebp+20];des
;mov ebx,[ebp+16];attr
;mov ecx,[ebp+12];limit
;mov edx,[ebp+8];addr
;mov esi,desc
;mov dword [desc],0
;mov dword [desc+4],0
;
;mov word [esi],cx
;shr ecx,16
;mov word [esi+2],dx
;shr edx,16
;mov byte [esi+4],dl
;shr dx,8
;mov byte [esi+7],dl
;mov word [esi+5],bx
;
;mov dword edi,[esi+4]
;shl ecx,8
;or edi,ecx
;
;mov [esi+4],edi
;
;mov dword edx,[desc]
;mov dword [eax],edx
;mov edx,[desc+4]
;mov [eax+4],edx
;
;
;
;leave
;ret
switch_proc_asm:
;    ;到这里切换到别的进程，等到回来的时候，就是继续执行这里，然后回到源程序
;    mov ax,[esp+4]
;
;    mov word [.ljmp+5],ax
;    mov dword [.ljmp+1],0
;.ljmp:
;    db 0xea
;    dd 0
;    dw 0
;
;    ret
;    ; ltr ax
;
;    ; mov eax,[esp]
;    ; add esp,4;堆栈平衡
;    ; ;add esp,4;去掉第一个参数
;    ; ;push test_proc_asm
;    ; ;iret; jmp
;    ; jmp eax
;extern print
;switch_to_old:
;    mov esi,[esp+4];tss addr
;    mov ebx,[esi+0x20];eip
;    mov edi,.leap
;    mov dword [edi+1],ebx
;
;    mov eax,[esi+0x38];esp
;    mov ecx,eax
;    sub ecx,4
;    mov dword [ecx],ebx;在进程堆栈中放置返回地址:有问题
;    push rax
;
;    mov ebp,esi
;    add ebp,0x28
;    mov eax,[ebp];eax
;    push rax
;    add ebp,4
;    mov eax,[ebp];ecx
;    push rax
;    add ebp,4
;    mov eax,[ebp];edx
;    push rax
;    add ebp,4
;    mov eax,[ebp];ebx
;    push rax
;    add ebp,4
;    mov eax,[ebp];esp
;    push rax
;    add ebp,4;esp is ignored but it's still needed
;    mov eax,[ebp];ebp
;    push rax
;    add ebp,4
;    mov eax,[ebp];esi
;    push rax
;    add ebp,4
;    mov eax,[ebp];edi
;    push rax
;    add ebp,4
;
;
;    mov eax,[esi+0x1c]
;    mov cr3,rax;cr3
;    ;切换eflags
;    mov eax,[esi+0x24]
;    push rax
;    ;popf
;    ;popa
;    pop rsp
;.leap:
;    db 0xea
;    dd 0
;    dw 0x8
save_context:
    ;pusha;8 regs
    mov eax,[esp+36];tss
    add eax,0x44
    mov ecx,8
    mov edi,esp
    .loops:
        mov dword edx,[edi]
        mov dword [eax],edx
        add edi,4
        sub eax,4
        loop .loops
    ;popa
    ;;保存eflags
    ;pushf
    pop rbx
    mov eax,[esp+4]
    mov dword [eax+0x24],ebx
    ;保存eip
    mov rbx,[esp]
    mov dword [eax+0x20],ebx

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
%include "knl/gdtdefine.inc"
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