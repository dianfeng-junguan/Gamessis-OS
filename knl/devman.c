#include "devman.h"

#include "driverman.h"
#include "ioctlarg.h"
#include "memman.h"
#include "ramdisk.h"
#include "syscall.h"
#include "memory.h"
#include "str.h"
#include "typename.h"
#include "fcntl.h"
#include <disk.h>
#include <tty.h>
#include "proc.h"
#include "mem.h"
#include "framebuffer.h"
#include "log.h"
#include <vfs.h>
#include "sys/stat.h"
#include "errno.h"

static int rhead = 0, rtail = 0;
static int dev_dfd = -1;
device_t*  dev_list;
static int devd_fd = -1;

void make_devf(char* name, int dev);
/**
    @brief 创建设备文件并注册一个设备。一般由create_node()调用。
    @param name 设备文件名
    @param type 设备类型
    @param flag 设备标志
    @param drv 驱动程序号
    @return 返回设备号，<0失败
*/
int create_device(char* name, int type, int flag, int drv)
{
    int dev = -1;
    if ((dev = reg_device(name, type, drv, flag)) < 0) {
        return -EFAULT;
    }
    //创建设备文件
    make_devf(name, dev);
    return dev;
}
struct dir_entry* devfs_lookup(struct index_node* parent_inode, struct dir_entry* dest_dentry)
{
    //查看文件名
    struct List*      lp = ddev->mount_point->sb->root->subdirs_list.next;
    struct dir_entry* d  = 0;
    if (lp)
        d = (void*)lp - ((void*)&d->child_node - (void*)d);
    while (d) {
        if (memcmp(d->name, dest_dentry->name, dest_dentry->name_length) == 0) {
            break;
        }
        d = list_next(d, &d->child_node);
    }
    return d;
}

/**
 * @brief 创建文件，传入的parent_inode和dentry已经填写好信息,dentry需要分配inode
 * @param parent_inode 父目录节点
 * @param dentry 待创建的文件节点
 * @param mode 文件权限
 * @return 0 成功，<0失败
 */
long devfs_create(struct index_node* inode, struct dir_entry* dentry, int mode)
{
    printfk("directly creating files under /dev is not allowed, if you wanna create a device, "
            "use create_node()\n");
    return -EPERM;
}
struct dir_entry *      ddev = NULL, *dmnt, *dconsole, *dhd0, *dtty, *dramdisk;
struct file             ftty;
struct file_system_type fs_devfs = {
    .name = "devfs", .next = 0, .read_superblock = devfs_read_superblock};

