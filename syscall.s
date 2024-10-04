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
;因为可变参数，所以采用汇编
;参数:eax,ebx,ecx,edx,esi,edi 6个参数
_syscall:
    push rdi
    push rsi
    push rdx
    push rcx
    push rbx
    push rax
    call syscall
    add rsp,24
    iret


