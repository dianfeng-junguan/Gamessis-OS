//
// Created by Oniar_Pie on 2024/11/3.
//
#include "sys/wait.h"
#include "proc.h"
#include "syscall.h"

//等待任意一个子进程结束。
//如果已经有子进程结束了，那么函数立即返回。
pid_t wait(int* stat_loc)
{
    return do_syscall(SYSCALL_WAIT, -1, stat_loc, 0, 0, 0, 0);
}

//等指定一个子进程结束。
//如果该子进程已经结束了，那么函数立即返回。
// pid_t waitpid(pid_t pid, int *stat_loc, int options){
//     return do_syscall(SYSCALL_WAIT,pid,stat_loc,options,0,0,0);
// }