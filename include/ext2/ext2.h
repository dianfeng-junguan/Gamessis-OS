// #include <ext2/types.h>
// /*
//  * Structure of the super block
//  */
// #define EXT2_N_BLOCKS 15
// struct ext2_super_block {
// 	__le32	s_inodes_count;		/* Inodes count (inode数目)*/
// 	__le32	s_blocks_count;		/* Blocks count (块数目)*/
// 	__le32	s_r_blocks_count;	/* Reserved blocks count（已分配块的数目） */
// 	__le32	s_free_blocks_count;	/* Free blocks count （空闲块数目）*/
// 	__le32	s_free_inodes_count;	/* Free inodes count（空闲inode数目） */
// 	__le32	s_first_data_block;	/* First Data Block （第一个数据块）*/
// 	__le32	s_log_block_size;	/* Block size （块长度）*/
// 	__le32	s_log_frag_size;	/* Fragment size （碎片长度）*/
// 	__le32	s_blocks_per_group;	/* # Blocks per group （每个块组包含的块数）*/
// 	__le32	s_frags_per_group;	/* # Fragments per group （每个块包含的碎片）*/
// 	__le32	s_inodes_per_group;	/* # Inodes per group （每个块组的inode数目））*/
// 	__le32	s_mtime;		/* Mount time （装载时间）*/
// 	__le32	s_wtime;		/* Write time （写入时间）*/
// 	__le16	s_mnt_count;		/* Mount count （装载计数）*/
// 	__le16	s_max_mnt_count;	/* Maximal mount count （最大装载数）*/
// 	__le16	s_magic;		/* Magic signature （魔数，标记文件系统类型）*/
// 	__le16	s_state;		/* File system state （文件系统状态）*/
// 	__le16	s_errors;		/* Behaviour when detecting errors （检测到错误时的行为）*/
// 	__le16	s_minor_rev_level; 	/* minor revision level （副修订号）*/
// 	__le32	s_lastcheck;		/* time of last check （上一次检查的时间）*/
// 	__le32	s_checkinterval;	/* max. time between checks （两次检查允许间隔的最长时间）*/
// 	__le32	s_creator_os;		/* OS （创建文件系统的操作系统）*/
// 	__le32	s_rev_level;		/* Revision level （修订号）*/
// 	__le16	s_def_resuid;		/* Default uid for reserved blocks （能够使用的保留块的默认uid）*/
// 	__le16	s_def_resgid;		/* Default gid for reserved blocks （能够使用保留块的默认GID）*/
// 	/*
// 	 * These fields are for EXT2_DYNAMIC_REV superblocks only.
// 	 *
// 	 * Note: the difference between the compatible feature set and
// 	 * the incompatible feature set is that if there is a bit set
// 	 * in the incompatible feature set that the kernel doesn't
// 	 * know about, it should refuse to mount the filesystem.
// 	 * 
// 	 * e2fsck's requirements are more strict; if it doesn't know
// 	 * about a feature in either the compatible or incompatible
// 	 * feature set, it must abort and not try to meddle with
// 	 * things it doesn't understand...
// 	 */
// 	__le32	s_first_ino; 		/* First non-reserved inode （第一个非保留的inode）*/
// 	__le16   s_inode_size; 		/* size of inode structure (inode结构的长度)*/
// 	__le16	s_block_group_nr; 	/* block group # of this superblock （当前超级块所在的块组编号）*/
// 	__le32	s_feature_compat; 	/* compatible feature set 兼容特性集*/
// 	__le32	s_feature_incompat; 	/* incompatible feature set 不兼容特性集*/
// 	__le32	s_feature_ro_compat; 	/* readonly-compatible feature set 只读兼容特性集*/
// 	__u8	s_uuid[16];		/* 128-bit uuid for volume 卷的128位的uuid*/
// 	char	s_volume_name[16]; 	/* volume name 卷名*/
// 	char	s_last_mounted[64]; 	/* directory where last mounted 上次装载的目录*/
// 	__le32	s_algorithm_usage_bitmap; /* For compression 用于压缩*/
// 	/*
// 	 * Performance hints.  Directory preallocation should only
// 	 * happen if the EXT2_COMPAT_PREALLOC flag is on.
// 	 */
// 	__u8	s_prealloc_blocks;	/* Nr of blocks to try to preallocate（试图预分配的块数）*/
// 	__u8	s_prealloc_dir_blocks;	/* Nr to preallocate for dirs 试图为目录预分配的块数*/
// 	__u16	s_padding1;
// 	/*
// 	 * Journaling support valid if EXT3_FEATURE_COMPAT_HAS_JOURNAL set.
// 	 */
// 	__u8	s_journal_uuid[16];	/* uuid of journal superblock */
// 	__u32	s_journal_inum;		/* inode number of journal file */
// 	__u32	s_journal_dev;		/* device number of journal file */
// 	__u32	s_last_orphan;		/* start of list of inodes to delete */
// 	__u32	s_hash_seed[4];		/* HTREE hash seed */
// 	__u8	s_def_hash_version;	/* Default hash version to use */
// 	__u8	s_reserved_char_pad;
// 	__u16	s_reserved_word_pad;
// 	__le32	s_default_mount_opts;
//  	__le32	s_first_meta_bg; 	/* First metablock block group */
// 	__u32	s_reserved[190];	/* Padding to the end of the block */
// };

