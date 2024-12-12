extern common_int_handler
global _divide_err
_divide_err:
    mov rdi,0
    lea rsi,[rel common_int_handler]
    jmp rsi
global _debug
_debug:
    mov rdi,1
    lea rsi,[rel common_int_handler]
    jmp rsi
global _default_int_proc
_default_int_proc:
    mov rdi,2
    lea rsi,[rel common_int_handler]
    jmp rsi
global _breakpoint
_breakpoint:
    mov rdi,3
    lea rsi,[rel common_int_handler]
    jmp rsi
global _overflow
_overflow:
    mov rdi,4
    lea rsi,[rel common_int_handler]
    jmp rsi
global _bounds
_bounds:
    mov rdi,5
    lea rsi,[rel common_int_handler]
    jmp rsi
global _undefined_operator
_undefined_operator:
    mov rdi,6
    lea rsi,[rel common_int_handler]
    jmp rsi
global _coprocessor_notexist
_coprocessor_notexist:
    mov rdi,7
    lea rsi,[rel common_int_handler]
    jmp rsi
global _double_ints
_double_ints:
    mov rdi,8
    lea rsi,[rel common_int_handler]
    jmp rsi
global _coprocessor_seg_overbound
_coprocessor_seg_overbound:
    mov rdi,9
    lea rsi,[rel common_int_handler]
    jmp rsi
global _invalid_tss
_invalid_tss:
    mov rdi,10
    lea rsi,[rel common_int_handler]
    jmp rsi
global _segment_notexist
_segment_notexist:
    mov rdi,11
    lea rsi,[rel common_int_handler]
    jmp rsi
global _stackseg_overbound
_stackseg_overbound:
    mov rdi,12
    lea rsi,[rel common_int_handler]
    jmp rsi
global _general_protect
_general_protect:
    mov rdi,13
    lea rsi,[rel common_int_handler]
    jmp rsi
global _page_err
_page_err:
    mov rdi,14
    lea rsi,[rel common_int_handler]
    jmp rsi
global _coprocessor_err
_coprocessor_err:
    mov rdi,16
    lea rsi,[rel common_int_handler]
    jmp rsi
