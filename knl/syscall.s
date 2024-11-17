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
    cli
    push rbp
    mov rbp,0xffff800000108000
    ;切换堆栈
    mov qword [rbp+20],rsp
    mov rsp,qword [rbp+36]

    ;这部分是为了填上上下文的int部分，是给fork的新进程使用的，
    ;syscall会直接忽略这部分。
    push 0x2b
    push rsp
    pushf
    push 0x33
    push rcx
;syscall上下文
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
    mov rdi,current
    mov rdi,[rdi]
    mov qword [rdi+0x26c],r10
    pop rdi

    call syscall
_syscall_sysret:
    xchg r10,rcx
    pop rcx
    pop r11

    ;mov qword [rsp+15*8],rax;存储好返回值
    pop rax
    mov ds,ax
    pop rax
    mov es,ax

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
    mov rsp,[rbp+20]
    pop rbp



    sti
    db 0x48
    sysret


