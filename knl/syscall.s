global _syscall
extern read_disk
extern write_disk
extern eoi
extern request
extern puts
extern del_proc
extern syscall
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
    push rbp
    mov rbp,0x108000
    ;切换堆栈
    mov qword [rbp+20],rsp
    mov rsp,qword [rbp+4]
    ;r11和rcx里面分别存储着rflags和rip
    push r11
    push rcx

    ;r10里面存放着第四个参数
    xchg rcx,r10

    call syscall

    xchg r10,rcx
    pop rcx
    pop r11
    mov qword [rbp+4],rsp
    mov rsp,[rbp+20]
    pop rbp
    db 0x48
    sysret


