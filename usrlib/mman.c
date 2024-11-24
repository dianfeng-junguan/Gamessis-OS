#include <sys/mman.h>
#include <syscall.h>
void *mmap(void *addr, size_t len, int prot, int flags,int fildes, off_t off){
    return do_syscall(SYSCALL_MMAP,addr,len,prot,flags,fildes,off);
}
