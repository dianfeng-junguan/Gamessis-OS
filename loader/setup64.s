global init64
extern do_reloc
extern gdtptr
[bits 64]
init64:

;移动栈指针到高地址
    mov rax,0xffff8000
    shl rax,32
    add rsp,rax
    add rbp,rax

    ;切换gdtr内容到高地址
    push rbx
    mov rbx,[0x105000+2]
    or rax,rbx
    mov qword [0x105000+2],rax
    mov rax,0x105000
    lgdt [rax]
    pop rbx

    xor rax,rax
    mov rax,do_reloc
    push rax
    ret
