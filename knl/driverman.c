#include "driverman.h"
#include "memory.h"
#include "mem.h"
#include "log.h"
#include "proc.h"
driver_t* drivers;
///内部管理函数，卸载驱动
///@param index 数组下标
stat_t drvman_unreg(int index)
{
    drivers[index].driver_id    = 0;
    drivers[index].stat         = DRIVER_STAT_UNREGISTERED;
    drivers[index].driver_init  = 0;
    drivers[index].driver_exit  = 0;
    drivers[index].driver_ioctl = 0;
    return DRIVER_RETV_SUCCESS;
}
//驱动管理模块的初始化函数
stat_t init_driver_man()
{
    if ((drivers = kmalloc(0, MAX_DRIVERS * sizeof(driver_t))) == NULL) {
        return -1;
    }
    memset(drivers, 0, MAX_DRIVERS * sizeof(driver_t));
    return 0;
}
//卸载所有驱动，然后关闭这个模块。
stat_t driver_man_exit()
{
    for (int i = 0; i < MAX_DRIVERS; i++) {
        if (drivers[i].stat != DRIVER_STAT_UNREGISTERED) {
            if (unregister_driver(i + 1) < 0) {
                return -DRIVER_RETV_FAILED_EXIT;
            }
        }
    }
    kfree(drivers);
    return DRIVER_RETV_SUCCESS;
}
//返回驱动被分配的id。如果注册失败，返回负数的错误码。负责调用初始化函数
id_t register_driver(drvret_t (*init)(int), drvret_t (*exit)(),
                     drvret_t (*ioctl)(int, unsigned long long))
{
    if (!init || !exit || !ioctl) {
        debug_log("err: init/exit/ioctl NULL\n");
        return -DRIVER_RETV_NULL_POINTER;
    }
    for (int i = 0; i < MAX_DRIVERS; i++) {
        if (drivers[i].stat == DRIVER_STAT_UNREGISTERED) {
            drivers[i].driver_init  = init;
            drivers[i].driver_exit  = exit;
            drivers[i].driver_ioctl = ioctl;
#ifdef DEBUG
            printf("init at %p\n", init);
#else
            if (init(i + 1) < 0) {
                return -DRIVER_RETV_FAILED_INIT;
            }
#endif
            drivers[i].driver_id = i + 1;
            drivers[i].stat      = DRIVER_STAT_AVAILABLE;
            return i + 1;
        }
    }
    return -DRIVER_RETV_FAILED_ALLOC;
}
//注销驱动
stat_t unregister_driver(id_t id)
{
    id--;
    if (id < 0 || id > MAX_DRIVERS || drivers[id].stat == DRIVER_STAT_UNREGISTERED) {
        return -DRIVER_RETV_NONEXISTENT;
    }
    if (drivers[id].stat == DRIVER_STAT_BUSY) {
        return -DRIVER_STAT_BUSY;
    }
    if (drivers[id].driver_exit() < 0) {
        return -DRIVER_RETV_FAILED_EXIT;
    }
    return drvman_unreg(id);
}
//有的时候，一个驱动会收到很多很多的操作请求，那么就需要内核将他们存放在消息队列里面，
//一个一个发送给驱动然后检查驱动的工作状态，那么就需要驱动向内核知道自己的状态发生了改变
stat_t change_driver_stat(id_t id, stat_t stat)
{
    id--;
    if (id < 0 || id > MAX_DRIVERS || drivers[id].stat == DRIVER_STAT_UNREGISTERED) {
        return -DRIVER_RETV_NONEXISTENT;
    }
    drivers[id].stat = stat;
    return DRIVER_RETV_SUCCESS;
}

//向指定驱动发送请求
int drv_ioctl(int drv, int command, int block, unsigned long long arg)
{
    drv--;
    if (drv < 0 || drv > 127 || drivers[drv].stat == DRIVER_STAT_UNREGISTERED) {
        return -DRIVER_RETV_NONEXISTENT;
    }
    /*
    先检查请求队列
    */
    while (drivers[drv].stat == DRIVER_STAT_BUSY) {}
    //然后检查上一个请求的结果是否完成
    if (drivers[drv].stat == DRIVER_STAT_DONE) {
        //恢复相应等待的进程
        driver_request* done_req = drivers[drv].queue;
        if (done_req->block_waiter) {   //是阻塞类型的请求
            wake_up(done_req->waiting);
        }
        //返回的结果是通过arg里面的指针传递的，这里不传递
        //下一项内容
        drivers[drv].queue = done_req->next;
        kfree(done_req);
        //设置为准备好下一个请求的状态
        drivers[drv].stat = DRIVER_STAT_AVAILABLE;
    }
    driver_request* new_req = kmalloc(0, sizeof(driver_request));
    memset(new_req, 0, sizeof(new_req));
    if (!new_req) {
        debug_log("err: cannot make a new request due to failed malloc/\n");
        return -1;
    }
    new_req->command      = command;
    new_req->arg          = arg;
    new_req->waiting      = current;
    new_req->block_waiter = block ? 1 : 0;   //防止传入一些乱七八糟的参数
    new_req->next         = NULL;
    if (!drivers[drv].queue) {
        drivers[drv].queue = new_req;
    }
    else {
        if (drivers[drv].queue < KNL_BASE) {
            //内核空间里有时候会出现奇怪的bug，这里先忽略掉
            KPRINTF("catch a bug: drivers[drv].queue<KNL_BASE.\nnow ignore it.\n");
            drivers[drv].queue = new_req;
        }
        else {
            //将新请求添加到链表之后
            //加到链表结尾
            for (driver_request* p = drivers[drv].queue;; p = p->next) {
                if (!p->next) {
                    p->next = new_req;
                    break;
                }
            }
        }
    }
    //然后开始检查驱动是否可以开始工作
    if (drivers[drv].stat == DRIVER_STAT_AVAILABLE && drivers[drv].queue) {
        drivers[drv].stat    = DRIVER_STAT_BUSY;
        driver_request* todo = drivers[drv].queue;
        if (todo->block_waiter) {
            //阻塞进程，实际上进程还是会进行信号量的检查等，如果阻塞的是当前进程，代码还会运行，
            //下面的ioctl还是会执行的，但是在准备返回到用户空间的时候会被调度到其他进程。
            wait_on_req(todo->waiting);
        }
#ifdef DEBUG
        printf("ioctl at %p\n", drivers[drv].driver_ioctl);
#else
        drivers[drv].driver_ioctl(todo->command, todo->arg);
#endif
    }
    return 0;   // success
}

int next_request(int drvid)
{
    drvid--;
    if (drvid < 0 || drvid > 127 || drivers[drvid].stat == DRIVER_STAT_UNREGISTERED) {
        return -DRIVER_RETV_NONEXISTENT;
    }
    //恢复相应等待的进程
    driver_request* done_req = drivers[drvid].queue;
    if (done_req->block_waiter) {   //是阻塞类型的请求
        wake_up(done_req->waiting);
    }
    //返回的结果是通过arg里面的指针传递的，这里不传递
    //下一项内容
    drivers[drvid].queue = done_req->next;
    kfree(done_req);
    //设置为准备好下一个请求的状态
    drivers[drvid].stat = DRIVER_STAT_AVAILABLE;
    return 0;
}