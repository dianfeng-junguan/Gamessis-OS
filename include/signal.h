/*
此文件直接拷贝自linux的signal.h，并在其基础上修改。
此文件的函数接口是内核内部的，不是提供给用户的
*/
#ifndef _SIGNAL_H
#define _SIGNAL_H
 
#include<sys/types.h>
typedef int sig_atomic_t;
typedef unsigned int sigset_t;
 
#define _NSIG     32					//定义信号
#define NSIG      _NSIG
 
#define SIGHUP		1  //hang up 挂断控制终端或进程
#define SIGINT		2  //interrupt 来自键盘的中断
#define SIGQUIE		3  //quit	退出
#define SIGILL		4  //illeagle 非法指令
#define SIGTRAP  	5  //trap   跟踪断点
#define SIGABORT	6  //Abort  异常结束
#define SIGIOT		6  //IO trap  异常   
#define SIGUNUSED	7  //Unused 没有使用
#define SIGFPE		8  //FPE 协处理器出错
#define SIGKILL		9  //kill  强迫终止
#define SIGUSR1		10 //use1  用户信号1,进程可使用
#define SIGSEGV		11 //segment violation 无效内存引用
#define SIGUSR2		12 //user2  用户信号2,进程可使用
#define SIGPIPE		13 //pipe  管道写出错
#define SIGALRM		14 //alarm  实时定时器报警
#define SIGTERM		15 //terminate 进程终止
#define SIGSTKFLT	16 //stack Fault 栈出错
#define SIGCHLD		17 //child 子进程停止
#define SIGCONT		18 //continue 回复进程继续
#define SIGSTOP		19 //stop  停止进程执行
#define SIGTSTP		20 //tty stop tty发出停止进程
#define SIGTTIN		21 //tty in  后台进程请求输入
#define SIGTTOU		22 //tty out 后台进程请求输出
 
#define SA_NOCLDSTOP 1 //进程处于停止状态,就不对sigchild进行处理
#define SA_NOMASK	 0X40000000
//不阻止在指定的信号处理程序中再收到该信号
#define SA_ONESHOT 0X80000000
//信号句柄一旦被调用就恢复到默认处理句柄
#define SIG_BLOCK  //在阻塞信号集中加上给定的信号集
#define SIG_UNBLOCK//从阻塞信号集中删除指定的信号集
#define SIG_SETMASK//设置阻塞信号集(信号屏蔽码)
 
#define SIG_DFL 	((void(*)(int))0) //默认信号处理程序
#define SIG_IGN		((void (*)(int))1)//忽略信号处理程序
// #define SIG_HOLD    ((void(*)(int))2) 
// #define SIG_ERR    ((void (*)(int))3)
 
/*
*这是sigaction数据结构.sa_handler是对因某信号指定要采取的行动,可以使用上面的SIG_DFL,
*SIG_IGN.也可以指向处理该信号函数的一个指针.
*sa_mask给出了对信号的屏蔽码,在信号程序执行时将阻塞对这些信号的处理
*sa_flag指定改变信号处理过程的信号集
*sa_restorer是恢复函数指针，由函数库libc提供
*另外，引起触发信号处理的信号也将被阻塞,
*/
struct sigaction{
	void (*sa_handler)(int);
	sigset_t sa_mask;
	int sa_flags;
	void (*sa_restorer)(void);
	// void (*sa_sigaction)(int, siginfo_t *, void *);
};

int send_signal(pid_t pid,int sig);

int mask_signal(int sig,int should_block);

int default_signal_handler(int sig);

int signal_handler_end(int sig);

// int add_signal(int sig,);
//处理进程的信号
int do_signals();
 
#endif
 