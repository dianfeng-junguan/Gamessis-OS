//
// Created by Oniar_Pie on 2024/11/15.
//
#include <ramdisk.h>
#include "ramfs.h"
#include "devman.h"
#include "driverman.h"
#include "memory.h"
#include "log.h"
#include "mem.h"

/*
 * 这部分主要是测试用，之后也可能用上（如果之后设计了initrd之类的话）
这部分就不要求调用块设备借口了，这个纯粹是快速测试用的，之后会用fat之类的正规文件系统读取ramdisk
 * */
// extern char _binary_bin_test_elf_start[],_binary_bin_test_elf_end[];
struct super_block            ramfs_sb;
struct file_operations        ramfs_fops = {.open  = open_ramfs,
                                     .close = close_ramfs,
                                     .read  = read_ramfs,
                                     .write = write_ramfs,
                                     .ioctl = ioctl_ramfs};
struct super_block_operations ramfs_sops = {

};
struct index_node_operations ramfs_iops = {.lookup = lookup_inode_ramfs,
                                           .create = create_inode_ramfs};
struct index_node*           test;
void                         init_ramfs()
{
    //挂载新文件系统到/mnt,设备为/dev/ram

    ramfs_sb.sb_ops = &ramfs_fops;
    ramfs_sb.root   = dmnt;
    // ramfs_sb.p_dev  = &bd_ramdisk;
    ramfs_sb.dev = drv_ramdisk;
    //解压img里面的test程序
    // memcpy(ramdisk_base, _binary_bin_test_elf_start, (char*)_binary_bin_test_elf_end -
    // (char*)_binary_bin_test_elf_start); test= (struct index_node *) kmalloc(0,PAGE_4K_SIZE);
    // test->f_ops=&ramfs_fops;
    // test->file_size= (char*)_binary_bin_test_elf_end - (char*)_binary_bin_test_elf_start;
    // test->sb=&ramfs_sb;
    // test->attribute=FS_ATTR_FILE;
    // test->inode_ops=&ramfs_iops;
    //设置一下dmnt的inode的操作，查找的时候会用到
    // dmnt->dir_inode->inode_ops=&ramfs_iops;
}

long create_inode_ramfs(struct index_node* inode, struct dir_entry* dentry, int mode) {}
struct dir_entry* lookup_inode_ramfs(struct index_node* parent_inode, struct dir_entry* dest_dentry)
{
    list_init(&dest_dentry->subdirs_list);
    list_init(&dest_dentry->child_node);
    dest_dentry->dir_inode       = test;
    dest_dentry->child_node.data = dest_dentry;
    return dest_dentry;
}
long open_ramfs(struct index_node* inode, struct file* filp)
{
    filp->f_ops    = inode->f_ops;
    filp->position = 0;
    return 1;
}

long close_ramfs(struct index_node* inode, struct file* filp)
{
    return 0;
}
//注意一下:position是指针
long read_ramfs(struct file* filp, char* buf, unsigned long count, long* position)
{
    // blkdev_read(filp->dentry->dir_inode->dev, *position, count, buf);
    struct
    {
        int   lba;
        int   count;
        char* buf;
    } ioctlarg;
    ioctlarg.lba   = *position / 512;
    ioctlarg.count = (count + 511) / 512;
    char* tmpbuf   = kmalloc(0, ioctlarg.count * 512);
    ioctlarg.buf   = tmpbuf;
    drv_ioctl(drv_ramdisk, DRIVER_CMD_READ, 1, &ioctlarg);
    memcpy(buf, tmpbuf + (*position % 512), count);
    kfree(tmpbuf);
    *position += count;
    ioctlarg.buf = buf;
    /* int len= (char*)_binary_bin_test_elf_end - (char*)_binary_bin_test_elf_start - *position;
    if(len>count)len=count;
    for(int i=0;i<len;i++){
        buf[i]=_binary_bin_test_elf_start[i + *position];
    }
    *position+=len; */
    return 0;
}
long write_ramfs(struct file* filp, char* buf, unsigned long count, long* position)
{
    return 0;
}
long ioctl_ramfs(struct index_node* inode, struct file* filp, unsigned long cmd, unsigned long arg)
{
    return 0;
}