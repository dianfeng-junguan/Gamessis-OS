//
// Created by Oniar_Pie on 2024/4/29.
//

#ifndef GMS_KNL_VFS_H
#define GMS_KNL_VFS_H
//dir_entry
#define FILE_MODE_READ 1
#define FILE_MODE_WRITE 2
#define FILE_MODE_RW    3
#define FILE_MODE_BINARY 4
#define FILE_MODE_MEM   5
#define MAX_OPEN_FILES  64
#define MAX_FIFOS 16
#define MAX_FIXED 16
#define MAX_QUICKLOOK 16
#define VOLUME_STAT_EMPTY 0
#define VOLUME_STAT_READY 1
#define MAX_VOLUMES 26

#define BLOCK_SIZE 512
typedef char buffer_block[BLOCK_SIZE];	// 块缓冲区。
#define NR_BUFFERHEADS 32
// 缓冲区头数据结构。（极为重要！！！）
// 在程序中常用bh 来表示buffer_head 类型的缩写。
typedef struct buffer_head
{
  char *b_data;			/* pointer to data block (1024 bytes) *///指针。
  unsigned long b_blocknr;	/* block number */// 块号。
  unsigned short b_dev;		/* device (0 = free) */// 数据源的设备号。
  unsigned char b_uptodate;	// 更新标志：表示数据是否已更新。
  unsigned char b_dirt;		/* 0-clean,1-dirty *///修改标志:0 未修改,1 已修改.
  unsigned char b_count;	/* users using this block */// 使用的用户数。
  unsigned char b_lock;		/* 0 - ok, 1 -locked */// 缓冲区是否被锁定。
  struct task_struct *b_wait;	// 指向等待该缓冲区解锁的任务。
  struct buffer_head *b_prev;	// hash 队列上前一块（这四个指针用于缓冲区的管理）。
  struct buffer_head *b_next;	// hash 队列上下一块。
  struct buffer_head *b_prev_free;	// 空闲表上前一块。
  struct buffer_head *b_next_free;	// 空闲表上下一块。
};


typedef struct _vfs_dentry_{
    int fno;    //文件描述符
    int mode;   //打开模式
    int voln;   //属于哪一个卷
    int link_c; //被引用的次数
    int type;   //文件类型
    int id;     //文件在字文件系统里的id，如果id一样而且在一个卷内，就认为是同一个文件
    int ptr;    //读写指针
    struct _vfs_dentry_* parent;//上级目录
    struct buffer_head* buffer;//文件对应的缓冲区

    char name[32];//管道文件的名字
    int pa;     //用于管道文件：对应的物理地址
    int m_size; //管道文件的大小,目前限定在4kb
}vfs_dir_entry;
typedef struct {
    int pa;
    int size;
    int flag;
    int id;
}fifo_t;
typedef struct {
    char name[8];
    void *disk_drv;
    void *fs_drv;
    int stat;
}volume;
int setup_sys_vol(void *disk_drv, void *fs_drv);//系统盘符，用特殊方法装载
int free_vol(int voli);
int reg_vol(int disk_drvi, int fs_drvi, char *name);

//把块设备的存储块映射到内存中。
int bmap(int dev,struct buffer_head* bh,int blkn);
//申请一块新的缓存
struct buffer_head* new_buffer();
//把新的缓冲区接到原来链表结尾。
int add_buffer(struct buffer_head *addition,struct buffer_head* list);
//回写缓冲区内容(同步，只同步这一块)
int bsync(struct buffer_head* bh);
//回写缓冲区内容(同步，同步整个链)
int bsynca(struct buffer_head *bh);
//释放缓冲区（只释放这一块）
int brelse(struct buffer_head* bh);
//释放缓冲区（释放整个链的）
int brelsea(struct buffer_head* bh);
//从设备中读取指定设备的指定块并返回缓冲区
struct buffer_head* bread(int dev,int blk);
//锁定缓冲块
int lock_buffer(struct buffer_head* bh);
//解锁缓冲块
int unlock_buffer(struct buffer_head* bh);
//等待缓冲块解锁
int wait_on_buffer(struct buffer_head* bh);

//返回文件描述符
int sys_open(char *path, int mode);
int sys_close(int fno);
int sys_write(int fno, char *src, int pos, int len);
int sys_read(int fno, char *dist, int pos, int len);
int sys_seek(int fno, int offset, int origin);
int sys_tell(int fno);

int sys_mkfifo(int number);
int sys_rmfifo(int number);
int sys_readfifo(int number,char* dist,int len);
int sys_writefifo(int number,char* src,int len);
vfs_dir_entry *get_vfs_entry(int fno);
#endif
//
