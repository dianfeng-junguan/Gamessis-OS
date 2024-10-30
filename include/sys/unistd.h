//
// Created by Oniar_Pie on 2024/10/30.
//

#ifndef GMS_UNISTD_H
#define GMS_UNISTD_H

#include "sys/types.h"
/*
 * real id, effective id, saved effective id:
 * real id是指进程的真正执行者的id，effective id是指权限检查的时候使用的id（有时非root用户需要用root权限才能运行一些程序），
 * saved ~是effective id的缓存。非root用户只能把effective id设置成real id和saved中的一个。
 * 本质上，这三个id都是用户组id，不是进程组id。
 * */
/*
 * If the process has appropriate privileges, setgid() sets the real group ID, effective group ID
 * and the saved set-group-ID  to gid.
 * If the process does not have appropriate privileges, but gid is equal to the real group ID  or the
 * saved set-group-ID,  setgid() function sets the effective group ID to gid; the real group ID  and
 * saved set-group-ID  remain unchanged.
 * Any supplementary group IDs of the calling process remain unchanged.
 * */
pid_t setgid(gid_t gid);
//获取real group id。
pid_t getgid(void);

//============进程组===============

//获取当前进程的进程组号。
pid_t getpgrp(void);
//获取指定进程的进程组号。
int getpgid(pid_t pid,gid_t gid);
/*
 * 将pid对应的进程划归到gid进程组。
 * session leader的进程组id不会改变。
 * pid=0时，进程为当前进程。gid为0时，当前进程组id被使用。
 * */
int setpgid(pid_t pid,gid_t gid);
/*
 * The setsid() function creates a new session, if the calling process is not a process group leader.
 * Upon return the calling process will be the session leader of this new session, will be the process
 * group leader of a new process group, and will have no controlling terminal. The process group ID of
 * the calling process will be set equal to the process ID of the calling process. The calling process
 * will be the only process in the new process group and the only process in the new session.
 * */
pid_t setsid(void);
//获取pid进程的session号。0代表当前进程。
pid_t getsid(pid_t pid);
//更改当前的会话中的foreground process group id。
//fildes是当前会话的当前controlling terminal的文件描述符(tty描述符)，
//必须是属于当前进程的，也就是说当前进程必须是会话leader。
int tcsetpgrp(int fildes,pid_t pgid_id);
//获取fildes对应的会话的foreground process group id。
//fildes是当前会话的当前controlling terminal的文件描述符(tty描述符)
pid_t tcgetpgrp(int fildes);

#endif //GMS_UNISTD_H
