extern common_int_handler
global _divide_err
_divide_err:
    mov rdi,0
    jmp common_int_handler
global _debug
_debug:
    mov rdi,1
    jmp common_int_handler
global _default_int_proc
_default_int_proc:
    mov rdi,2
    jmp common_int_handler
global _breakpoint
_breakpoint:
    mov rdi,3
    jmp common_int_handler
global _overflow
_overflow:
    mov rdi,4
    jmp common_int_handler
global _bounds
_bounds:
    mov rdi,5
    jmp common_int_handler
global _undefined_operator
_undefined_operator:
    mov rdi,6
    jmp common_int_handler
global _coprocessor_notexist
_coprocessor_notexist:
    mov rdi,7
    jmp common_int_handler
global _double_ints
_double_ints:
    mov rdi,8
    jmp common_int_handler
global _coprocessor_seg_overbound
_coprocessor_seg_overbound:
    mov rdi,9
    jmp common_int_handler
global _invalid_tss
_invalid_tss:
    mov rdi,10
    jmp common_int_handler
global _segment_notexist
_segment_notexist:
    mov rdi,11
    jmp common_int_handler
global _stackseg_overbound
_stackseg_overbound:
    mov rdi,12
    jmp common_int_handler
global _general_protect
_general_protect:
    mov rdi,13
    jmp common_int_handler
global _page_err
_page_err:
    mov rdi,14
    jmp common_int_handler
global _default_int_proc
_default_int_proc:
    mov rdi,15
    jmp common_int_handler
global _coprocessor_err
_coprocessor_err:
    mov rdi,16
    jmp common_int_handler
