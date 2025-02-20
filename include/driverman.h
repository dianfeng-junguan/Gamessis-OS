#pragma once
#include "sys/types.h"
#include "typename.h"
typedef int drvret_t ;//驱动器的函数执行状态类型（标注成功还是失败，是哪种类型的失败）
/*
内核方的驱动管理，是内核内部文件。
 */
//以下是一些常用的驱动设备接口命令
#define DRIVER_CMD_READ 0
#define DRIVER_CMD_WRITE 1
#define DRIVER_CMD_EXIT 2
#define DRIVER_CMD_INITDEV 3
#define DRIVER_CMD_RM 4
#define DRIVER_CMD_OPEN 5
#define DRIVER_CMD_CLOSE 6
//以下是一些常用的驱动状态
#define DRIVER_STAT_UNREGISTERED 0
#define DRIVER_STAT_AVAILABLE 1
#define DRIVER_STAT_BUSY 2
//这个状态意味着驱动完成了一个请求，返回的结果需要内核取走 
#define DRIVER_STAT_DONE 3

#define DRIVER_RETV_SUCCESS 0
#define DRIVER_RETV_FAILED_INIT 1
#define DRIVER_RETV_FAILED_ALLOC 2
#define DRIVER_RETV_NONEXISTENT 3
#define DRIVER_RETV_BUSY 4
#define DRIVER_RETV_FAILED_EXIT 5
#define DRIVER_RETV_NULL_POINTER 6
typedef struct _DriverRequest{
    int block_waiter;
    struct process* waiting;
    int command;
    unsigned long long arg;//参数
    struct _DriverRequest* next;
}driver_request ;
typedef struct{
    /*
    驱动包含至少如下内容：
    1.标识符
    2.状态
    3.接口
    */
    id_t driver_id;
    stat_t stat;
    //驱动的初始化函数，在驱动模块被加载的时候被调用。
    //驱动的注册是在init函数中进行的，但是在注册的时候还是需要传递init函数的指针，
    //这样之后需要重置驱动的时候可以用上。
    drvret_t (*driver_init)();
    drvret_t (*driver_exit)();
    //arg通常是一个指向更多参数的指针，任务的结果如果有返回内容较大，也会存储在arg指向的一块区域，
    //具体怎么样还要看驱动的具体规定。
    drvret_t (*driver_ioctl)(int command,unsigned long long arg);

    driver_request *queue;
}driver_t ;
//内核需要提供以下函数的实现

//驱动初始化时，需要向内核注册自己，让内核感知到自己的存在
//返回驱动被分配的id。如果注册失败，返回负数的错误码。
id_t register_driver(drvret_t (*init)(int),drvret_t (*exit)(),drvret_t (*ioctl)(int, unsigned long long));
//内核接收到用户的要求或者遇到错误或者关机的时候，需要注销驱动
stat_t unregister_driver(id_t id);
//有的时候，一个驱动会收到很多很多的操作请求，那么就需要内核将他们存放在消息队列里面，
//一个一个发送给驱动然后检查驱动的工作状态，那么就需要驱动向内核知道自己的状态发生了改变
stat_t change_driver_stat(id_t id,stat_t stat);

//内核内部还要为了管理实现以下函数
//驱动管理模块初始化
stat_t init_driver_man();
stat_t driver_man_exit();

int drv_ioctl(int drv, int command, int block, unsigned long long arg);


/**
    @brief 立即丢弃当前请求进入下一个请求，不会改变驱动的状态。对于一些驱动，可能需要在完成任务之后马上标记请求完成并清理，就需要调用这个函数避免
    下一次调用ioctl的时候重复唤醒进程

*/
int next_request(int drvid);
/**
    @brief 开启特殊的ioctl阻塞模式，对下一次drv_ioctl有效。对于一些驱动，在处理ioctl的时候需要直接在drv_ioctl函数中阻塞等待，建议只在内核初始化的时候调用一次
*/
int turn_on_special_block_type();

#define MAX_DRIVERS 128

