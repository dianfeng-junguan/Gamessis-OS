extern common_int_handler
global _divide_err
_divide_err:
    mov rdi,0
    ;int stack pointer
    mov rsi,rsp
    lea rdx,[rel common_int_handler]
    jmp rdx
global _debug
_debug:
    mov rdi,1
    ;int stack pointer
    mov rsi,rsp
    lea rdx,[rel common_int_handler]
    jmp rdx
global _default_int_proc
_default_int_proc:
    mov rdi,2
    ;int stack pointer
    mov rsi,rsp
    lea rdx,[rel common_int_handler]
    jmp rdx
global _breakpoint
_breakpoint:
    mov rdi,3
    ;int stack pointer
    mov rsi,rsp
    lea rdx,[rel common_int_handler]
    jmp rdx
global _overflow
_overflow:
    mov rdi,4
    ;int stack pointer
    mov rsi,rsp
    lea rdx,[rel common_int_handler]
    jmp rdx
global _bounds
_bounds:
    mov rdi,5
    ;int stack pointer
    mov rsi,rsp
    lea rdx,[rel common_int_handler]
    jmp rdx
global _undefined_operator
_undefined_operator:
    mov rdi,6
    ;int stack pointer
    mov rsi,rsp
    lea rdx,[rel common_int_handler]
    jmp rdx
global _coprocessor_notexist
_coprocessor_notexist:
    mov rdi,7
    ;int stack pointer
    mov rsi,rsp
    lea rdx,[rel common_int_handler]
    jmp rdx
global _double_ints
_double_ints:
    mov rdi,8
    ;int stack pointer
    mov rsi,rsp
    lea rdx,[rel common_int_handler]
    jmp rdx
global _coprocessor_seg_overbound
_coprocessor_seg_overbound:
    mov rdi,9
    ;int stack pointer
    mov rsi,rsp
    lea rdx,[rel common_int_handler]
    jmp rdx
global _invalid_tss
_invalid_tss:
    mov rdi,10
    ;int stack pointer
    mov rsi,rsp
    lea rdx,[rel common_int_handler]
    jmp rdx
global _segment_notexist
_segment_notexist:
    mov rdi,11
    ;int stack pointer
    mov rsi,rsp
    lea rdx,[rel common_int_handler]
    jmp rdx
global _stackseg_overbound
_stackseg_overbound:
    mov rdi,12
    ;int stack pointer
    mov rsi,rsp
    lea rdx,[rel common_int_handler]
    jmp rdx
global _general_protect
_general_protect:
    mov rdi,13
    ;int stack pointer
    mov rsi,rsp
    lea rdx,[rel common_int_handler]
    jmp rdx
global _page_err
_page_err:
    mov rdi,14
    ;int stack pointer
    mov rsi,rsp
    lea rdx,[rel common_int_handler]
    jmp rdx
global _coprocessor_err
_coprocessor_err:
    mov rdi,16
    ;int stack pointer
    mov rsi,rsp
    lea rdx,[rel common_int_handler]
    jmp rdx
