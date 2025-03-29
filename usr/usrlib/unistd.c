#include <sys/unistd.h>
#include <proc.h>
#include <syscall.h>
// ssize_t read(int fd, void* buf, size_t count)
// {
//     return do_syscall(SYSCALL_READ, fd, buf, count, 0, 0, 0);
// }


// ssize_t write(int fd, const void* buf, size_t count)
// {
//     return do_syscall(SYSCALL_WRITE, fd, buf, count, 0, 0, 0);
// }

ssize_t pwrite(int fd, const void* buf, size_t count, off_t off)
{
    return do_syscall(SYSCALL_WRITE, fd, buf, count, off, 0, 0);
}
// int execve(const char* path, char* const argv[], char* const envp[])
// {
//     return do_syscall(SYSCALL_EXECVE, path, argv, envp, 0, 0, 0);
// }

// pid_t fork(void)
// {
//     return do_syscall(SYSCALL_FORK, 0, 0, 0, 0, 0, 0);
// }
// pid_t vfork(void)
// {
//     return do_syscall(SYSCALL_FORK, 0, 0, 0, 0, 0, 0);
// }

// int close(int fd)
// {
//     return do_syscall(SYSCALL_CLOSE, fd, 0, 0, 0, 0, 0);
// }


off_t lseek(int fildes, off_t offset, int whence)
{
    return do_syscall(SYSCALL_SEEK, fildes, offset, whence, 0, 0, 0);
}

// int open(const char* path, int oflag)
// {
//     return do_syscall(SYSCALL_OPEN, path, oflag, 0, 0, 0, 0);
// }