global init_sse
global is_sse_supported
init_sse:
    push rbp
    mov rbp, rsp

    push rax

    mov rax, cr4
    or rax, 3 << 9        ; 设置 CR4.OSFXSR 和 CR4.OSXMMEXCPT
    mov cr4, rax

    mov rax, cr0
    and rax, 0xffffffffffffFFFB       ; 清除 CR0.EM
    or rax, 0x2           ; 设置 CR0.MP
    mov cr0, rax

    pop rax
    leave
    ret
is_sse_supported:
    push rbp
    mov rbp, rsp
    
    push rbx
    push rcx
    push rdx

    mov rax, 1
    cpuid
    test edx, 1 << 25      ; 检查 SSE 支持
    jz .no_sse
    test edx, 1 << 26      ; 检查 SSE 支持
    jz .no_sse
    test ecx, 1      ; 检查 SSE 支持
    jz .no_sse
    test ecx, 1 << 9      ; 检查 SSE 支持
    jz .no_sse
    test ecx, 1 << 19      ; 检查 SSE 支持
    jz .no_sse
    test ecx, 1 << 20      ; 检查 SSE 支持
    jz .no_sse
    mov rax, 1

    pop rdx
    pop rcx
    pop rbx
    leave
    ret
.no_sse:
    mov rax, 0

    pop rdx
    pop rcx
    pop rbx
    leave
    ret
; global save_float
; global restore_float
; extern _save_float
; extern _restore_float
; extern call_while_saving_general_volatiles
; save_float:
;     push rdi
;     mov rdi,_save_float
;     call call_while_saving_general_volatiles
;     pop rdi
;     ret
; restore_float:
;     push rdi
;     mov rdi,_restore_float
;     call call_while_saving_general_volatiles
;     pop rdi
;     ret