//
// Created by Oniar_Pie on 2024/10/5.
//
#include "vfs.h"
#include "dirent.h"
#include "errno.h"
#include "memory.h"
#include "log.h"
#include "mem.h"
#include "str.h"
#include <ramdisk.h>
mount_point mp_mount_points[MAX_MOUNTPOINTS];
struct dir_entry* droot;
/*原理：
每一个被使用或者创建的dentry，会被放到数组的开头，剩余后移。当有dentry被挤出去的时候，如果不是necessary，则释放dentry。如果期间被使用了，
则被放到开头。
*/
struct dir_entry* history_dentry[48];

void drelse(struct dir_entry* d){
    //同步inode到介质中
    d->dir_ops->iput(d,d->dir_inode);
    //释放
    list_drop(&d->child_node);
    kmfree(d->name);
    d->dir_inode->link--;
    if(!d->dir_inode->link)
    {
        kmfree(d->dir_inode->private_index_info);
        kmfree(d->dir_inode);//释放inode
    }
    kmfree(d);
}
void mark_use(struct dir_entry* d){
    int mk=47;
    for(int i=0;i<48;i++){
        if(dentry_cmp(history_dentry[i],d)==0){
            mk=i;
            break;
        }
    }
    struct dir_entry* dropped;
    if(mk==47){
        dropped=history_dentry[mk];
        if(!dropped->mount_point&&!dropped->subdirs_list.next&&!dropped->link){
            drelse(dropped);
        }
    }
    for(;mk>0;mk--){
        history_dentry[mk]=history_dentry[mk-1];
    }
    history_dentry[0]=d;

}
struct dir_entry * path_walk(char * name,unsigned long flags)
{
    char * tmpname = NULL;
    int tmpnamelen = 0;
    struct dir_entry * parent = root_sb->root;
    struct dir_entry * path = NULL;

    while(*name == '/')
        name++;

    if(!*name)
    {
        return parent;
    }

    for(;;)
    {
        tmpname = name;
        while(*name && (*name != '/'))
            name++;
        tmpnamelen = name - tmpname;
        if(parent->mount_point)
        {
            //有挂载点，则进入挂载文件系统的文件树
            parent=parent->mount_point->sb->root;
        }
        //先在缓存中寻找已有的dentry
        //寻找名字为tmpname的dentry
        struct List* lp=parent->subdirs_list.next;
        while (lp)
        {
            path=lp->data;
            if(memcmp(tmpname,path->name,tmpnamelen)==0){
                break;
            }
            lp=&path->child_node;
            lp=lp->next;
        }
        if(!lp){
            //缓存中没有，再读取介质
            path = (struct dir_entry *) kmalloc(sizeof(struct dir_entry), 0);
            memset(path,0,sizeof(struct dir_entry));

            path->name = kmalloc(0,tmpnamelen+1);
            memset(path->name,0,tmpnamelen+1);
            memcpy(path->name,tmpname,tmpnamelen);
            path->name_length = tmpnamelen;

            path=parent->dir_inode->inode_ops->lookup(parent->dir_inode,path);
        
            if(path == NULL)
            {
                printf("can not find file or dir:%s\n",name);
                // kmfree(path->name);
                // kmfree(path);
                return NULL;
            }
//        list_init(&path->child_node);
//        list_init(&path->subdirs_list);
            path->parent = parent;
            //list_add会查重，如果链表里面已经有了data指针值相同的项，就不添加。
            //不过这里已经是缓存中没有找到dentry的情况了，一般不会出现data一样。
            list_add(&parent->subdirs_list,&path->child_node);

        }
        
        
        //标记这个dentry刚刚使用过
        mark_use(path);
        if(!*name)
            goto last_component;
        while(*name == '/')
            name++;
        if(!*name)
            goto last_slash;
        parent = path;
    }

    last_slash:
    last_component:

    if(flags & 1)
    {
        return parent;
    }

