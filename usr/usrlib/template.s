global %s
%s:
    push rbp
    mov rbp,rsp
    mov rax,%d
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
