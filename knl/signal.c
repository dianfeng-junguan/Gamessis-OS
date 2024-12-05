#include "signal.h"
#include "memory.h"
#include "proc.h"
#include "vfs.h"
#include "errno.h"

int send_signal(pid_t pid,int sig){
    struct process* p=get_proc(pid);
    if(!p){
        set_errno(-ENOENT);
        return -1;
    }
    struct List* l=kmalloc(0, sizeof(struct List));
    list_init(l);
    l->data=sig;
    if(!p->signal_queue)
        p->signal_queue=l;
    else
        list_add(p->signal_queue, l);
    return 0;
}

int mask_signal(int sig,int should_block){
    
}

int default_signal_handler(int sig){

}

int signal_handler_end(int sig){
    int code=0;
    if(sig==SIGABORT||sig==SIGINT)code=-1;
    sys_exit(code);
    return -1;
}

//处理进程的信号
int do_signals(){
    struct List* sig=current->signal_queue;
    for (; sig; sig=sig->next) {
        //TODO 非常临时的代码，只是用来快速处理终结信号的
        switch ((int)sig->data) {
        case SIGHUP:
        case SIGKILL:
        case SIGQUIE:
        case SIGABORT:
        case SIGSTOP:
        case SIGINT:
            signal_handler_end(sig->data);
        break;
        default:default_signal_handler(sig->data);break;
        }

    }
    if(current->signal_queue){
        current->signal_queue=current->signal_queue->next;
        kmfree(sig);
    }
    return 0;
}