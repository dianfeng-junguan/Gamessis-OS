// Created by Oniar_Pie on 2024/11/15.
//

#ifndef GMS_RAMFS_H
#define GMS_RAMFS_H
#include "vfs.h"

void init_ramfs();
long open_ramfs(struct index_node * inode,struct file * filp);
long close_ramfs(struct index_node * inode,struct file * filp);
long read_ramfs(struct file * filp,char * buf,unsigned long count,long * position);
long write_ramfs(struct file * filp,char * buf,unsigned long count,long * position);
long ioctl_ramfs(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg);

long create_inode_ramfs(struct index_node * inode,struct dir_entry * dentry,int mode);
struct dir_entry* lookup_inode_ramfs(struct index_node * parent_inode,struct dir_entry * dest_dentry);
#endif //GMS_RAMFS_H
