#include "clock.h"
#include "int.h"
#include "proc.h"
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
    //refresh_wnds();
    if(!manage_proc_lock)
    {
        manage_proc();
    }
    //puts("1 disk req executed.");
}