global init64
extern main
[bits 64]
init64:
    mov rax,0xffff8000
    shl rax,32
    add rax,main
    push rax
    ret