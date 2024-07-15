
#include <ext2/types.h>		// 类型头文件。定义了基本的系统数据类型。

/* devices are as follows: (same as minix, so we can use the minix
* file system. These are major numbers.)
*
* 0 - unused (nodev)
* 1 - /dev/mem
* 2 - /dev/fd
* 3 - /dev/hd
* 4 - /dev/ttyx
* 5 - /dev/tty
* 6 - /dev/lp
* 7 - unnamed pipes
*/
/*
* 系统所含的设备如下：（与minix 系统的一样，所以我们可以使用minix 的
* 文件系统。以下这些是主设备号。）
*
* 0 - 没有用到（nodev）
* 1 - /dev/mem 内存设备。
* 2 - /dev/fd 软盘设备。
* 3 - /dev/hd 硬盘设备。
* 4 - /dev/ttyx tty 串行终端设备。
* 5 - /dev/tty tty 终端设备。
* 6 - /dev/lp 打印设备。
* 7 - unnamed pipes 没有命名的管道。
*/

#define IS_SEEKABLE(x) ((x)>=1 && (x)<=3)	// 是否是可以寻找定位的设备。

#define READ 0
#define WRITE 1
#define READA 2			/* read-ahead - don't pause */
#define WRITEA 3		/* "write-ahead" - silly, but somewhat useful */

void buffer_init (long buffer_end);

#define MAJOR(a) (((unsigned)(a))>>8)	// 取高字节（主设备号）。
#define MINOR(a) ((a)&0xff)	// 取低字节（次设备号）。

#define NAME_LEN 14		// 名字长度值。
#define ROOT_INO 1		// 根i 节点。

#define I_MAP_SLOTS 8		// i 节点位图槽数。
#define Z_MAP_SLOTS 8		// 逻辑块（区段块）位图槽数。
#define SUPER_MAGIC 0x137F	// 文件系统魔数。

#define NR_OPEN 20		// 打开文件数。
#define NR_INODE 32
#define NR_FILE 64
#define NR_SUPER 8
#define NR_HASH 307
#define NR_BUFFERS nr_buffers
#define BLOCK_SIZE 1024		// 数据块长度。
#define BLOCK_SIZE_BITS 10	// 数据块长度所占比特位数。
#ifndef NULL
#define NULL 0
#endif

// 每个逻辑块可存放的i 节点数。
#define INODES_PER_BLOCK ((BLOCK_SIZE)/(sizeof (struct d_inode)))
// 每个逻辑块可存放的目录项数。
#define DIR_ENTRIES_PER_BLOCK ((BLOCK_SIZE)/(sizeof (struct dir_entry)))

// 管道头、管道尾、管道大小、管道空？、管道满？、管道头指针递增。
#define PIPE_HEAD(inode) ((inode).i_zone[0])
#define PIPE_TAIL(inode) ((inode).i_zone[1])
#define PIPE_SIZE(inode) ((PIPE_HEAD(inode)-PIPE_TAIL(inode))&(PAGE_SIZE-1))
#define PIPE_EMPTY(inode) (PIPE_HEAD(inode)==PIPE_TAIL(inode))
#define PIPE_FULL(inode) (PIPE_SIZE(inode)==(PAGE_SIZE-1))
//#define INC_PIPE(head) \
//__asm__( "incl %0\n\tandl $4095,%0":: "m" (head))
// #define INC_PIPE(head) _INC_PIPE(&(head))
// extern _inline void _INC_PIPE(unsigned long *head) {
// 	_asm mov ebx,head
// 	_asm inc dword ptr [ebx]
// 	_asm and dword ptr [ebx],4095
// }

typedef char buffer_block[BLOCK_SIZE];	// 块缓冲区。

// 缓冲区头数据结构。（极为重要！！！）
// 在程序中常用bh 来表示buffer_head 类型的缩写。
struct buffer_head
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

// 磁盘上的索引节点(i 节点)数据结构。
struct d_inode
{
  unsigned short i_mode;	// 文件类型和属性(rwx 位)。
  unsigned short i_uid;		// 用户id（文件拥有者标识符）。
  unsigned long i_size;		// 文件大小（字节数）。
  unsigned long i_time;		// 修改时间（自1970.1.1:0 算起，秒）。
  unsigned char i_gid;		// 组id(文件拥有者所在的组)。
  unsigned char i_nlinks;	// 链接数（多少个文件目录项指向该i 节点）。
  unsigned short i_zone[9];	// 直接(0-6)、间接(7)或双重间接(8)逻辑块号。
// zone 是区的意思，可译成区段，或逻辑块。
};

