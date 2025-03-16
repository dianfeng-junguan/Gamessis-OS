#include "c/stdlib.h"
#include <syscall.h>
void *malloc(size_t size){
    return do_syscall(SYSCALL_BRK,size,0,0,0,0,0);
}