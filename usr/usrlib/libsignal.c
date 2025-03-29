#include <sys/types.h>
#include "syscall.h"
int send_signal(pid_t pid, int sig)
{
    return do_syscall(SYSCALL_SEND_SIGNAL, pid, sig, 0, 0, 0, 0);
}