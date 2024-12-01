/*
此文件直接拷贝自linux的signal.h，并在其基础上修改。
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
	};
	
//signal用于向信号_sig安装一个新的信号处理函数
void (*signal(int _sig,void (*_func)(int)))(int);
 
//raise用于向当前进程自身发信号,kill用于向任何进程或进程组发任何信号
int raise(int sig);
int kill(pid_t pid,int sig);
/*
*进程的任务结构中有一个以比特位表示当前进程待处理的32位信号段signal,还有一个
*同样以比特位表示的用于屏蔽进场当前阻塞信号集合blocked。
*
*/
 
//sigaddset和sigdelset用于对信号集中的信号进行增减修改.
//sigaddset用于向mask指向的信号集合增加指定的信号signo,sigdelset则相反
int sigaddset(sigset_t *mask,int signo);
int sigdelset(sigset_t *mask,int signo);
 
//sigemptyset和sigfillset用于初始化进程屏蔽信号集，每个程序在使用信号集前,都需要使用
//这两个函数之一对屏蔽信号集进行初始化.sigemptyset用于清空屏蔽的所有信号，也即
//响应所有信号,sigfillset向信号集加入所有信号,也即屏蔽所有信号
int sigemptyset(sigset_t *mask);
int sigfillset(sigset_t *mask);
//用于测试一个指定信号是否在信号集中
int sigismember(sigset_t *mask,int signo);
 
//对set中断额信号进行检测，看是否有挂起的信号,
//在set中返回进程中当前被阻塞的信号集
int sigpending(sigset_t *set);
 
//用于改变进程目前被阻塞的信号集.若oldset不是null，则通过其返回进程当前屏蔽
// 信号集,若set指针不是null,则根据how指示修改进程屏蔽信号集
int sigprocmask(int how,sigset_t *set,sigset_t *oldset);
 
//用于sigmask临时替换进程的信号屏蔽码，然后暂停该进程直到收到一个信号
//若捕捉到一个信号并从该信号处理程序中返回,该函数也返回,并信号屏蔽码会恢复到
//调用前的值
int sigsuspend(sigset_t *sigmask);
 
//sigaction用于改变进程在收到指定信号时所采取的的行动
int sigaction(int sig,struct sigaction *act,struct sigaction *oldact);
 
#endif
 