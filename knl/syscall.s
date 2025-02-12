global _syscall
global _syscall_sysret
extern read_disk
extern write_disk
extern eoi
extern request
extern puts
extern del_proc
extern syscall
extern current
extern store_rip
extern store_rbp
REQ_READ_DISK       EQU 0
REQ_WRITE_DISK      EQU 1
REQ_SYNC_READ_DISK  EQU 2
REQ_SYNC_WRITE_DISK EQU 3
REQ_FREAD           EQU 4
REQ_FWRITE          EQU 5
REQ_FFLUSH          EQU 6
REQ_MOUNT_DISK      EQU 7
REQ_PRINT           EQU 9
REQ_EXEC            EQU 10
REQ_DEL_PROC        EQU 11
REQ_FETCH_KBBUF     EQU 12
_syscall:
    ; cli 有的需要cli有的不需要
    push rbp

    ; push rdi
    ; mov rdi,rbp
    ; call store_rbp
    ; pop rdi

    mov rbp,0xffff800000108000
    ;切换堆栈
    mov qword [rbp+20],rsp
    mov rsp,qword [rbp+36+8]

    ;这部分是为了填上上下文的int部分，是给fork的新进程使用的，
    ;syscall会直接忽略这部分。
    push 0x2b
    push rsp;这里之后fork时要修改成用户栈
    pushf
    push 0x33
    push rcx;rcx=rip
;syscall上下文
;保存用户栈的rsp到上面int部分。
    mov rcx,[rbp+20]
    mov qword [rsp+24],rcx
    mov rcx,[rsp]

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

    mov ax,es
    push rax
    mov ax,ds
    push rax

    mov ax,0x10
    mov es,ax
    mov ds,ax

    mov rax,[rsp+15*8]
    ;r11和rcx里面分别存储着rflags和rip
    push r11
    push rcx

    ;r10里面存放着第四个参数
    xchg rcx,r10
    ;把返回地址存到pcb(regs.rip)
    push rdi
    mov rdi,r10

    push r11
    push rax
    push rdx
    call store_rip

    mov rdi,rbp
    call store_rbp
    
    pop rdx
    pop rax
    pop r11


    
    pop rdi
    ; push rdi
    ; mov rdi,current
    ; mov rdi,[rdi]
    ; mov qword [rdi+0x26c],r10
    ; pop rdi

    call syscall
    xchg r10,rcx
    pop rcx
    pop r11
_syscall_sysret:

    ;mov qword [rsp+15*8],rax;存储好返回值
    pop rbx
    mov ds,bx
    pop rbx
    mov es,bx

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
    ;rax不用恢复：里面存储了系统调用的返回值。
    add rsp,8
    ;pop rax

    ;不用把rsp的值放回到tss.rsp0
    ;mov qword [rbp+4],rsp
    mov rbp,0xffff800000108000
    mov qword rsp,[rbp+20]
    pop rbp


    ;不需要sti，sysret恢复rflags也就恢复了中断使能标志位
    db 0x48
    sysret


