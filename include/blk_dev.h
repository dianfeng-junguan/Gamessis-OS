#pragma once
/*
块设备抽象层。
*/
#include <proc.h>
struct request
{
  int dev;			/* -1 if no request */// 使用的设备号。
  int cmd;			/* READ or WRITE */// 命令(READ 或WRITE)。
  int errors;			//操作时产生的错误次数。
  unsigned long sector;		// 起始扇区。(1 块=2 扇区)
  unsigned long nr_sectors;	// 读/写扇区数。
  unsigned long count;      //传输到buf的字节数
  char *buffer;			// 数据缓冲区。
  struct process *waiting;	// 任务等待操作执行完成的地方。
//   struct buffer_head *bh;	// 缓冲区头指针
  struct request *next;		// 指向下一请求项。
};
struct blk_dev
{
  void (*do_request) (struct request* req);	// 请求操作的函数指针。
  struct request *current_request;	// 请求信息结构。
};
#define BLKDEV_REQ_READ 0
#define BLKDEV_REQ_WRITE 1
//块设备注册种类最大值
#define MAX_BLKDEVS 12
//每种种类下最多注册的设备数
#define MAX_MINOR_DEVS 12
#define BLKDEV_MAJOR(n) ((n&0xf0)>>4)
#define BLKDEV_MINOR(n) (n&0xf)

#define MAX_REQUESTS 64
#define BLOCK_SIZE 4096
#define SECTOR_SIZE 512
#define TO_BLKN(n) (n/4096+n%4096>0?1:0)
#define TO_SECN(n) (n/512+n%512>0?1:0)
__attribute__((always_inline)) void inline end_request(int dev){
    //
    blk_devs[dev].current_request=blk_devs[dev].current_request->next;
}
/*
@brief 注册块设备，返回一个设备类号。
设备类号就是给一类相同操作的设备的编号。该类别下每个具体的设备还会有一个设备编号，二者合在一起就是设备号。
设备类号构成设备号的高1字节，设备编号占低1字节，int的其他位不使用。
*/
int reg_blkdev(struct blk_dev* dev);
/*
@param dev 设备号。

*/
int unreg_blkdev(int dev);
/*
@brief 向设备发送一个请求。这会导致该进程暂停，直到相应的设备的处理函数解冻进程。
@param cmd 命令。抽象层只定义了read和write，但是具体的设备可能还会定义其他功能。
*/
int make_request(int dev,int cmd,unsigned long sector, unsigned long count,char * buffer);


extern struct blk_dev blk_devs[MAX_BLKDEVS];
extern struct request requests[MAX_REQUESTS];