#pragma once
#include <sys/types.h>
/*
块设备的高级封装，同时是块设备的缓冲区层
*/
//
#define SECTOR_FLOOR(n) ((n-n%512)/512)
#define BLOCK_FLOOR(n) ((n-n%4096)/4096)
#define MAX_BUFFERHEADS 128
typedef struct _buffer_head
{
  char *data;			/* pointer to data block (BLOCK_SIZE bytes) *///指针。
  unsigned long blocknr;	/* block number */// 块号。
  unsigned short dev;		/* device (0 = free) */// 数据源的设备号。
  unsigned char uptodate;	// 更新标志：表示数据是否已更新。
  unsigned char dirt;		/* 0-clean,1-dirty *///修改标志:0 未修改,1 已修改.
  unsigned char count;	/* users using this block */// 使用的用户数。
  unsigned char lock;		/* 0 - ok, 1 -locked */// 缓冲区是否被锁定。
  struct process *wait;	// 指向等待该缓冲区解锁的任务。
  struct _buffer_head *prev;	// hash 队列上前一块（这四个指针用于缓冲区的管理）。
  struct _buffer_head *next;	// hash 队列上下一块。
  struct _buffer_head *prev_free;	// 空闲表上前一块。
  struct _buffer_head *next_free;	// 空闲表上下一块。
}buffer_head;

//获得一块空闲的buffer head
buffer_head *bget();
//获取指定设备指定数据的缓存
buffer_head *get_block(unsigned short dev,int blocknr);
//从指定的块设备中读取一块数据，然后返回这块数据。
//@param dev 完整的设备号，包括大类号和编号
buffer_head* bread(unsigned short dev,int blkn);
/*
向缓冲区写入数据。注意缓冲区的大小固定BLOCK_SIZE。
这会使得dirty置位。
@param pos 从bh的哪里开始写
*/
int bwrite(buffer_head* bh,char* src,int pos,int count);
/*
立即把缓冲区里面的更新应用到块设备上。
*/
int bflush(buffer_head* bh);
//丢弃更改。
int bdiscard(buffer_head *bh);
//bdiscard的别名。从设备更新数据到bh
int bupdate(buffer_head *bh);

//释放缓冲区，会在释放前bflush。
int brelse(buffer_head *bh);
/*
bread的更高级封装，可以不以块为单位读取到buf。
*/
int blkdev_read(unsigned short dev,off_t offset, size_t count, char *buf);
/*
bwrite的更高级封装。
*/
int blkdev_write(unsigned short dev,off_t offset, size_t count, char *buf);

void init_blkbuf();