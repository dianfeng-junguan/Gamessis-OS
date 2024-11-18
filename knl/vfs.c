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

        path = (struct dir_entry *) kmalloc(sizeof(struct dir_entry), 0);
        memset(path,0,sizeof(struct dir_entry));

        path->name = kmalloc();
        memset(path->name,0,tmpnamelen+1);
        memcpy(path->name,tmpname,tmpnamelen);
        path->name_length = tmpnamelen;

        path=parent->dir_inode->inode_ops->lookup(parent->dir_inode,path);
        if(path == NULL)
        {
            printf("can not find file or dir:%s\n",path->name);
            kmfree(path->name);
            kmfree(path);
            return NULL;
        }

//        list_init(&path->child_node);
//        list_init(&path->subdirs_list);
        path->parent = parent;
        //list_add会查重，如果链表里面已经有了data指针值相同的项，就不添加。
        //对于/dev这样的文件夹，lookup返回的就是链表里的dentry，data会一样
        list_add(&parent->subdirs_list,&path->child_node);

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
void mount_rootfs(){
    root_sb=(struct super_block*) kmalloc();
    root_sb->root=root_sb+1;//紧凑跟在后面
    root_sb->sb_ops=NULL;
    
    struct index_node* ir=root_sb->root+1;
    root_sb->root->dir_inode=ir;
    ir->sb=root_sb;
    ir->attribute=FS_ATTR_DIR;
    ir->file_size=0;
    ir->inode_ops=&root_iops;//lookup函数是必要的
    ir->f_ops=NULL;
    ir->private_index_info=root_sb->root;

    root_sb->root->name=ir+1;//紧凑跟在后面
    strcpy(root_sb->root->name,"/");
    root_sb->root->name_length=1;
    root_sb->root->parent=root_sb->root;
    list_init(&root_sb->root->subdirs_list);
    list_init(&root_sb->root->child_node);

}

