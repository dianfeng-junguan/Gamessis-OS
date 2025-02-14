//
// Created by Oniar_Pie on 2024/10/5.
//
#include "vfs.h"
#include "dirent.h"
#include "errno.h"
#include "int.h"
#include "memory.h"
#include "log.h"
#include "mem.h"
#include "proc.h"
#include "str.h"
#include "sys/types.h"
#include <ramdisk.h>
#include "sys/stat.h"
mount_point       mp_mount_points[MAX_MOUNTPOINTS];
struct dir_entry* droot;
int               ROOT_DEV;
/*原理：
每一个被使用或者创建的dentry，会被放到数组的开头，剩余后移。当有dentry被挤出去的时候，如果不是necessary，则释放dentry。如果期间被使用了，
则被放到开头。
*/
struct dir_entry* history_dentry[48];

void drelse(struct dir_entry* d)
{
    //删除在histrory_dentry中的记录
    for (int i = 0; i < 48; i++) {
        if (history_dentry[i] == d) {
            for (int j = i; history_dentry[j] && j < 47; j++) {
                history_dentry[j] = history_dentry[j + 1];
            }
            history_dentry[47] = NULL;
            break;
        }
    }
    //同步inode到介质中
    d->dir_ops->iput(d, d->dir_inode);
    //释放
    list_drop(&d->child_node);
    kfree(d->name);
    d->dir_inode->link--;
    if (!d->dir_inode->link) {
        if (d->dir_inode->private_index_info) {
            kfree(d->dir_inode->private_index_info);
        }
        kfree(d->dir_inode);   //释放inode
    }
    kfree(d);
}
int dentry_cmp(struct dir_entry* a, struct dir_entry* b)
{
    while (a && b) {
        if (strcmpk(a->name, b->name) != 0)
            return a->name_length - b->name_length;
        a = a->parent;
        b = b->parent;
        if (a->parent == a && b->parent == b) {
            //有的根目录会把parent设置成自己，这里的代码是为了检测这种情况，即已经比较到根目录了
            break;
        }
    }
    return 0;
}
void mark_use(struct dir_entry* d)
{
    int mk = 47;
    for (int i = 0; i < 48; i++) {
        if (history_dentry[i] && dentry_cmp(history_dentry[i], d) == 0) {
            mk = i;
            break;
        }
    }
    struct dir_entry* dropped;
    if (mk == 47) {
        dropped = history_dentry[mk];
        if (dropped && !dropped->mount_point && !dropped->subdirs_list.next && !dropped->link) {
            drelse(dropped);
        }
    }
    for (; mk > 0; mk--) {
        history_dentry[mk] = history_dentry[mk - 1];
    }
    history_dentry[0] = d;
}
struct dir_entry* path_walk(char* name, unsigned long flags)
{
    char*             tmpname    = NULL;
    int               tmpnamelen = 0;
    struct dir_entry* parent     = *name == '/' ? droot : current->cwd;
    if (parent->mount_point) {   //避免直接返回没有实际信息的形式根目录
        parent = parent->mount_point->sb->root;
    }
    struct dir_entry* path = NULL;

    while (*name == '/')
        name++;

    if (!*name) {
        return parent;
    }

