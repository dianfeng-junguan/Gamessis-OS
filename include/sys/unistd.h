//
// Created by Oniar_Pie on 2024/10/30.
//

#ifndef GMS_UNISTD_H
#define GMS_UNISTD_H

#include "sys/types.h"
#define SEEK_SET 0
#define SEEK_END 1
#define SEEK_CUR 2
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

int          access(const char *, int);
unsigned int alarm(unsigned int);
int          brk(void *);
int          chdir(const char *);
int          chroot(const char *); 
int          chown(const char *, uid_t, gid_t);
int          close(int);
size_t       confstr(int, char *, size_t);
char        *crypt(const char *, const char *);
char        *ctermid(char *);
char        *cuserid(char *s);
int          dup(int);
int          dup2(int, int);
void         encrypt(char[64], int);
int          execl(const char *, const char *, ...);
int          execle(const char *, const char *, ...);
int          execlp(const char *, const char *, ...);
int          execv(const char *, char *const []);
int          execve(const char *, char *const [], char *const []);
int          execvp(const char *, char *const []);
void        _exit(int);
int          fchown(int, uid_t, gid_t);
int          fchdir(int);
int          fdatasync(int);
pid_t        fork(void);
long int     fpathconf(int, int);
int          fsync(int);
int          ftruncate(int, off_t);
char        *getcwd(char *, size_t);
int          getdtablesize(void); 
gid_t        getegid(void);
uid_t        geteuid(void);
gid_t        getgid(void);
int          getgroups(int, gid_t []);
long         gethostid(void);
char        *getlogin(void);
int          getlogin_r(char *, size_t);
int          getopt(int, char * const [], const char *);
int          getpagesize(void); 
char        *getpass(const char *); 
pid_t        getpgid(pid_t);
pid_t        getpgrp(void);
pid_t        getpid(void);
pid_t        getppid(void);
pid_t        getsid(pid_t);
uid_t        getuid(void);
char        *getwd(char *);
int          isatty(int);
int          lchown(const char *, uid_t, gid_t);
int          link(const char *, const char *);
int          lockf(int, int, off_t);
off_t        lseek(int, off_t, int);
int          nice(int);
long int     pathconf(const char *, int);
int          pause(void);
int          pipe(int [2]);
ssize_t      pread(int, void *, size_t, off_t);
int          pthread_atfork(void (*)(void), void (*)(void),
                 void(*)(void));
ssize_t      pwrite(int, const void *, size_t, off_t);
ssize_t      read(int fd, void * buf, size_t count);
int          readlink(const char *, char *, size_t);
int          rmdir(const char *);
void        *sbrk(intptr_t);
int          setgid(gid_t);
int          setpgid(pid_t, pid_t);
pid_t        setpgrp(void);
int          setregid(gid_t, gid_t);
int          setreuid(uid_t, uid_t);
pid_t        setsid(void);
int          setuid(uid_t);
unsigned int sleep(unsigned int);
void         swab(const void *, void *, ssize_t);
int          symlink(const char *, const char *);
void         sync(void);
long int     sysconf(int);
pid_t        tcgetpgrp(int);
int          tcsetpgrp(int, pid_t);
int          truncate(const char *, off_t);
char        *ttyname(int);
int          ttyname_r(int, char *, size_t);
useconds_t   ualarm(useconds_t, useconds_t);
int          unlink(const char *);
int          usleep(useconds_t);
pid_t        vfork(void);
ssize_t      write(int, const void *, size_t);

#endif //GMS_UNISTD_H
