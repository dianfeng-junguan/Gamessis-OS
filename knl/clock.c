#include "clock.h"
#include "int.h"
#include "proc.h"
#include "signal.h"
#include <devman.h>
#include <disk.h>
extern int             manage_proc_lock;
extern int             cur_proc;
extern struct process* task;
static long            check_v = 0;

void clock_c()
{
    if (!manage_proc_lock) {
        manage_proc();
        do_signals();
        //处理信号之后，可能进程状态被改变,需要重新调度。
        if (current && current->stat == TASK_SUSPENDED) {
            manage_proc();
        }
    }
}