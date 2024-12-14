#include "sys/types.h"

#define SYSCALL_REG_DEV 0
#define SYSCALL_DISPOSE_DEV 1
#define SYSCALL_REG_DRV 2
#define SYSCALL_DISPOSE_DRV 3
#define SYSCALL_CALL_DRVFUNC 4
#define SYSCALL_REQ_MEM 5
#define SYSCALL_FREE_MEM 6
#define SYSCALL_REG_PROC 7
#define SYSCALL_DEL_PROC 8
#define SYSCALL_GET_PROC_ADDR 9
#define SYSCALL_CHK_VM 10
#define SYSCALL_OPEN 11
#define SYSCALL_CLOSE 12
#define SYSCALL_READ 13
#define SYSCALL_WRITE 14
#define SYSCALL_SEEK 15
#define SYSCALL_TELL 16
#define SYSCALL_REG_VOL 17
#define SYSCALL_FREE_VOL 18
#define SYSCALL_EXEC 19
#define SYSCALL_EXIT 20
#define SYSCALL_CALL 21
#define SYSCALL_MKFIFO 22
#define SYSCALL_BRK 23
#define SYSCALL_FREE 24
#define SYSCALL_FIND_DEV 25
#define SYSCALL_OPERATE_DEV 26
#define SYSCALL_FORK 27
#define SYSCALL_EXECVE 28
#define SYSCALL_WAIT 29
#define SYSCALL_MMAP 30
#define SYSCALL_MUNMAP 31
#define SYSCALL_MKNOD 33
#define SYSCALL_REMOVE 34
#define SYSCALL_SBRK 35
#define SYSCALL_KB_READC 100



#define DRVF_OPEN 0
#define DRVF_CLOSE 1
#define DRVF_READ 2
#define DRVF_WRITE 3
#define DRVF_CHK 4
#define DRVF_RSVD 5
#define DRVF_INT 6
#define DRVF_FIND 7
#define DRVF_RM 8
#define DRVF_TOUCH 9
#define DRVF_MKDIR 10
#define DRVF_LS 11
#define DRVF_SEEK 12
#define DRVF_TELL 13

#define SEEK_SET 0 /* Seek relative to start-of-file */
#define SEEK_CUR 1 /* Seek relative to current position */
#define SEEK_END 2 /* Seek relative to end-of-file */

#define SEEK_MAX 3

#define SYSTEM_REBOOT (1UL << 0)
#define SYSTEM_POWEROFF (1UL << 1)

__attribute__((__always_inline__)) inline int do_syscall(long func, long a1, long a2, long a3,
                                                         long a4, long a5, long a6)
{
    //     __asm__ volatile("push %rbp\n");
    __asm__ volatile(".byte 0x48\n"
                     "syscall" ::"a"(func),
                     "D"(a1),
                     "S"(a2),
                     "d"(a3),
                     "c"(a4),
                     "r"(a5),
                     "r"(a6));
    //     __asm__ volatile("pop %rbp\n");
    register long ret = 0;
    __asm__ volatile("mov %%rax,%0" ::"r"(ret));
    return ret;
}
int syscall(long a, long b, long c, long d, long e, long f);
int exec(char* path);

unsigned long sys_open(char* filename, int flags);
unsigned long sys_close(int fd);
unsigned long sys_read(int fd, void* buf, long count);
unsigned long sys_write(int fd, void* buf, long count);
unsigned long sys_lseek(int filds, long offset, int whence);
unsigned long sys_wait(pid_t pid, int* stat_loc, int options);
int           sys_ioctl(int fildes, int request, unsigned long args);
int           sys_remove(char* pathname);
/// @brief 建立文件内容到内存空间的映射。
/// @param addr 映射内存地址，为0则可以任意地址。
/// @param len
/// @param prot 映射的内存读写等属性
/// @param flags 映射操作的一些设置，包括是否必须在指定位置映射
/// @param fildes
/// @param off
/// @return 返回映射内存地址的起始.
void* sys_mmap(void* addr, size_t len, int prot, int flags, int fildes, off_t off);

int           sys_munmap(void* addr, size_t len);
unsigned long sys_brk(unsigned long brk);
void*         sys_sbrk(long long increment);
/*
创建文件，可以是FIFO，常规文件，目录和设备文件。除了FIFO，其他类型创建前会检查进程权限（未完成）
*/
int sys_mknod(const char* path, mode_t mode, dev_t dev);