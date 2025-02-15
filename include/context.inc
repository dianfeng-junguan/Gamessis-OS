%macro SAVE_VOLATILES 0
    ;易变寄存器入栈
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11
%endmacro
%macro RESTORE_VOLATILES 0
    pop r11
    pop r10
    pop r9
    pop r8
    pop rdx
    pop rcx
    pop rax
%endmacro
%macro SAVE_GENERALS 0
    ;保存通用寄存器
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
%endmacro
%macro RESTORE_GENERALS 0
    ;恢复通用寄存器
    pop r15
    pop r14
    pop r13
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8

    pop rsi
    pop rdi
    pop rdx
    pop rcx
    pop rbx
    pop rax
%endmacro
%macro RESTORE_GENERALS_BUT_RAX 0
    ;恢复通用寄存器，但不恢复rax
    pop r15
    pop r14
    pop r13
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8

    pop rsi
    pop rdi
    pop rdx
    pop rcx
    pop rbx
    add rsp, 8 ;恢复栈指针
%endmacro