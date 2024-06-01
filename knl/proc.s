global create_zero
;global fill_desc
global switch_proc_asm
extern req_proc
extern set_proc
global test_create_proc_asm
global switch_to
;global save_context
global move_to_user_mode
create_zero:
call req_proc
cmp eax,0xffffffff
je .retu
;push eax
;pushf
;push edi
;push esi
;push ebp
;push esp
;push gs
;push fs
;push ds
;push ss
;push cs
;push es
;push edx
;push ecx
;push ebx
;push eax
push eax
push ebx
push ecx
push edx
push es
push cs
push ss
push ds
push fs
push gs
push esp
push ebp
push esi
push edi
pushf
push eax
call set_proc
mov eax,[esp];proc_nr
add esp,16*4
.retu:
ret

fill_desc:
push ebp
mov ebp,esp
mov eax,[ebp+20];des
mov ebx,[ebp+16];attr
mov ecx,[ebp+12];limit
mov edx,[ebp+8];addr
mov esi,desc
mov dword [desc],0
mov dword [desc+4],0

mov word [esi],cx
shr ecx,16
mov word [esi+2],dx
shr edx,16
mov byte [esi+4],dl
shr dx,8
mov byte [esi+7],dl
mov word [esi+5],bx

mov dword edi,[esi+4]
shl ecx,8
or edi,ecx

mov [esi+4],edi

mov dword edx,[desc]
mov dword [eax],edx
mov edx,[desc+4]
mov [eax+4],edx



mov esp,ebp
pop ebp
ret
switch_proc_asm:
    ;到这里切换到别的进程，等到回来的时候，就是继续执行这里，然后回到源程序
    mov ax,[esp+4]

    mov word [.ljmp+5],ax
    mov dword [.ljmp+1],0
.ljmp:
    db 0xea
    dd 0
    dw 0

    ret
    ; ltr ax

    ; mov eax,[esp]
    ; add esp,4;堆栈平衡
    ; ;add esp,4;去掉第一个参数
    ; ;push test_proc_asm
    ; ;iret; jmp
    ; jmp eax
extern print
switch_to:
    mov esi,[esp+4];tss addr
    mov ebx,[esi+0x20];eip
    mov edi,.leap
    mov dword [edi+1],ebx

    mov eax,[esi+0x38];esp
    mov ecx,eax
    sub ecx,4
    mov dword [ecx],ebx;在进程堆栈中放置返回地址:有问题
    push eax

    mov ebp,esi
    add ebp,0x28
    mov eax,[ebp];eax
    push eax
    add ebp,4
    mov eax,[ebp];ecx
    push eax
    add ebp,4
    mov eax,[ebp];edx
    push eax
    add ebp,4
    mov eax,[ebp];ebx
    push eax
    add ebp,4
    mov eax,[ebp];esp
    push eax
    add ebp,4;esp is ignored but it's still needed
    mov eax,[ebp];ebp
    push eax
    add ebp,4
    mov eax,[ebp];esi
    push eax
    add ebp,4
    mov eax,[ebp];edi
    push eax
    add ebp,4


    mov eax,[esi+0x1c]
    mov cr3,eax;cr3
    ;切换eflags
    mov eax,[esi+0x24]
    push eax
    popf
    popa
    pop esp
.leap:
    db 0xea
    dd 0
    dw 0x8
save_context:
    pusha;8 regs
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
    popa
    ;保存eflags
    pushf
    pop ebx
    mov eax,[esp+4]
    mov dword [eax+0x24],ebx
    ;保存eip
    mov ebx,[esp]
    mov dword [eax+0x20],ebx

    ret
move_to_user_mode:
    mov ax,0x20
    mov ds,ax
    mov es,ax
    mov gs,ax
    
    push 0x20
    push esp
    pushf
    push 0x18
    push .done
    iret
.done:
    ret
%include "knl/gdtdefine.inc"
desc:
    GDTdescriptor 0,0,0