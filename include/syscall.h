#include "sys/types.h"
#include "dirent.h"
#include "wndman.h"
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
#define SYSCALL_CHKMMAP 36
#define SYSCALL_READDIR 37
#define SYSCALL_CHDIR 38
#define SYSCALL_RENAME 39
#define SYSCALL_DRV_IOCTL 40
#define SYSCALL_REBOOT 41
#define SYSCALL_GETCWD 42
#define SYSCALL_KB_READC 100
#define SYSCALL_CREATE_WINDOW 101
#define SYSCALL_DESTROY_WINDOW 102
#define SYSCALL_SHOW_WINDOW 103
#define SYSCALL_HIDE_WINDOW 104
#define SYSCALL_RESIZE_WINDOW 105
#define SYSCALL_MOVE_WINDOW 106
#define SYSCALL_SET_WINDOW_TEXT 107
#define SYSCALL_ATTACH_WINDOW 108
#define SYSCALL_DETACH_WINDOW 109
#define SYSCALL_ADD_WINDOW_EVENT_LISTENER 110
#define SYSCALL_REMOVE_WINDOW_EVENT_LISTENER 111
#define SYSCALL_SEND_WINDOW_EVENT 112
#define SYSCALL_GET_WINDOW_TEXT 113
#define SYSCALL_GET_EVENT 114
#define SYSCALL_DEFAULT_DEAL_WINDOW_EVENT 115


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

#define MAX_SYSCALLS 200
typedef unsigned long long (*syscall_func_t)();
__attribute__((__always_inline__)) inline int do_syscall(long func, long a1, long a2, long a3,
                                                         long a4, long a5, long a6)
{
    //     __asm__ volatile("push %rbp\n");
    __asm__ volatile("mov %4,%%r10\n"
                     ".byte 0x48\n"
                     "syscall" ::"a"(func),
                     "D"(a1),
                     "S"(a2),
                     "d"(a3),
                     "m"(a4),
                     "r"(a5),
                     "r"(a6));
    //     __asm__ volatile("pop %rbp\n");
    register long ret = 0;
    __asm__ volatile("mov %%rax,%0" ::"r"(ret));
    return ret;
}
unsigned long long syscall(long a, long b, long c, long d, long e, long f);
int                exec(char* path);

unsigned long sys_open(char* filename, int flags);
unsigned long sys_close(int fd);
unsigned long sys_read(int fd, void* buf, long count);
unsigned long sys_write(int fd, void* buf, long count);
unsigned long sys_lseek(int filds, long offset, int whence);
unsigned long sys_tell(int fd);
unsigned long sys_wait(pid_t pid, int* stat_loc, int options);
int           sys_ioctl(int fildes, int request, unsigned long args);
int           sys_remove(char* pathname);
int           sys_rename(char* oldpath, char* newpath);
unsigned long sys_reboot(unsigned long cmd, void* arg);


int sys_chk_mmap(off_t base, size_t mem_size);
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
/**
    @brief 读取一个目录，获取里面的文件信息。
    @param dirp 目录文件句柄
    @param entry 目录项
    @param result 指向内含下一个文件的指针，如果没有或者已经到结尾则为NULL
    @return 成功返回0，失败返回-1
 */
int do_readdir(struct file* dirp, struct dirent* result);
int sys_readdir(int fd, struct dirent* result);
/*
创建文件，可以是FIFO，常规文件，目录和设备文件。除了FIFO，其他类型创建前会检查进程权限（未完成）
*/
int sys_mknod(const char* path, mode_t mode, dev_t dev);
int blank_syscall();

unsigned long sys_chdir(char* filename);
char*         sys_getcwd(char* buf, size_t size);

windowptr_t sys_create_window(char* title, int type);
int         sys_destroy_window(windowptr_t wnd);
int         sys_show_window(windowptr_t wnd);
int         sys_hide_window(windowptr_t wnd);
int         sys_resize_window(windowptr_t wnd, int w, int h);
int         sys_move_window(windowptr_t wnd, int x, int y);
int         sys_set_window_text(windowptr_t wnd, char* text);
int         sys_attach_window(windowptr_t wnd, windowptr_t parent);
int         sys_detach_window(windowptr_t wnd);
int sys_add_window_event_listener(windowptr_t wnd, int event_type, window_event_handler_t listener);
int sys_remove_window_event_listener(windowptr_t wnd, int event_type,
                                     window_event_handler_t listener);
int sys_send_window_event(windowptr_t wnd, window_event_t* event_data);
int sys_get_window_text(windowptr_t wnd, char* text, size_t size);
int sys_fetch_event(window_event_t* event);
int sys_default_deal_window_event(window_event_t* event);