// 这是在内存中的i 节点结构。前7 项与d_inode 完全一样。
struct m_inode
{
  unsigned short i_mode;	// 文件类型和属性(rwx 位)。
  unsigned short i_uid;		// 用户id（文件拥有者标识符）。
  unsigned long i_size;		// 文件大小（字节数）。
  unsigned long i_mtime;	// 修改时间（自1970.1.1:0 算起，秒）。
  unsigned char i_gid;		// 组id(文件拥有者所在的组)。
  unsigned char i_nlinks;	// 文件目录项链接数。
  unsigned short i_zone[9];	// 直接(0-6)、间接(7)或双重间接(8)逻辑块号。
/* these are in memory also */
  struct task_struct *i_wait;	// 等待该i 节点的进程。
  unsigned long i_atime;	// 最后访问时间。
  unsigned long i_ctime;	// i 节点自身修改时间。
  unsigned short i_dev;		// i 节点所在的设备号。
  unsigned short i_num;		// i 节点号。
  unsigned short i_count;	// i 节点被使用的次数，0 表示该i 节点空闲。
  unsigned char i_lock;		// 锁定标志。
  unsigned char i_dirt;		// 已修改(脏)标志。
  unsigned char i_pipe;		// 管道标志。
  unsigned char i_mount;	// 安装标志。
  unsigned char i_seek;		// 搜寻标志(lseek 时)。
  unsigned char i_update;	// 更新标志。
};

// 文件结构（用于在文件句柄与i 节点之间建立关系）
struct file
{
  unsigned short f_mode;	// 文件操作模式（RW 位）
  unsigned short f_flags;	// 文件打开和控制的标志。
  unsigned short f_count;	// 对应文件句柄（文件描述符）数。
  struct m_inode *f_inode;	// 指向对应i 节点。
  unsigned long f_pos;			// 文件位置（读写偏移值）。
};

// 内存中磁盘超级块结构。
struct super_block
{
  unsigned short s_ninodes;	// 节点数。
  unsigned short s_nzones;	// 逻辑块数。
  unsigned short s_imap_blocks;	// i 节点位图所占用的数据块数。
  unsigned short s_zmap_blocks;	// 逻辑块位图所占用的数据块数。
  unsigned short s_firstdatazone;	// 第一个数据逻辑块号。
  unsigned short s_log_zone_size;	// log(数据块数/逻辑块)。（以2 为底）。
  unsigned long s_max_size;	// 文件最大长度。
  unsigned short s_magic;	// 文件系统魔数。
/* These are only in memory */
  struct buffer_head *s_imap[8];	// i 节点位图缓冲块指针数组(占用8 块，可表示64M)。
  struct buffer_head *s_zmap[8];	// 逻辑块位图缓冲块指针数组（占用8 块）。
  unsigned short s_dev;		// 超级块所在的设备号。
  struct m_inode *s_isup;	// 被安装的文件系统根目录的i 节点。(isup-super i)
  struct m_inode *s_imount;	// 被安装到的i 节点。
  unsigned long s_time;		// 修改时间。
  struct task_struct *s_wait;	// 等待该超级块的进程。
  unsigned char s_lock;		// 被锁定标志。
  unsigned char s_rd_only;	// 只读标志。
  unsigned char s_dirt;		// 已修改(脏)标志。
};

// 磁盘上超级块结构。上面125-132 行完全一样。
struct d_super_block
{
  unsigned short s_ninodes;	// 节点数。
  unsigned short s_nzones;	// 逻辑块数。
  unsigned short s_imap_blocks;	// i 节点位图所占用的数据块数。
  unsigned short s_zmap_blocks;	// 逻辑块位图所占用的数据块数。
  unsigned short s_firstdatazone;	// 第一个数据逻辑块。
  unsigned short s_log_zone_size;	// log(数据块数/逻辑块)。（以2 为底）。
  unsigned long s_max_size;	// 文件最大长度。
  unsigned short s_magic;	// 文件系统魔数。
};

// 文件目录项结构。
struct dir_entry
{
  unsigned short inode;		// i 节点。
  char name[NAME_LEN];		// 文件名。
};
#include <devdrv.h>
int init_ext2();
int ext2_load(driver_args* args);

int ext2_touch(driver_args *args);
int ext2_mkdir(driver_args *args);
int ext2_find(driver_args* args);
int ext2_rm(driver_args *args);
int ext2_read(driver_args *args);
int ext2_write(driver_args* args);
