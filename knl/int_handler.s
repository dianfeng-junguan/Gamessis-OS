extern common_int_handler
global _divide_err
_divide_err:
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

    mov rdi,0
    ;int stack pointer
    mov rsi,rsp
    add rsi,0x70
    lea rdx,[rel common_int_handler]
    jmp rdx
global _debug
_debug:
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

    mov rdi,1
    ;int stack pointer
    mov rsi,rsp
    add rsi,0x70
    lea rdx,[rel common_int_handler]
    jmp rdx
global _default_int_proc
_default_int_proc:
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

    mov rdi,2
    ;int stack pointer
    mov rsi,rsp
    add rsi,0x70
    lea rdx,[rel common_int_handler]
    jmp rdx
global _breakpoint
_breakpoint:
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

    mov rdi,3
    ;int stack pointer
    mov rsi,rsp
    add rsi,0x70
    lea rdx,[rel common_int_handler]
    jmp rdx
global _overflow
_overflow:
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

    mov rdi,4
    ;int stack pointer
    mov rsi,rsp
    add rsi,0x70
    lea rdx,[rel common_int_handler]
    jmp rdx
global _bounds
_bounds:
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

    mov rdi,5
    ;int stack pointer
    mov rsi,rsp
    add rsi,0x70
    lea rdx,[rel common_int_handler]
    jmp rdx
global _undefined_operator
_undefined_operator:
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

    mov rdi,6
    ;int stack pointer
    mov rsi,rsp
    add rsi,0x70
    lea rdx,[rel common_int_handler]
    jmp rdx
global _coprocessor_notexist
_coprocessor_notexist:
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

    mov rdi,7
    ;int stack pointer
    mov rsi,rsp
    add rsi,0x70
    lea rdx,[rel common_int_handler]
    jmp rdx
global _double_ints
_double_ints:
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

    mov rdi,8
    ;int stack pointer
    mov rsi,rsp
    add rsi,0x70
    lea rdx,[rel common_int_handler]
    jmp rdx
global _coprocessor_seg_overbound
_coprocessor_seg_overbound:
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

    mov rdi,9
    ;int stack pointer
    mov rsi,rsp
    add rsi,0x70
    lea rdx,[rel common_int_handler]
    jmp rdx
global _invalid_tss
_invalid_tss:
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

    mov rdi,10
    ;int stack pointer
    mov rsi,rsp
    add rsi,0x70
    lea rdx,[rel common_int_handler]
    jmp rdx
global _segment_notexist
_segment_notexist:
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

    mov rdi,11
    ;int stack pointer
    mov rsi,rsp
    add rsi,0x70
    lea rdx,[rel common_int_handler]
    jmp rdx
global _stackseg_overbound
_stackseg_overbound:
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

    mov rdi,12
    ;int stack pointer
    mov rsi,rsp
    add rsi,0x70
    lea rdx,[rel common_int_handler]
    jmp rdx
global _general_protect
_general_protect:
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

    mov rdi,13
    ;int stack pointer
    mov rsi,rsp
    add rsi,0x70
    lea rdx,[rel common_int_handler]
    jmp rdx
global _page_err
_page_err:
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

    mov rdi,14
    ;int stack pointer
    mov rsi,rsp
    add rsi,0x70
    lea rdx,[rel common_int_handler]
    jmp rdx
global _coprocessor_err
_coprocessor_err:
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

    mov rdi,16
    ;int stack pointer
    mov rsi,rsp
    add rsi,0x70
    lea rdx,[rel common_int_handler]
    jmp rdx