// /*
//  * Structure of a blocks group descriptor
//  */
// struct ext2_group_desc
// {
// 	__le32	bg_block_bitmap;		/* Blocks bitmap block (块位图块)*/
// 	__le32	bg_inode_bitmap;		/* Inodes bitmap block (inode位图块)*/
// 	__le32	bg_inode_table;		/* Inodes table block (inode表块)*/
// 	__le16	bg_free_blocks_count;	/* Free blocks count (空闲块数目)*/
// 	__le16	bg_free_inodes_count;	/* Free inodes count (空闲inode数目)*/
// 	__le16	bg_used_dirs_count;	/* Directories count (目录数目)*/
// 	__le16	bg_pad; 			
// 	__le32	bg_reserved[3];
// };

// /*
//  * Structure of an inode on the disk
//  */
// struct ext2_inode {
// 	__le16	i_mode;		/* File mode （文件模式）*/
// 	__le16	i_uid;		/* Low 16 bits of Owner Uid （所有者UID的低16位）*/
// 	__le32	i_size;		/* Size in bytes （长度，按字节计算）*/
// 	__le32	i_atime;	/* Access time （访问时间）*/
// 	__le32	i_ctime;	/* Creation time （创建时间）*/
// 	__le32	i_mtime;	/* Modification time （修改时间）*/
// 	__le32	i_dtime;	/* Deletion Time （删除时间）*/
// 	__le16	i_gid;		/* Low 16 bits of Group Id （组ID的低16位）*/
// 	__le16	i_links_count;	/* Links count （链接计数）*/
// 	__le32	i_blocks;	/* Blocks count （块数据）*/
// 	__le32	i_flags;	/* File flags （文件标志）*/
// 	union {
// 		struct {
// 			__le32  l_i_reserved1;
// 		} linux1;
// 		struct {
// 			__le32  h_i_translator;
// 		} hurd1;
// 		struct {
// 			__le32  m_i_reserved1;
// 		} masix1;
// 	} osd1;				/* OS dependent 1 */
// 	__le32	i_block[EXT2_N_BLOCKS];/* Pointers to blocks 块指针*/
// 	__le32	i_generation;	/* File version (for NFS) （文件版本，用于NFS）*/
// 	__le32	i_file_acl;	/* File ACL */
// 	__le32	i_dir_acl;	/* Directory ACL */
// 	__le32	i_faddr;	/* Fragment address 碎片地址*/
// 	union {
// 		struct {
// 			__u8	l_i_frag;	/* Fragment number */
// 			__u8	l_i_fsize;	/* Fragment size */
// 			__u16	i_pad1;
// 			__le16	l_i_uid_high;	/* these 2 fields    */
// 			__le16	l_i_gid_high;	/* were reserved2[0] */
// 			__u32	l_i_reserved2;
// 		} linux2;
// 		struct {
// 			__u8	h_i_frag;	/* Fragment number */
// 			__u8	h_i_fsize;	/* Fragment size */
// 			__le16	h_i_mode_high;
// 			__le16	h_i_uid_high;
// 			__le16	h_i_gid_high;
// 			__le32	h_i_author;
// 		} hurd2;
// 		struct {
// 			__u8	m_i_frag;	/* Fragment number */
// 			__u8	m_i_fsize;	/* Fragment size */
// 			__u16	m_pad1;
// 			__u32	m_i_reserved2[2];
// 		} masix2;
// 	} osd2;				/* OS dependent 2 */
// };
// /*
//  * The new version of the directory entry.  Since EXT2 structures are
//  * stored in intel byte order, and the name_len field could never be
//  * bigger than 255 chars, it's safe to reclaim the extra byte for the
//  * file_type field.
//  */
// struct ext2_dir_entry_2 {
// 	__le32	inode;			/* Inode number (inode编号)*/
// 	__le16	rec_len;		/* Directory entry length */
// 	__u8	name_len;		/* Name length */
// 	__u8	file_type;
// 	char	name[];			/* File name, up to EXT2_NAME_LEN */
// };
// /*
//  * Ext2 directory file types.  Only the low 3 bits are used.  The
//  * other bits are reserved for now.
//  */
// enum {
// 	EXT2_FT_UNKNOWN		= 0,
// 	EXT2_FT_REG_FILE	= 1,
// 	EXT2_FT_DIR		= 2, //普通文件
// 	EXT2_FT_CHRDEV		= 3,//字符特殊文件和快特殊文件
// 	EXT2_FT_BLKDEV		= 4,
// 	EXT2_FT_FIFO		= 5,//命名管道
// 	EXT2_FT_SOCK		= 6,//套接字
// 	EXT2_FT_SYMLINK		= 7,
// 	EXT2_FT_MAX
// };

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
int ext2_load(driver_args* args);

int ext2_touch(driver_args *args);
int ext2_mkdir(driver_args *args);
int ext2_find(driver_args* args);
int ext2_rm(driver_args *args);
int ext2_read(driver_args *args);
int ext2_write(driver_args* args);
