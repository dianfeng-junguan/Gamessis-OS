global init64
extern main
[bits 64]
init64:
;移动栈指针到高地址
    mov rax,0xffff8000
    shl rax,32
    add rsp,rax
    add rbp,rax
    add rax,main
    push rax
    ret