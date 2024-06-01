#include <ext2/types.h>
/*
 * Structure of the super block
 */
#define EXT2_N_BLOCKS 15
struct ext2_super_block {
	__le32	s_inodes_count;		/* Inodes count (inode数目)*/
	__le32	s_blocks_count;		/* Blocks count (块数目)*/
	__le32	s_r_blocks_count;	/* Reserved blocks count（已分配块的数目） */
	__le32	s_free_blocks_count;	/* Free blocks count （空闲块数目）*/
	__le32	s_free_inodes_count;	/* Free inodes count（空闲inode数目） */
	__le32	s_first_data_block;	/* First Data Block （第一个数据块）*/
	__le32	s_log_block_size;	/* Block size （块长度）*/
	__le32	s_log_frag_size;	/* Fragment size （碎片长度）*/
	__le32	s_blocks_per_group;	/* # Blocks per group （每个块组包含的块数）*/
	__le32	s_frags_per_group;	/* # Fragments per group （每个块包含的碎片）*/
	__le32	s_inodes_per_group;	/* # Inodes per group （每个块组的inode数目））*/
	__le32	s_mtime;		/* Mount time （装载时间）*/
	__le32	s_wtime;		/* Write time （写入时间）*/
	__le16	s_mnt_count;		/* Mount count （装载计数）*/
	__le16	s_max_mnt_count;	/* Maximal mount count （最大装载数）*/
	__le16	s_magic;		/* Magic signature （魔数，标记文件系统类型）*/
	__le16	s_state;		/* File system state （文件系统状态）*/
	__le16	s_errors;		/* Behaviour when detecting errors （检测到错误时的行为）*/
	__le16	s_minor_rev_level; 	/* minor revision level （副修订号）*/
	__le32	s_lastcheck;		/* time of last check （上一次检查的时间）*/
	__le32	s_checkinterval;	/* max. time between checks （两次检查允许间隔的最长时间）*/
	__le32	s_creator_os;		/* OS （创建文件系统的操作系统）*/
	__le32	s_rev_level;		/* Revision level （修订号）*/
	__le16	s_def_resuid;		/* Default uid for reserved blocks （能够使用的保留块的默认uid）*/
	__le16	s_def_resgid;		/* Default gid for reserved blocks （能够使用保留块的默认GID）*/
	/*
	 * These fields are for EXT2_DYNAMIC_REV superblocks only.
	 *
	 * Note: the difference between the compatible feature set and
	 * the incompatible feature set is that if there is a bit set
	 * in the incompatible feature set that the kernel doesn't
	 * know about, it should refuse to mount the filesystem.
	 * 
	 * e2fsck's requirements are more strict; if it doesn't know
	 * about a feature in either the compatible or incompatible
	 * feature set, it must abort and not try to meddle with
	 * things it doesn't understand...
	 */
	__le32	s_first_ino; 		/* First non-reserved inode （第一个非保留的inode）*/
	__le16   s_inode_size; 		/* size of inode structure (inode结构的长度)*/
	__le16	s_block_group_nr; 	/* block group # of this superblock （当前超级块所在的块组编号）*/
	__le32	s_feature_compat; 	/* compatible feature set 兼容特性集*/
	__le32	s_feature_incompat; 	/* incompatible feature set 不兼容特性集*/
	__le32	s_feature_ro_compat; 	/* readonly-compatible feature set 只读兼容特性集*/
	__u8	s_uuid[16];		/* 128-bit uuid for volume 卷的128位的uuid*/
	char	s_volume_name[16]; 	/* volume name 卷名*/
	char	s_last_mounted[64]; 	/* directory where last mounted 上次装载的目录*/
	__le32	s_algorithm_usage_bitmap; /* For compression 用于压缩*/
	/*
	 * Performance hints.  Directory preallocation should only
	 * happen if the EXT2_COMPAT_PREALLOC flag is on.
	 */
	__u8	s_prealloc_blocks;	/* Nr of blocks to try to preallocate（试图预分配的块数）*/
	__u8	s_prealloc_dir_blocks;	/* Nr to preallocate for dirs 试图为目录预分配的块数*/
	__u16	s_padding1;
	/*
	 * Journaling support valid if EXT3_FEATURE_COMPAT_HAS_JOURNAL set.
	 */
	__u8	s_journal_uuid[16];	/* uuid of journal superblock */
	__u32	s_journal_inum;		/* inode number of journal file */
	__u32	s_journal_dev;		/* device number of journal file */
	__u32	s_last_orphan;		/* start of list of inodes to delete */
	__u32	s_hash_seed[4];		/* HTREE hash seed */
	__u8	s_def_hash_version;	/* Default hash version to use */
	__u8	s_reserved_char_pad;
	__u16	s_reserved_word_pad;
	__le32	s_default_mount_opts;
 	__le32	s_first_meta_bg; 	/* First metablock block group */
	__u32	s_reserved[190];	/* Padding to the end of the block */
};

