global init64
extern do_reloc
[bits 64]
init64:
;移动栈指针到高地址
    mov rax,0xffff8000
    shl rax,32
    add rsp,rax
    add rbp,rax
    xor rax,rax
    mov rax,do_reloc
    push rax
    ret
