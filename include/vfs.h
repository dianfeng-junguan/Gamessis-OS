//
// Created by Oniar_Pie on 2024/10/5.
//

#ifndef GMS_VFS_H
#define GMS_VFS_H
#include "c/stddef.h"
#define MAX_MOUNTPOINTS 24
// #include <blk_dev.h>
struct List
{
    struct List * prev;
    void* data;
    struct List * next;
};

__attribute__((always_inline)) inline void list_init(struct List * list)
{
    list->prev = NULL;
    list->next = NULL;
}

__attribute__((always_inline)) inline void list_add_to_behind(struct List * entry,struct List * new)	////add to entry behind
{
    new->next = entry->next;
    new->prev = entry;
    if(new->next)
        new->next->prev = new;
    entry->next = new;
}
__attribute__((always_inline)) inline void list_add(struct List * entry,struct List * new)	////add to the tail of the link
{
    struct List* p=entry;
    for(;p->next&&p->next!=p;p=p->next){
        if(p->data==new->data)
            return;
    }
    list_add_to_behind(p,new);
}
__attribute__((always_inline)) inline void list_drop(struct List * entry)
{
    //从链表中删除
    if(entry->prev)
        entry->prev->next=entry->next;
    if(entry->next)
        entry->next->prev=entry->prev;
}

struct Disk_Partition_Table_Entry
{
    unsigned char flags;
    unsigned char start_head;
    unsigned short  start_sector	:6,	//0~5
    start_cylinder	:10;	//6~15
    unsigned char type;
    unsigned char end_head;
    unsigned short  end_sector	:6,	//0~5
    end_cylinder	:10;	//6~15
    unsigned int start_LBA;
    unsigned int sectors_limit;
}__attribute__((packed));

struct Disk_Partition_Table
{
    unsigned char BS_Reserved[446];
    struct Disk_Partition_Table_Entry DPTE[4];
    unsigned short BS_TrailSig;
}__attribute__((packed));

struct file_system_type
{
    char * name;
    int fs_flags;
    struct super_block * (*read_superblock)(struct Disk_Partition_Table_Entry * DPTE,void * buf);
    struct file_system_type * next;
};
typedef struct _mount_point
{
    struct super_block* sb;//文件系统超级块
    struct dir_entry* dmount_point;//被挂载到的dentry。
}mount_point;

/// @brief 将文件系统实例挂载到文件夹上。此举将会创建mount point 数据结构。
/// @param d_to_mount 将要挂载到的文件夹
/// @param fs 被挂载的文件系统超级块
int mount_fs_on(struct dir_entry *d_to_mount,struct super_block* fs);
/// @brief 卸载挂载点。
/// @param d_mp 被挂载的目录。
/// @return 错误码，成功为1
int umount_fs(struct dir_entry* d_mp);
struct super_block * mount_fs(char * name,struct Disk_Partition_Table_Entry * DPTE,void * buf);
unsigned long register_filesystem(struct file_system_type * fs);
unsigned long unregister_filesystem(struct file_system_type * fs);

struct super_block_operations;
struct index_node_operations;
struct dir_entry_operations;
struct file_operations;

struct super_block
{
    struct dir_entry * root;

    struct super_block_operations * sb_ops;

    unsigned short dev;//设备号
    
    struct blk_dev* p_dev;
    void * private_sb_info;
};

struct index_node
{
    unsigned long file_size;
    unsigned long blocks;
    unsigned long attribute;
    unsigned short dev;
    int link;   //被dir entry引用的次数
    struct super_block * sb;

    struct file_operations * f_ops;
    struct index_node_operations * inode_ops;

    void * private_index_info;
};

#define FS_ATTR_FILE	(1UL << 0)
#define FS_ATTR_DIR		(1UL << 1)
#define	FS_ATTR_DEVICE	(1UL << 2)

struct dir_entry
{
    char * name;
    int name_length;
    struct List child_node;
    struct List subdirs_list;

    struct index_node * dir_inode;
    struct dir_entry * parent;
    char link;//标记被file引用的次数，非0不能被释放，一般用于打开文件的时候

    mount_point *mount_point;

    struct dir_entry_operations * dir_ops;
};

struct file
{
    long position;
    unsigned long mode;

    struct dir_entry * dentry;

    struct file_operations * f_ops;

    void * private_data;
};

struct super_block_operations
{
    void(*write_superblock)(struct super_block * sb);
    void(*put_superblock)(struct super_block * sb);

    void(*write_inode)(struct index_node * inode);
};

struct index_node_operations
{
    long (*create)(struct index_node * inode,struct dir_entry * dentry,int mode);
    struct dir_entry* (*lookup)(struct index_node * parent_inode,struct dir_entry * dest_dentry);
    long (*mkdir)(struct index_node * inode,struct dir_entry * dentry,int mode);
    long (*rmdir)(struct index_node * inode,struct dir_entry * dentry);
    long (*rename)(struct index_node * old_inode,struct dir_entry * old_dentry,struct index_node * new_inode,struct dir_entry * new_dentry);
    long (*getattr)(struct dir_entry * dentry,unsigned long * attr);
    long (*setattr)(struct dir_entry * dentry,unsigned long * attr);
};

struct dir_entry_operations
{
    long (*compare)(struct dir_entry * parent_dentry,char * source_filename,char * destination_filename);
    long (*hash)(struct dir_entry * dentry,char * filename);
    long (*release)(struct dir_entry * dentry);
    long (*iput)(struct dir_entry * dentry,struct index_node * inode);
};

typedef int (*filldir_t)(void *buf,char *name, long namelen,long type,long offset);

struct file_operations
{
    long (*open)(struct index_node * inode,struct file * filp);
    long (*close)(struct index_node * inode,struct file * filp);
    long (*read)(struct file * filp,char * buf,unsigned long count,long * position);
    long (*write)(struct file * filp,char * buf,unsigned long count,long * position);
    long (*lseek)(struct file * filp,long offset,long origin);
    long (*ioctl)(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg);

    long (*readdir)(struct file * filp,void * dirent,filldir_t filler);
};
//寻找文件，返回目录项。
//flag:是否返回文件的上级目录。
struct dir_entry * path_walk(char * name,unsigned long flags);
#define FILE_TYPE_REGULAR 1
#define FILE_TYPE_DIRECTORY 2
#define FILE_TYPE_BLKDEV 3
#define FILE_TYPE_CHRDEV 4
#define FILE_TYPE_FIFO 5
#define FILE_PERM_R 1
#define FILE_PERM_W 2
#define FILE_PERM_X 4
//创建一个文件，挂到目录树中。文件只会在内存中创建，需要后续iput才能写入介质。
//permission即权限，此部分尚未完成。
struct dir_entry* create_node(char* pathname,int type,int permission,unsigned short dev);
int fill_dentry(void *buf,char *name, long namelen,long type,long offset);
/// @brief 释放dir entry。调用前应当检查是否有挂载点和子目录项。
/// @param d 
void drelse(struct dir_entry* d);
extern struct super_block * root_sb;
/// @brief 标记这个dentry刚被使用过。
/// @param d 
void mark_use(struct dir_entry* d);
//挂载临时根文件系统，用于初始化/dev等文件夹。
void init_rootfs();

extern struct dir_entry* droot;
extern int ROOT_DEV;
#endif //GMS_VFS_H