int dev_ramdisk = 0;
int reg_default_devices()
{

    // console-framebuffer.c
    reg_device("console", S_IFCHR, drv_framebuffer, drv_framebuffer);
    // hd0-disk.c
    extern int drv_hd;
    reg_device("hd0", S_IFBLK, drv_hd, drv_hd);
    // tty-tty.c
    reg_device("tty", S_IFCHR, drv_tty, drv_tty);
    //初始化一下

    // ramdisk- ramdisk.c
    dev_ramdisk = reg_device("ram", S_IFBLK, drv_ramdisk, drv_ramdisk);
    ROOT_DEV    = dev_ramdisk;
    return 0;
}
/**
    @brief 创建默认设备文件，在根文件系统加载完成后调用。
*/
int make_default_devfiles()
{
    // console-framebuffer.c
    make_devf("console", 0);
    // hd0-disk.c
    extern int drv_hd;
    make_devf("hd0", 1);
    // tty-tty.c
    make_devf("tty", 2);
    //初始化一下

    // ramdisk- ramdisk.c
    make_devf("ram", 3);
}
int init_devman()
{

    dev_list = kmalloc(MAX_DEVICES * sizeof(device_t), NO_ALIGN);
    memset(dev_list, 0, MAX_DEVICES * sizeof(device_t));
    return 0;
}
int init_devfs()
{

    register_filesystem(&fs_devfs);
    struct super_block* sb_devfs = mount_fs("devfs", 0, 0);
    ddev                         = path_walk("/dev", 0);
    mount_fs_on(ddev, sb_devfs);

    struct dir_entry* rt_devfs = sb_devfs->root;


    //创建几个设备文件
    // console-framebuffer.c
    // create_node("/dev/console", S_IFCHR, 0x10000);
    // // hd0-disk.c
    // extern int drv_hd;
    // create_node("/dev/hd0", S_IFBLK, drv_hd << 4);
    // // tty-tty.c
    // create_node("/dev/tty", S_IFCHR, drv_tty);
    // //初始化一下

    // // ramdisk- ramdisk.c
    // create_node("/dev/ram", S_IFBLK, drv_ramdisk << 4);
    return 0;
}
//
long open_dev(struct index_node* inode, struct file* filp)
{
    filp->f_ops = inode->f_ops;
    if (inode->attribute == FS_ATTR_DIR) {
        //文件夹到此为止
        return 1;
    }
    drvioctlarg_open ioctlarg = {
        .dev = inode->dev,
    };
    return drv_ioctl(dev_list[inode->dev].drv, DRIVER_CMD_OPEN, 1, &ioctlarg);
}
long close_dev(struct index_node* inode, struct file* filp)
{
    int dev = inode->dev;
    if (dev < 0 || dev >= MAX_DEVICES) {
        return -EINVAL;
    }
    else if (!dev_list[dev].flag) {
        return -ENODEV;
    }
    else if (dev_list[dev].stat != DEV_STAT_AVAILABLE) {
        return -EBUSY;
    }
    if (inode->attribute == FS_ATTR_DIR) {
        //文件夹到此为止
        return 1;
    }
    dev_list[dev].link--;
    drvioctlarg_close ioctlarg = {
        .dev = dev,
    };
    return drv_ioctl(dev_list[dev].drv, DRIVER_CMD_CLOSE, 1, &ioctlarg);
}
long read_dev(struct file* filp, char* buf, unsigned long count, long* position)
{
    int dev = filp->dentry->dir_inode->dev;
    if (dev < 0 || dev >= MAX_DEVICES) {
        return -EINVAL;
    }
    else if (!dev_list[dev].flag) {
        return -ENODEV;
    }
    else if (dev_list[dev].stat != DEV_STAT_AVAILABLE) {
        return -EBUSY;
    }
    int              drv      = dev_list[dev].drv;
    drvioctlarg_read ioctlarg = {
        .position = *position,
        .count    = count,
        .buf      = buf,
        .dev      = dev,
    };
    return drv_ioctl(drv, DRIVER_CMD_READ, 1, &ioctlarg);
}
long write_dev(struct file* filp, char* buf, unsigned long count, long* position)
{
    int dev = filp->dentry->dir_inode->dev;
    if (dev < 0 || dev >= MAX_DEVICES) {
        return -EINVAL;
    }
    else if (!dev_list[dev].flag) {
        return -ENODEV;
    }
    else if (dev_list[dev].stat != DEV_STAT_AVAILABLE) {
        return -EBUSY;
    }
    int               drv      = dev_list[dev].drv;
    drvioctlarg_write ioctlarg = {
        .position = *position,
        .count    = count,
        .buf      = buf,
        .dev      = dev,
    };
    return drv_ioctl(drv, DRIVER_CMD_WRITE, 1, &ioctlarg);
}
long ioctl_dev(struct index_node* inode, struct file* filp, unsigned long cmd, unsigned long arg)
{
    int dev = inode->dev;
    if (dev < 0 || dev >= MAX_DEVICES) {
        return -EINVAL;
    }
    else if (!dev_list[dev].flag) {
        return -ENODEV;
    }
    else if (dev_list[dev].stat != DEV_STAT_AVAILABLE) {
        return -EBUSY;
    }
    int drv = dev_list[dev].drv;
    return drv_ioctl(drv, cmd, 1, arg);
}
int dev_ioctl(int dev, int command, int block, unsigned long long arg)
{
    if (dev < 0 || dev >= MAX_DEVICES) {
        return -EINVAL;
    }
    device_t* devp = dev_list + dev;
    if (!devp->flag) {
        return -ENODEV;
    }
    if (devp->stat != DEV_STAT_AVAILABLE) {
        return -EBUSY;
    }
    int drv = devp->drv;
    return drv_ioctl(drv, command, block, arg);
}
int reg_device(char* name, int type, int drv, int flag)
{
    if (strlenk(name) >= RECOMMENDED_MAXSTRLEN) {
        return -ENAMETOOLONG;
    }
    //放入数组
    int i = 0;
    for (; i < MAX_DEVICES; i++) {
        if (!dev_list[i].flag) {
            dev_list[i].drv  = drv;
            dev_list[i].name = kmalloc(strlenk(name), NO_ALIGN);
            strcpyk(dev_list[i].name, name);
            dev_list[i].flag = 1;
            dev_list[i].type = type;
            dev_list[i].stat = DEV_STAT_AVAILABLE;
            return i;
        }
    }

    return -ENOMEM;
}
int unreg_device(int dev)
{
    if (dev < 0 || dev >= MAX_DEVICES) {
        return -EINVAL;
    }
    dev_list[dev].flag = 0;
    return 0;
}
long devfs_rmdir(struct index_node* parent_inode, struct dir_entry* dest_dentry)
{
    // 查找文件
    struct List*      lp = dest_dentry->parent->subdirs_list.next;
    struct dir_entry* d  = 0;
    if (lp)
        d = (void*)lp - ((void*)&d->child_node - (void*)d);
    while (d) {
        if (strcmpk(dest_dentry->name, d->name) == 0) {
            int drv = dev_list[d->dir_inode->dev].drv;
            if (drv_ioctl(drv, DRIVER_CMD_RM, 1, 0) < 0 || unreg_device(d->dir_inode->dev))
                return -1;
            drelse(d);
            return 0;
        }
        d = list_next(d, &d->child_node);
    }
    return -1;
}
long devfs_mkdir(struct index_node* parent_inode, struct dir_entry* dest_dentry, int mode)
{
    comprintf("mkdir under devfs not supported\n");
    return -EPERM;
}
long devfs_rename(struct index_node* old_inode, struct dir_entry* old_dentry,
                  struct index_node* new_inode, struct dir_entry* new_dentry)
{
    comprintf("rename under devfs not supported\n");
    return -EPERM;
}
long devfs_getattr(struct dir_entry* dentry, unsigned long* attr)
{
    *attr = dentry->dir_inode->attribute;
    return 0;
}
long devfs_setattr(struct dir_entry* dentry, unsigned long* attr)
{
    comprintf("attributes of devices cannot be modified.\n");
    return -EPERM;
}
long devfs_compare(struct dir_entry* parent_dentry, char* source_filename,
                   char* destination_filename)
{}
long devfs_hash(struct dir_entry* dentry, char* filename) {}
long devfs_release(struct dir_entry* dentry) {}
long devfs_iput(struct dir_entry* dentry, struct index_node* inode) {}

