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
#define MAX_SUPERBLOCKS 26
#define MAX_FS 32
#define BLOCK_SIZE 512
typedef char buffer_block[BLOCK_SIZE];	// 块缓冲区。
#define NR_BUFFERHEADS 32

#define FTYPE_REG 0
#define FTYPE_BLKDEV 1
#define FTYPE_CHRDEV 2
// 缓冲区头数据结构。（极为重要！！！）
// 在程序中常用bh 来表示buffer_head 类型的缩写。
typedef struct _buffer_head
{
  char *b_data;			/* pointer to data block (1024 bytes) *///指针。
  unsigned long b_blocknr;	/* block number */// 块号。
  unsigned short b_dev;		/* device (0 = free) */// 数据源的设备号。
  unsigned char b_uptodate;	// 更新标志：表示数据是否已更新。
  unsigned char b_dirt;		/* 0-clean,1-dirty *///修改标志:0 未修改,1 已修改.
  unsigned char b_count;	/* users using this block */// 使用的用户数。
  unsigned char b_lock;		/* 0 - ok, 1 -locked */// 缓冲区是否被锁定。
  struct process *b_wait;	// 指向等待该缓冲区解锁的任务。
  struct _buffer_head *b_prev;	// hash 队列上前一块（这四个指针用于缓冲区的管理）。
  struct _buffer_head *b_next;	// hash 队列上下一块。
  struct _buffer_head *b_prev_free;	// 空闲表上前一块。
  struct _buffer_head *b_next_free;	// 空闲表上下一块。
}buffer_head;


typedef struct {
    int pa;
    int size;
    int flag;
    int id;
}fifo_t;

typedef struct 
{
  unsigned short ninodes;	// 节点数。
  unsigned short nzones;	// 逻辑块数。
  unsigned short imap_blocks;	// i 节点位图所占用的数据块数。
  unsigned short zmap_blocks;	// 逻辑块位图所占用的数据块数。
  unsigned short firstdatazone;	// 第一个数据逻辑块。
  unsigned short log_zone_size;	// log(数据块数/逻辑块)。（以2 为底）。
  unsigned long  max_size;	// 文件最大长度。
  unsigned short magic;	// 文件系统魔数。
  unsigned int block_size;//块大小
  unsigned char name[8];//超级块上面的名称
}super_block;

typedef struct _vfs_dentry_{
    int fno;    //文件描述符
    int mode;   //打开模式
    int voln;   //属于哪一个卷
    int link_c; //被引用的次数
    int type;   //文件类型
    int id;     //文件在字文件系统里的id，如果id一样而且在一个卷内，就认为是同一个文件
    int size;   //文件大小
    int ptr;    //读写指针
    int dev;    //属于哪个设备
    struct _vfs_dentry_* parent;//上级目录
    struct buffer_head* buffer;//文件对应的缓冲区

    char name[32];//管道文件的名字
    int pa;     //用于管道文件：对应的物理地址
    int m_size; //管道文件的大小,目前限定在4kb
}vfs_dir_entry;
typedef struct
{
    int (*read_superblock)(int dev,int blk);//返回的是超级块数组索引
    int (*get_according_bnr)(vfs_dir_entry *f);
    int (*find)(char *name,vfs_dir_entry dir,vfs_dir_entry* result);//返回的是
}fs_operations;


typedef struct {
    char name[8];
    void *disk_drv;
    void *fs_drv;
    fs_operations *fs;
    int stat;
}volume;
typedef struct
{
    unsigned char type;
    unsigned char start_head;
    unsigned short start_sec;
    unsigned char fs_flag;
    unsigned char end_head;
    unsigned short end_sec;
    unsigned int start_lba;
    unsigned int end_lba;
}dpt_t;
#define NONACTIVE_PAR 0
#define ACTIVE_PAR 0x80
// int setup_sys_vol(void *disk_drv, void *fs_drv);//系统盘符，用特殊方法装载
// int free_vol(int voli);
// int reg_vol(int disk_drvi, int fs_drvi, char *name);
// int identify_vol(int disk_drvi);//识别这个卷上面的文件系统，返回fs_drvi

// //把块设备的存储块映射到内存中。
// int bmap(int dev,struct buffer_head* bh,int blkn);
// //申请一块新的缓存
// struct buffer_head* new_buffer();
// //把新的缓冲区接到原来链表结尾。
// int add_buffer(struct buffer_head *addition,struct buffer_head* list);
// //回写缓冲区内容(同步，只同步这一块)
// int bsync(struct buffer_head* bh);
// //回写缓冲区内容(同步，同步整个链)
// int bsynca(struct buffer_head *bh);
//释放缓冲区（只释放这一块）
int brelse(buffer_head* bh);
//获取或者新建一个和dev上block相对应的缓冲区。
buffer_head* get_buf(int dev,int block);
void wait_on_buf(buffer_head* bh);

int sync_buf(buffer_head* bh);
// //释放缓冲区（释放整个链的）
// int brelsea(struct buffer_head* bh);
// //从设备中读取指定设备的指定块并返回缓冲区
// struct buffer_head* bread(int dev,int blk);
// //锁定缓冲块
// int lock_buffer(struct buffer_head* bh);
// //解锁缓冲块
// int unlock_buffer(struct buffer_head* bh);
// //等待缓冲块解锁
// int wait_on_buffer(struct buffer_head* bh);
int init_vfs();
//扫描块设备，读取分区，识别文件系统
int scan_dev(int dev);
//写常规文件
int vfs_read_file(vfs_dir_entry *f,char *buf,int len);
int vfs_write_file(vfs_dir_entry *f,char *buf,int len);
#define SEEK_SET 0
#define SEEK_END 1
#define SEEK_CUR 2
int vfs_seek_file(vfs_dir_entry *f,int offset,int origin);
//返回文件ptr在块设备中的块号
int get_according_bnr(vfs_dir_entry *f);
//块设备操作
int write_block(int dev,int block,char *buf,int len);
int read_block(int dev,int block,char* buf,int len);
//返回文件描述符
int sys_open(char *path, int mode);
int sys_close(int fno);
int sys_write(int fno, char *src, int len);
int sys_read(int fno, char *dist, int len);
int sys_seek(int fno, int offset, int origin);
int sys_tell(int fno);

int sys_mkfifo(int number);
int sys_rmfifo(int number);
int sys_readfifo(int number,char* dist,int len);
int sys_writefifo(int number,char* src,int len);
vfs_dir_entry *get_vfs_entry(int fno);
#endif
//
