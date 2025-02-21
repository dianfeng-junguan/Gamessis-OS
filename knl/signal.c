#include "signal.h"
#include "memman.h"
#include "memory.h"
#include "proc.h"
#include "sys/types.h"
#include "vfs.h"
#include "errno.h"
//检查是否是不可屏蔽的中断
static int unmaskable(int signal)
{
    return (signal == SIGHUP || signal == SIGINT || signal == SIGILL || signal == SIGKILL ||
            signal == SIGSEGV || signal == SIGTERM || signal == SIGQUIE || signal == SIGABORT ||
            signal == SIGIOT || signal == SIGSTOP || signal == SIGTSTP);
}
int send_signal(pid_t pid, int sig)
{
    struct process* p = get_proc(pid);
    if (!p) {
        set_errno(-ENOENT);
        return -1;
    }
    struct List* l = kmalloc(sizeof(struct List), NO_ALIGN);
    list_init(l);
    l->data = sig;
    if (!p->signal_queue)
        p->signal_queue = l;
    else
        list_add(p->signal_queue, l);
    return 0;
}

int mask_signal(int sig, int should_block)
{
    if (should_block) {
        return set_sigmask(current, sig);
    }
    return reset_sigmask(current, sig);
}
int sig_masked(int sig)
{
    unsigned int m = current->sigmask & (1 << sig);
    return m;
}

int default_signal_handler(int sig) {}

int signal_handler_end(int sig)
{
    int code = 0;
    //这两个信号代表不正常结束
    if (sig == SIGABORT || sig == SIGINT)
        code = -1;
    sys_exit(code);
    return -1;
}

//处理进程的信号
int do_signals()
{
    struct List* sig = current->signal_queue;
    for (; sig; sig = sig->next) {
        if (!unmaskable(sig->data) && sig_masked(sig->data)) {
            continue;
        }
        // TODO 非常临时的代码，只是用来快速处理终结信号的
        switch ((int)sig->data) {
        case SIGHUP:
        case SIGKILL:
        case SIGQUIE:
        case SIGABORT:
        case SIGSTOP:
        case SIGINT: signal_handler_end(sig->data); break;
        case SIGCHLD:   //有结束的子进程
            if (current->stat == TASK_SUSPENDED)
                current->stat = TASK_READY;
            break;
        default: default_signal_handler(sig->data); break;
        }
        if (current->signal_queue == sig)
            current->signal_queue = current->signal_queue->next;
        list_drop(sig);
        kfree(sig);
    }
    return 0;
}

int reset_sigmask(pid_t pid, int signal)
{
    struct process* p = get_proc(pid);
    if (!p)
        return 0;
    p->sigmask &= ~(1 << signal);
    return 1;
}
int set_sigmask(pid_t pid, int signal)
{
    struct process* p = get_proc(pid);
    if (!p || unmaskable(signal)) {
        //停止信号不能被屏蔽
        return 0;
    }
    p->sigmask |= 1 << signal;
    return 1;
}
