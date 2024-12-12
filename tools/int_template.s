global %s
%s:
    mov rdi,%d
    lea rsi,common_int_handler
    jmp rsi
