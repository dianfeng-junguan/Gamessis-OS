#include <sys/unistd.h>
#include <proc.h>
#include <syscall.h>
ssize_t read(int fd, void *buf, size_t count){
    return do_syscall(SYSCAll_READ,fd,buf,count,0,0,0);
}


ssize_t write(int fd, const void * buf, size_t count){
    return do_syscall(SYSCAll_WRITE,fd,buf,count,0,0,0);
}

ssize_t pwrite(int fd, const void * buf, size_t count, off_t off){
    return do_syscall(SYSCAll_WRITE,fd,buf,count,off,0,0);
}
int execve(const char * path, char *const argv[] , char *const envp[]){
    return do_syscall(SYSCALL_EXECVE,path,argv,envp,0,0,0);
}

pid_t fork(void){
    return do_syscall(SYSCALL_FORK,0,0,0,0,0,0);
}
pid_t vfork(void){
    return do_syscall(SYSCALL_FORK,0,0,0,0,0,0);
}

int close(int fd){
    return do_syscall(SYSCAll_CLOSE,fd,0,0,0,0,0);
}