/*
 * Structure of a blocks group descriptor
 */
struct ext2_group_desc
{
	__le32	bg_block_bitmap;		/* Blocks bitmap block (块位图块)*/
	__le32	bg_inode_bitmap;		/* Inodes bitmap block (inode位图块)*/
	__le32	bg_inode_table;		/* Inodes table block (inode表块)*/
	__le16	bg_free_blocks_count;	/* Free blocks count (空闲块数目)*/
	__le16	bg_free_inodes_count;	/* Free inodes count (空闲inode数目)*/
	__le16	bg_used_dirs_count;	/* Directories count (目录数目)*/
	__le16	bg_pad; 			
	__le32	bg_reserved[3];
};

/*
 * Structure of an inode on the disk
 */
struct ext2_inode {
	__le16	i_mode;		/* File mode （文件模式）*/
	__le16	i_uid;		/* Low 16 bits of Owner Uid （所有者UID的低16位）*/
	__le32	i_size;		/* Size in bytes （长度，按字节计算）*/
	__le32	i_atime;	/* Access time （访问时间）*/
	__le32	i_ctime;	/* Creation time （创建时间）*/
	__le32	i_mtime;	/* Modification time （修改时间）*/
	__le32	i_dtime;	/* Deletion Time （删除时间）*/
	__le16	i_gid;		/* Low 16 bits of Group Id （组ID的低16位）*/
	__le16	i_links_count;	/* Links count （链接计数）*/
	__le32	i_blocks;	/* Blocks count （块数据）*/
	__le32	i_flags;	/* File flags （文件标志）*/
	union {
		struct {
			__le32  l_i_reserved1;
		} linux1;
		struct {
			__le32  h_i_translator;
		} hurd1;
		struct {
			__le32  m_i_reserved1;
		} masix1;
	} osd1;				/* OS dependent 1 */
	__le32	i_block[EXT2_N_BLOCKS];/* Pointers to blocks 块指针*/
	__le32	i_generation;	/* File version (for NFS) （文件版本，用于NFS）*/
	__le32	i_file_acl;	/* File ACL */
	__le32	i_dir_acl;	/* Directory ACL */
	__le32	i_faddr;	/* Fragment address 碎片地址*/
	union {
		struct {
			__u8	l_i_frag;	/* Fragment number */
			__u8	l_i_fsize;	/* Fragment size */
			__u16	i_pad1;
			__le16	l_i_uid_high;	/* these 2 fields    */
			__le16	l_i_gid_high;	/* were reserved2[0] */
			__u32	l_i_reserved2;
		} linux2;
		struct {
			__u8	h_i_frag;	/* Fragment number */
			__u8	h_i_fsize;	/* Fragment size */
			__le16	h_i_mode_high;
			__le16	h_i_uid_high;
			__le16	h_i_gid_high;
			__le32	h_i_author;
		} hurd2;
		struct {
			__u8	m_i_frag;	/* Fragment number */
			__u8	m_i_fsize;	/* Fragment size */
			__u16	m_pad1;
			__u32	m_i_reserved2[2];
		} masix2;
	} osd2;				/* OS dependent 2 */
};
/*
 * The new version of the directory entry.  Since EXT2 structures are
 * stored in intel byte order, and the name_len field could never be
 * bigger than 255 chars, it's safe to reclaim the extra byte for the
 * file_type field.
 */
struct ext2_dir_entry_2 {
	__le32	inode;			/* Inode number (inode编号)*/
	__le16	rec_len;		/* Directory entry length */
	__u8	name_len;		/* Name length */
	__u8	file_type;
	char	name[];			/* File name, up to EXT2_NAME_LEN */
};
/*
 * Ext2 directory file types.  Only the low 3 bits are used.  The
 * other bits are reserved for now.
 */
enum {
	EXT2_FT_UNKNOWN		= 0,
	EXT2_FT_REG_FILE	= 1,
	EXT2_FT_DIR		= 2, //普通文件
	EXT2_FT_CHRDEV		= 3,//字符特殊文件和快特殊文件
	EXT2_FT_BLKDEV		= 4,
	EXT2_FT_FIFO		= 5,//命名管道
	EXT2_FT_SOCK		= 6,//套接字
	EXT2_FT_SYMLINK		= 7,
	EXT2_FT_MAX
};

#include <devdrv.h>
int ext2_load(driver_args* args);

int ext2_touch(driver_args *args);
int ext2_mkdir(driver_args *args);
int ext2_find(driver_args* args);
int ext2_rm(driver_args *args);
int ext2_read(driver_args *args);
int ext2_write(driver_args* args);
