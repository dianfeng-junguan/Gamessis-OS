global reg_dev
reg_dev:
    push rbp
    mov rbp,rsp
    mov rax,0
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global dispose_dev
dispose_dev:
    push rbp
    mov rbp,rsp
    mov rax,1
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global reg_drv
reg_drv:
    push rbp
    mov rbp,rsp
    mov rax,2
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global dispose_drv
dispose_drv:
    push rbp
    mov rbp,rsp
    mov rax,3
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global call_drvfunc
call_drvfunc:
    push rbp
    mov rbp,rsp
    mov rax,4
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global req_mem
req_mem:
    push rbp
    mov rbp,rsp
    mov rax,5
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global free_mem
free_mem:
    push rbp
    mov rbp,rsp
    mov rax,6
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global reg_proc
reg_proc:
    push rbp
    mov rbp,rsp
    mov rax,7
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global del_proc
del_proc:
    push rbp
    mov rbp,rsp
    mov rax,8
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global get_proc_addr
get_proc_addr:
    push rbp
    mov rbp,rsp
    mov rax,9
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global chk_vm
chk_vm:
    push rbp
    mov rbp,rsp
    mov rax,10
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global open
open:
    push rbp
    mov rbp,rsp
    mov rax,11
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global close
close:
    push rbp
    mov rbp,rsp
    mov rax,12
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global read
read:
    push rbp
    mov rbp,rsp
    mov rax,13
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global write
write:
    push rbp
    mov rbp,rsp
    mov rax,14
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global seek
seek:
    push rbp
    mov rbp,rsp
    mov rax,15
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global tell
tell:
    push rbp
    mov rbp,rsp
    mov rax,16
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global reg_vol
reg_vol:
    push rbp
    mov rbp,rsp
    mov rax,17
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global free_vol
free_vol:
    push rbp
    mov rbp,rsp
    mov rax,18
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global exec
exec:
    push rbp
    mov rbp,rsp
    mov rax,19
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global exit
exit:
    push rbp
    mov rbp,rsp
    mov rax,20
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global abort
abort:
    push rbp
    mov rbp,rsp
    mov rax,20
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global call
call:
    push rbp
    mov rbp,rsp
    mov rax,21
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global mkfifo
mkfifo:
    push rbp
    mov rbp,rsp
    mov rax,22
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global brk
brk:
    push rbp
    mov rbp,rsp
    mov rax,23
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global find_dev
find_dev:
    push rbp
    mov rbp,rsp
    mov rax,25
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global operate_dev
operate_dev:
    push rbp
    mov rbp,rsp
    mov rax,26
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global fork
fork:
    push rbp
    mov rbp,rsp
    mov rax,27
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global execve
execve:
    push rbp
    mov rbp,rsp
    mov rax,28
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global waitpid
waitpid:
    push rbp
    mov rbp,rsp
    mov rax,29
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global mmap
mmap:
    push rbp
    mov rbp,rsp
    mov rax,30
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global munmap
munmap:
    push rbp
    mov rbp,rsp
    mov rax,31
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global mknod
mknod:
    push rbp
    mov rbp,rsp
    mov rax,33
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global kb_readc
kb_readc:
    push rbp
    mov rbp,rsp
    mov rax,100
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global remove
remove:
    push rbp
    mov rbp,rsp
    mov rax,34
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global sbrk
sbrk:
    push rbp
    mov rbp,rsp
    mov rax,35
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global chkmmap
chkmmap:
    push rbp
    mov rbp,rsp
    mov rax,36
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global _readdir
_readdir:
    push rbp
    mov rbp,rsp
    mov rax,37
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global create_window
create_window:
    push rbp
    mov rbp,rsp
    mov rax,101
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global destroy_window
destroy_window:
    push rbp
    mov rbp,rsp
    mov rax,102
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global show_window
show_window:
    push rbp
    mov rbp,rsp
    mov rax,103
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global hide_window
hide_window:
    push rbp
    mov rbp,rsp
    mov rax,104
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global resize_window
resize_window:
    push rbp
    mov rbp,rsp
    mov rax,105
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global move_window
move_window:
    push rbp
    mov rbp,rsp
    mov rax,106
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global set_window_text
set_window_text:
    push rbp
    mov rbp,rsp
    mov rax,107
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global attach_window
attach_window:
    push rbp
    mov rbp,rsp
    mov rax,108
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global detach_window
detach_window:
    push rbp
    mov rbp,rsp
    mov rax,109
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global add_window_event_listener
add_window_event_listener:
    push rbp
    mov rbp,rsp
    mov rax,110
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global remove_window_event_listener
remove_window_event_listener:
    push rbp
    mov rbp,rsp
    mov rax,111
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global send_window_event
send_window_event:
    push rbp
    mov rbp,rsp
    mov rax,112
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global get_window_text
get_window_text:
    push rbp
    mov rbp,rsp
    mov rax,113
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global fetch_event
fetch_event:
    push rbp
    mov rbp,rsp
    mov rax,114
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
global default_deal_window_event
default_deal_window_event:
    push rbp
    mov rbp,rsp
    mov rax,115
    push rbp
    db 0x48
    syscall
    pop rbp
    leave
    ret