void devfs_write_superblock(struct super_block* sb) {}
void devfs_put_superblock(struct super_block* sb) {}
void devfs_write_inode(struct index_node* inode) {}

struct file_operations devfs_fops = {
    .open    = open_dev,
    .close   = close_dev,
    .ioctl   = ioctl_dev,
    .read    = read_dev,
    .write   = write_dev,
    .readdir = readdir_dev,
    .lseek   = lseek_dev,
};

struct dir_entry_operations devfs_dops = {
    .compare = devfs_compare,
    .hash    = devfs_hash,
    .iput    = devfs_iput,
    .release = devfs_release,
};
struct index_node_operations devfs_iops = {
    .lookup  = devfs_lookup,
    .create  = devfs_create,
    .rmdir   = devfs_rmdir,
    .mkdir   = devfs_mkdir,
    .rename  = devfs_rename,
    .getattr = devfs_getattr,
    .setattr = devfs_setattr,
};
struct super_block_operations devfs_sops = {
    .put_superblock   = devfs_put_superblock,
    .write_superblock = devfs_write_superblock,
    .write_inode      = devfs_write_inode,
};

void make_dentry(struct dir_entry* d, char* name, int namelen, struct dir_entry* parent,
                 struct dir_entry_operations* dops)
{
    strcpyk(d->name, name);
    d->name_length = namelen;
    //添加dentry的操作方法，这样能够查找设备
    d->dir_ops = dops;
    list_init(&d->subdirs_list);
    list_init(&d->child_node);
    d->child_node.data = d;
    d->parent          = parent;
    list_add(&parent->subdirs_list, &d->child_node);
}
void make_inode(struct index_node* i, struct index_node_operations* iops,
                struct file_operations* fops, unsigned long attr, struct super_block* sb)
{
    i->f_ops     = fops;
    i->attribute = attr;
    i->sb        = sb;
    i->file_size = 0;
    i->inode_ops = iops;
}
/**
    @brief 创建设备文件
*/
void make_devf(char* name, int dev)
{
    //创建设备文件
    struct dir_entry*  d = KMALLOC(sizeof(struct dir_entry));
    struct index_node* i = KMALLOC(sizeof(struct index_node));
    d->name              = KMALLOC(strlenk(name) + 1);
    i->dev               = dev;
    strcpyk(d->name, name);
    make_dentry(d, name, strlenk(name), ddev->mount_point->sb->root, &devfs_dops);
    d->dir_inode = i;
    make_inode(
        i, ddev->mount_point->sb->root->dir_inode->inode_ops, &devfs_fops, FS_ATTR_DEVICE, root_sb);
}
struct super_block* devfs_read_superblock(volume* PDTE, void* buf)
{
    struct super_block* sb = kmalloc(PAGE_4K_SIZE, NO_ALIGN);
    sb->dev                = 0;   //不存在具体的存储设备
    // sb->p_dev              = 0;
    sb->root   = sb + 1;
    sb->sb_ops = &devfs_sops;