    for (;;) {
        tmpname = name;
        while (*name && (*name != '/'))
            name++;
        tmpnamelen = name - tmpname;
        if (parent->mount_point) {
            //有挂载点，则进入挂载文件系统的文件树
            parent = parent->mount_point->sb->root;
        }
        //先在缓存中寻找已有的dentry
        //寻找名字为tmpname的dentry
        struct List* lp = parent->subdirs_list.next;
        if (lp)
            path = (void*)lp - ((void*)&path->child_node - (void*)path);
        while (path) {
            if (memcmp(tmpname, path->name, tmpnamelen) == 0) {
                break;
            }
            // lp=&path->child_node;
            // lp=lp->next;
            path = list_next(path, &path->child_node);
        }
        if (!path) {
            //缓存中没有，再读取介质
            path = (struct dir_entry*)kmalloc(0, sizeof(struct dir_entry));
            memset(path, 0, sizeof(struct dir_entry));

            path->name = kmalloc(0, tmpnamelen + 1);
            memset(path->name, 0, tmpnamelen + 1);
            memcpy(path->name, tmpname, tmpnamelen);
            path->name_length = tmpnamelen;

            path = parent->dir_inode->inode_ops->lookup(parent->dir_inode, path);

            if (path == NULL) {
                printfk("can not find file or dir:%s\n", name);
                // kfree(path->name);
                // kfree(path);
                return NULL;
            }
            //        list_init(&path->child_node);
            //        list_init(&path->subdirs_list);
            path->parent = parent;
            // list_add会查重，如果链表里面已经有了data指针值相同的项，就不添加。
            //不过这里已经是缓存中没有找到dentry的情况了，一般不会出现data一样。
            list_add(&parent->subdirs_list, &path->child_node);
            path->child_node.data = path;
        }


        //标记这个dentry刚刚使用过
        mark_use(path);
        if (!*name)
            goto last_component;
        while (*name == '/')
            name++;
        if (!*name)
            goto last_slash;
        parent = path;
    }

last_slash:
last_component:

    if (flags & 1) {
        return parent;
    }
    if (path->mount_point)
        path = path->mount_point->sb->root;
    return path;
}


int fill_dentry(void* buf, char* name, long namelen, long type, long offset)
{
    struct dirent* dent = (struct dirent*)buf;

    if ((unsigned long)buf < PAGE_4K_SIZE)
        return -EFAULT;

    memcpy(name, dent->d_name, namelen);
    dent->d_namelen = namelen;
    dent->d_type    = type;
    dent->d_offset  = offset;
    return sizeof(struct dirent) + namelen;
}

// function mount_root
struct super_block*     root_sb    = NULL;
struct file_system_type filesystem = {"filesystem", 0};

struct super_block* mount_fs(char* name, volume* vol, void* buf)
{
    struct file_system_type* p = NULL;

    for (p = &filesystem; p; p = p->next)
        if (!strcmpk(p->name, name)) {
            return p->read_superblock(vol, buf);
        }
    return 0;
}
int mount_fs_on(struct dir_entry* d_to_mount, struct super_block* fs)
{
    for (int i = 0; i < MAX_MOUNTPOINTS; i++) {
        if (!mp_mount_points[i].sb) {
            mp_mount_points[i].sb           = fs;
            mp_mount_points[i].dmount_point = d_to_mount;
            d_to_mount->mount_point         = mp_mount_points + i;
            return 1;
        }
    }
    return -ENOMEM;
}
int umount_fs(struct dir_entry* d_mp)
{
    if (d_mp->mount_point) {
        d_mp->mount_point->dmount_point = 0;
        d_mp->mount_point->sb           = 0;
        return 1;
    }
    return -ENOENT;
}
unsigned long register_filesystem(struct file_system_type* fs)
{
    struct file_system_type* p = NULL;

    for (p = &filesystem; p; p = p->next)
        if (!strcmpk(fs->name, p->name))
            return 0;

    fs->next        = filesystem.next;
    filesystem.next = fs;

    return 1;
}

