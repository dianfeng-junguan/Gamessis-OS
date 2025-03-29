#include "wndman.h"
#include "tty.h"
#include "memman.h"
#include "proc.h"
#include "log.h"
#include <sys/stat.h>
#include "ioctlarg.h"
#include "driverman.h"
typedef struct _console
{
    tty_t*           tty;
    windowptr_t      console_wnd;
    dev_t            tty_dev;               //所创建的tty设备
    pid_t            last_attaching_task;   //上一个依附该控制台的任务
    int              link;
    struct _console* next;
} console_t;
int        init_conhost();
console_t* create_console();
int        destroy_console(console_t* console);
void       conhost_thread();
int        attach_console(pid_t pid, console_t* console);
int        detach_console(pid_t pid);

static int _tty_nameid = 0;

console_t* all_consoles;

int init_conhost()
{
    all_consoles = 0;
    if (create_kthread(conhost_thread) < 0) {
        panic("create conhost thread failed");
    }
    return 0;
}
/**
    @brief 创建控制台窗口，作为新进程的窗口
*/
console_t* create_console()
{
    console_t* console = kmalloc(sizeof(console_t), NO_ALIGN);
    if (!console) {
        return NULL;
    }

    console->console_wnd = create_window("Console", WNDTYPE_WINDOW);
    if (!console->console_wnd) {
        close_tty(console->tty);
        kfree(console);
        return NULL;
    }
    windowptr_t displaycontent_editbox = create_window("console", WNDTYPE_EDITBOX);
    move_window(displaycontent_editbox, 0, 0);
    attach_window(displaycontent_editbox, console->console_wnd);
    show_window(displaycontent_editbox);

    char name[16]  = "tty";
    int  i         = 3;
    int  new_ttyid = _tty_nameid++;
    for (; i < 16; i++) {
        name[i] = '0' + (new_ttyid % 10);
        new_ttyid /= 10;
    }
    name[i] = 0;

    dev_t new_ttydev = reg_device(name, S_IFCHR, drv_tty, drv_tty);
    console->tty_dev = new_ttydev;
    console->tty     = open_tty(new_ttydev);
    if (!all_consoles) {
        all_consoles = console;
    }
    else {
        console_t* p = all_consoles;
        while (p->next) {
            p = p->next;
        }
        p->next = console;
    }
    return console;
}
int destroy_console(console_t* console)
{
    if (!console) {
        return -1;
    }
    if (console == all_consoles) {
        all_consoles = console->next;
    }
    else {
        console_t* p = all_consoles;
        while (p->next != console) {
            p = p->next;
        }
        p->next = console->next;
    }
    destroy_window(console->console_wnd);
    unreg_device(console->tty_dev);
    close_tty(console->tty);
    kfree(console);
    return 0;
}
void conhost_thread()
{
    while (1) {
        console_t* console = all_consoles;
        while (console) {
            window_event_t event;
            //控制台窗口只使用简单地gets,scanf等函数获取输入，因此需要conhost托管处理事件
            if (do_fetch_event(console->last_attaching_task, &event) < 0)
                continue;
            if (event.event_type == WND_EVENT_KEY_DOWN) {
                char              ch        = event.key_code;
                drvioctlarg_write ioctl_arg = {
                    .buf   = &ch,
                    .count = 1,
                    .dev   = console->tty_dev,
                };
                tty_mod_ioctl(DRIVER_CMD_WRITE, &ioctl_arg);
            }
            default_deal_window_event(&event);

            console = console->next;
        }
    }
}
/**
    @brief 将一个进程附着到一个控制台窗口上，该进程将使用该控制台的std
    @param pid 要附着的进程id
    @param console 要附着到的控制台窗口
    @return 成功返回0，失败返回-1
*/
int attach_console(pid_t pid, console_t* console)
{
    task[pid].attached_console = console;
    // TODO 切换std，即重新设置前三个opened files
    console->last_attaching_task = pid;
    console->link++;
    task[pid].openf[0] = open_tty(console->tty_dev);
    task[pid].openf[1] = task[pid].openf[0];
    task[pid].openf[2] = task[pid].openf[0];
    return 0;
}
int detach_console(pid_t pid)
{
    console_t* console = task[pid].attached_console;
    console->link--;
    task[pid].attached_console = NULL;
    // 切换std，即重新设置前三个opened files
    for (int i = 0; i < 3; i++) {
        task[pid].openf[i] = NULL;
    }

    // 检查该控制台是否已经没有进程在用了，如果是就释放这个控制台
    if (console->link == 0) {
        destroy_console(console);
    }
    return 0;
}