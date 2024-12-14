global %s
%s:
	;保存上下文
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

    mov rdi,%d
    ;int stack pointer
    mov rsi,rsp
    add rsi,0x70
    lea rdx,[rel common_int_handler]
    jmp rdx
