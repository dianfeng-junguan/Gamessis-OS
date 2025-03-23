global call_while_saving_general_volatiles
call_while_saving_general_volatiles:
    push rbp
    mov rbp, rsp

    ;易变寄存器入栈
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11

    call rdi

    pop r11
    pop r10
    pop r9
    pop r8
    pop rdx
    pop rcx
    pop rax

    leave
    ret
global call_while_saving_general_volatiles_with_return
call_while_saving_general_volatiles_with_return:
    push rbp
    mov rbp, rsp
    
    ;易变寄存器入栈
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
    
    call rdi
    
    pop r11
    pop r10
    pop r9
    pop r8
    pop rdx
    pop rcx
    
    leave
    ret