    sb->root->dir_inode = sb->root + 1;
    sb->root->dir_ops   = &devfs_dops;
    list_init(&sb->root->child_node);
    list_init(&sb->root->subdirs_list);
    sb->root->name = kmalloc(4, NO_ALIGN);
    strcpyk(sb->root->name, "dev");
    sb->root->name_length = 3;

    sb->root->dir_inode->dev       = 0;
    sb->root->dir_inode->inode_ops = &devfs_iops;
    sb->root->dir_inode->sb        = sb;
    sb->root->dir_inode->file_size = 0;
    sb->root->dir_inode->f_ops     = &devfs_fops;
    sb->root->dir_inode->blocks    = 0;
    sb->root->dir_inode->attribute |= FS_ATTR_DIR;
    sb->root->dir_inode->private_index_info = 0;

    return sb;
}
long readdir_dev(struct file* filp, void* dirent, filldir_t filler)
{
    struct List*      lp = filp->dentry->subdirs_list.next;
    struct dir_entry* d  = ((char*)lp - ((char*)&filp->dentry->child_node - (char*)filp->dentry));
    int               dentryi = filp->position / sizeof(struct dir_entry);
    for (int i = 0; d && i < dentryi; i++) {
        d = list_next(d, &d->child_node);
        if (!d) {
            return -1;
        }
    }
    filp->position += sizeof(struct dir_entry);
    return filler(dirent, d->name, d->name_length, 0, 0);
}
long lseek_dev(struct file* filp, long offset, int whence)
{
    comprintf("lseek not yet supported for devices.\n");
    return -EINVAL;
    if (whence == SEEK_SET) {
        filp->position = 0;
    }
    else if (whence == SEEK_CUR) {
        ;
    }
    else if (whence == SEEK_END) {
        // comprintf("SEEK_END not supported for devices.\n");
        return -EINVAL;
    }
    return filp->position;
}