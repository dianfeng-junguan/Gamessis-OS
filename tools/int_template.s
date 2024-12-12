global %s
%s:
    mov rdi,%d
    ;int stack pointer
    mov rsi,rsp
    lea rdx,[rel common_int_handler]
    jmp rdx
