#include "gms/gms.h"
#include "syscall.h"
void* create_console()
{
    return do_syscall(SYSCALL_CREATE_CONSOLE, 0, 0, 0, 0, 0, 0);
}
int destroy_console(void* console)
{
    return do_syscall(SYSCALL_DESTROY_CONSOLE, console, 0, 0, 0, 0, 0);
}
int attach_console(void* console)
{
    return do_syscall(SYSCALL_ATTACH_CONSOLE, console, 0, 0, 0, 0, 0);
}
int detach_console()
{
    return do_syscall(SYSCALL_DETACH_CONSOLE, 0, 0, 0, 0, 0, 0);
}