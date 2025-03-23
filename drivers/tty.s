global _key_proc
global _mouse_proc
extern mouse_proc
extern key_proc
extern eoi
%include "context.inc"
_key_proc:
    SAVE_GENERALS
    call key_proc
    call eoi
    RESTORE_GENERALS
    iretq
_mouse_proc:
    SAVE_GENERALS
    call mouse_proc
    call eoi
    RESTORE_GENERALS
    iretq