unsigned long unregister_filesystem(struct file_system_type* fs)
{
    struct file_system_type* p = &filesystem;

    while (p->next)
        if (p->next == fs) {
            p->next  = p->next->next;
            fs->next = NULL;
            return 1;
        }
        else
            p = p->next;
    return 0;
}
//在parent inode下查找dest dentry
//已废弃
struct dir_entry* root_lookup(struct index_node* parent_inode, struct dir_entry* dest_dentry)
{
    struct dir_entry* tmp = (struct dir_entry*)parent_inode->private_index_info;
    struct List*      p   = tmp->subdirs_list.next;
    while (p) {
        struct dir_entry* dp = p->data;
        if (strcmpk(dp->name, dest_dentry->name) == 0) {
            kfree(dest_dentry);
            return dp;
        }
        p = p->next;
    }
    kfree(dest_dentry);
    return NULL;
}
struct index_node_operations root_iops = {.lookup = root_lookup};
void                         init_rootfs()
{
    /* root_sb=(struct super_block*) kmalloc(0,PAGE_4K_SIZE);
    root_sb->root=root_sb+1;//紧凑跟在后面
    root_sb->sb_ops=NULL; */
    droot = kmalloc(0, sizeof(struct dir_entry));

    /* struct index_node* ir=droot+1;
    droot->dir_inode=ir;
    ir->sb=root_sb;
    ir->attribute=FS_ATTR_DIR;
    ir->file_size=0;
    ir->inode_ops=&root_iops;//lookup函数是必要的
    ir->f_ops=NULL;
    ir->private_index_info=droot; */

    droot->name = droot + 1;   //紧凑跟在后面
    strcpyk(droot->name, "/");
    droot->name_length = 1;
    droot->parent      = droot;
    list_init(&droot->subdirs_list);
    list_init(&droot->child_node);
    droot->child_node.data = droot;

    //创建inode
    struct index_node* inode  = kmalloc(0, sizeof(struct index_node));
    droot->dir_inode          = inode;
    inode->sb                 = root_sb;
    inode->attribute          = FS_ATTR_DIR;
    inode->file_size          = 0;
    inode->inode_ops          = &root_iops;
    inode->f_ops              = NULL;
    inode->private_index_info = droot;

    // root_sb->dev=dev_ramdisk<<8;
    // root_sb->p_dev=&bd_ramdisk;
    // TODO 以后要直接拿设备号，这个设备号通过devman创建设备文件（节点）分配。
    ROOT_DEV = dev_ramdisk;

    for (int i = 0; i < 48; i++) {
        history_dentry[i] = 0;
    }
}

struct dir_entry* create_node(char* pathname, mode_t mode, unsigned short dev)
{
    char* p = pathname;
    for (; *p; p++)
        ;
    for (; p > pathname && *p != '/'; p--)
        ;
    int   pplen = p - pathname;
    char* path  = kmalloc(0, pplen + 1);
    memcpy(path, pathname, pplen);
    path[pplen]              = '\0';
    struct dir_entry* parent = path_walk(path, 1);
    if (!parent) {
        return NULL;
    }
    p++;
    kfree(path);
    struct dir_entry*  new_noded = kmalloc(0, PAGE_4K_SIZE);
    struct index_node* new_nodei = new_noded + 1;
    new_noded->name              = new_nodei + 1;
    new_noded->name_length       = strlenk(p);
    strcpyk(new_noded->name, p);
    new_noded->dir_inode   = new_nodei;
    new_noded->dir_ops     = parent->dir_ops;
    new_noded->mount_point = 0;
    new_noded->link        = 0;
    new_noded->parent      = parent;
    list_init(&new_noded->child_node);
    list_init(&new_noded->subdirs_list);
    new_noded->child_node.data = new_noded;

    list_add(&parent->subdirs_list, &new_noded->child_node);

    // set inode
    memcpy(new_nodei, parent->dir_inode, sizeof(struct index_node));
    new_nodei->dev                = dev;
    new_nodei->link               = 1;
    new_nodei->private_index_info = 0;
    new_nodei->blocks             = 0;
    new_nodei->file_size          = 0;
    new_nodei->mode               = mode;
    if (mode == S_IFBLK || mode == S_IFCHR)
        new_nodei->attribute = FS_ATTR_DEVICE;
    else if (mode == S_IFDIR)
        new_nodei->attribute = FS_ATTR_DIR;
    else
        new_nodei->attribute = FS_ATTR_FILE;

    parent->dir_inode->inode_ops->create(parent->dir_inode, new_noded, mode);
    return new_noded;
}
void list_add(struct List* entry, struct List* new)   ////add to the tail of the link
{
    struct List* p = entry;
    for (; p->next && p->next != p; p = p->next) {}
    list_add_to_behind(p, new);
}

int remove(char* pathname)
{
    struct dir_entry* target = path_walk(pathname, 0);
    if (!target) {
        return -ENOENT;
    }
    //检查是否正在被使用
    if (target->link || target->mount_point) {
        return -EBUSY;
    }

    //删除文件
    target->dir_inode->inode_ops->rmdir(target->parent->dir_inode, target);

    //在vfs中删除
    drelse(target);
    return 0;
}