    return path;
}


int fill_dentry(void *buf,char *name, long namelen,long type,long offset)
{
    struct dirent* dent = (struct dirent*)buf;

    if((unsigned long)buf < PAGE_4K_SIZE)
        return -EFAULT;

    memcpy(name,dent->d_name,namelen);
    dent->d_namelen = namelen;
    dent->d_type = type;
    dent->d_offset = offset;
    return sizeof(struct dirent) + namelen;
}

//function mount_root
struct super_block * root_sb = NULL;
struct file_system_type filesystem = {"filesystem",0};

struct super_block* mount_fs(char * name,struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
    struct file_system_type * p = NULL;

    for(p = &filesystem;p;p = p->next)
        if(!strcmp(p->name,name))
        {
            return p->read_superblock(DPTE,buf);
        }
    return 0;
}
int mount_fs_on(struct dir_entry *d_to_mount,struct super_block* fs){
    for(int i=0;i<MAX_MOUNTPOINTS;i++){
        if(!mp_mount_points[i].sb){
            mp_mount_points[i].sb=fs;
            mp_mount_points[i].dmount_point=d_to_mount;
            d_to_mount->mount_point=mp_mount_points+i;
            return 1;
        }
    }
    return -ENOMEM;
}
int umount_fs(struct dir_entry* d_mp){
    if(d_mp->mount_point){
        d_mp->mount_point->dmount_point=0;
        d_mp->mount_point->sb=0;
        return 1;
    }
    return -ENOENT;
}
unsigned long register_filesystem(struct file_system_type * fs)
{
    struct file_system_type * p = NULL;

    for(p = &filesystem;p;p = p->next)
        if(!strcmp(fs->name,p->name))
            return 0;

    fs->next = filesystem.next;
    filesystem.next = fs;

    return 1;
}

unsigned long unregister_filesystem(struct file_system_type * fs)
{
    struct file_system_type * p = &filesystem;

    while(p->next)
        if(p->next == fs)
        {
            p->next = p->next->next;
            fs->next = NULL;
            return 1;
        }
        else
            p = p->next;
    return 0;
}
//在parent inode下查找dest dentry
struct dir_entry* root_lookup(struct index_node * parent_inode,struct dir_entry * dest_dentry){
    struct dir_entry* tmp= (struct dir_entry *) parent_inode->private_index_info;
    struct List* p= tmp->subdirs_list.next;
    while (p){
        struct dir_entry* dp=p->data;
        if(strcmp(dp->name,dest_dentry->name)==0){
            kmfree(dest_dentry);
            return dp;
        }
        p=p->next;
    }
    kmfree(dest_dentry);
    return NULL;
}
struct index_node_operations root_iops={
    .lookup=root_lookup
};
void init_rootfs(){
    /* root_sb=(struct super_block*) kmalloc();
    root_sb->root=root_sb+1;//紧凑跟在后面
    root_sb->sb_ops=NULL; */
    droot=kmalloc(0,sizeof(struct dir_entry));
    
    /* struct index_node* ir=droot+1;
    droot->dir_inode=ir;
    ir->sb=root_sb;
    ir->attribute=FS_ATTR_DIR;
    ir->file_size=0;
    ir->inode_ops=&root_iops;//lookup函数是必要的
    ir->f_ops=NULL;
    ir->private_index_info=droot; */

    droot->name=droot+1;//紧凑跟在后面
    strcpy(droot->name,"/");
    droot->name_length=1;
    droot->parent=droot;
    list_init(&droot->subdirs_list);
    list_init(&droot->child_node);
    droot->child_node.data=droot;

    // root_sb->dev=dev_ramdisk<<8;
    // root_sb->p_dev=&bd_ramdisk;
    //TODO 以后要直接拿设备号，这个设备号通过devman创建设备文件（节点）分配。
    ROOT_DEV=dev_ramdisk<<8;
    
}

