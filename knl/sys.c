//
// Created by Oniar_Pie on 2024/10/7.
//
#include "sys/types.h"
#include "vfs.h"
#include "errno.h"
#include "fcntl.h"
#include "mem.h"
#include "memory.h"
#include "fat32.h"
#include "fcntl.h"
#include "proc.h"
#include "log.h"
#include "str.h"
#include "exe.h"
#include "syscall.h"
#include "int.h"
#include <sys/mman.h>
#include "sys/stat.h"


unsigned long sys_putstring(char *string)
{
    printf(string);
    return 0;
}

unsigned long sys_open(char *filename,int flags)
{
    char * path = NULL;
    long pathlen = 0;
    long error = 0;
    struct dir_entry * dentry = NULL;
    struct file * filp = NULL;
    struct file ** f = NULL;
    int fd = -1;
    int i;

//	printf("sys_open\n");
    path = (char *) kmalloc(0,PAGE_4K_SIZE);
    if(path == NULL)
        return -ENOMEM;
    memset(path,0,PAGE_4K_SIZE);
    pathlen = strlen(filename);
    if(pathlen <= 0)
    {
        kmfree(path);
        return -EFAULT;
    }
    else if(pathlen >= PAGE_4K_SIZE)
    {
        kmfree(path);
        return -ENAMETOOLONG;
    }
    strcpy(path,filename);

    dentry = path_walk(path,0);

    if(dentry == NULL){
        // if(!flags&O_CREAT)
        return -ENOENT;
        //创建文件
        //TODO 创建文件改为更正规的方法
        //找到上一级目录
        char* p=path+strlen(path)-1;
        for(;*p!='/'&&p>path;p--);
        *p='\0';
        struct dir_entry *parent= path_walk(path,O_DIRECTORY);
        if(parent==NULL)
            return -ENOENT;//上级目录也不在
        //创建新的文件
        dentry=(struct dir_entry*) kmalloc(0,sizeof(struct dir_entry));
        list_init(&dentry->subdirs_list);
        list_init(&dentry->child_node);
        dentry->child_node.data=dentry;
        list_add(&parent->subdirs_list,&dentry->child_node);
        dentry->parent=parent;
        dentry->dir_inode=dentry+1;//放在后面
        dentry->dir_inode->file_size=0;
        //继承操作方法
        dentry->dir_inode->f_ops=parent->dir_inode->f_ops;
        dentry->dir_inode->inode_ops=parent->dir_inode->inode_ops;
        dentry->dir_ops=parent->dir_ops;
        //这样的创建文件只能创建普通文件，设备文件要通过devman创建
        dentry->dir_inode->attribute=FS_ATTR_FILE;
    }
    dentry->link++;//这样哪怕长时间不path walk，也不会被释放
    // kmfree(path);

    if((flags & O_DIRECTORY) && (dentry->dir_inode->attribute != FS_ATTR_DIR))
        return -ENOTDIR;
    if(!(flags & O_DIRECTORY) && (dentry->dir_inode->attribute == FS_ATTR_DIR))
        return -EISDIR;

    filp = (struct file *) kmalloc(0,sizeof(struct file));
    memset(filp,0,sizeof(struct file));
    filp->dentry = dentry;
    filp->mode = flags;

    if(dentry->dir_inode->attribute & FS_ATTR_DEVICE){
        extern struct file_operations devfs_fops;
        filp->f_ops = &devfs_fops;	//////	find device file operation function
    }
    else
        filp->f_ops = dentry->dir_inode->f_ops;
    if(filp->f_ops && filp->f_ops->open)
        error = filp->f_ops->open(dentry->dir_inode,filp);
    if(error != 1)
    {
        kmfree(filp);
        return -EFAULT;
    }

    if(filp->mode & O_TRUNC)
    {
        filp->dentry->dir_inode->file_size = 0;
    }
    if(filp->mode & O_APPEND)
    {
        filp->position = filp->dentry->dir_inode->file_size;
    }

    f = current->openf;
    for(i = 0;i < MAX_TASKS;i++)
        if(f[i] == NULL)
        {
            fd = i;
            break;
        }
    if(i == MAX_TASKS)
    {
        kmfree(filp);
        //// reclaim struct index_node & struct dir_entry
        return -EMFILE;
    }
    f[fd] = filp;
    comprintf("new openf:%l\n",filp);
    return fd;
}

unsigned long sys_close(int fd)
{
    struct file * filp = NULL;

//	printf("sys_close:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
        return -EBADF;

    filp = current->openf[fd];
    if(filp->f_ops && filp->f_ops->close)
        filp->f_ops->close(filp->dentry->dir_inode,filp);
    filp->dentry->link--;
    kmfree(filp);
    current->openf[fd] = NULL;

    return 0;
}

unsigned long sys_read(int fd,void * buf,long count)
{
    struct file * filp = NULL;
    unsigned long ret = 0;

//	printf("sys_read:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
        return -EBADF;
    if(count < 0)
        return -EINVAL;

    filp = current->openf[fd];
    if(filp->f_ops && filp->f_ops->read)
        ret = filp->f_ops->read(filp,buf,count,&filp->position);
    return ret;
}

unsigned long sys_write(int fd,void * buf,long count)
{
    struct file * filp = NULL;
    unsigned long ret = 0;

//	printf("sys_write:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
        return -EBADF;
    if(count < 0)
        return -EINVAL;

    filp = current->openf[fd];
    if(filp->f_ops && filp->f_ops->write)
        ret = filp->f_ops->write(filp,buf,count,&filp->position);
    return ret;
}


unsigned long sys_lseek(int filds,long offset,int whence)
{
    struct file * filp = NULL;
    unsigned long ret = 0;

//	printf("sys_lseek:%d\n",filds);
    if(filds < 0 || filds >= MAX_TASKS)
        return -EBADF;
    if(whence < 0 || whence >= SEEK_MAX)
        return -EINVAL;

    filp = current->openf[filds];
    if(filp->f_ops && filp->f_ops->lseek)
        ret = filp->f_ops->lseek(filp,offset,whence);
    return ret;
}

//unsigned long sys_fork()
//{
//    TSS *regs = (TSS*)current->tss.rsp0 -1;
//    printf("sys_fork\n");
//    //return do_fork(regs,0,regs->rsp,0);
//}

unsigned long sys_vfork()
{
    regs_t *regs = (regs_t *)current->tss.rsp0 -1;
    printf("sys_vfork\n");
    return sys_fork();
    //return do_fork(regs,CLONE_VM | CLONE_FS | CLONE_SIGNAL,regs->rsp,0);
}
//
//unsigned long execute()
//{
//    char * pathname = NULL;
//    long pathlen = 0;
//    long error = 0;
//    regs_t *regs = (regs_t *)current->tss.rsp0 -1;
//
//    printf("execute\n");
//    pathname = (char *)vmalloc();
//    if(pathname == NULL)
//        return -ENOMEM;
//    memset(pathname,0,PAGE_4K_SIZE);
//    pathlen = strlen((char *)regs->rdi);
//    if(pathlen <= 0)
//    {
//        vmfree(pathname);
//        return -EFAULT;
//    }
//    else if(pathlen >= PAGE_4K_SIZE)
//    {
//        vmfree(pathname);
//        return -ENAMETOOLONG;
//    }
//    strcpy((char *)regs->rdi,pathname);
//
//    error = execute(pathname);//regs,pathname,(char **)regs->rsi,NULL
//
//    vmfree(pathname);
//    return error;
//}

//unsigned long sys_exit(int exit_code)
//{
//    printf("sys_exit\n");
//    //return do_exit(exit_code);
//}

/*
	rusage reserved
*/

unsigned long sys_wait(pid_t pid, int *stat_loc, int options){
    struct process* waitee=NULL;
    extern struct process task[];
    if(!current->child_procs)
        return -ECHILD;//没有子进程可以等
    if(pid==-1){
        //任意一个子进程
        while (1) {
            for(struct List* l=current->child_procs;l;l=l->next) {
                struct process* p=(void*)l-((void*)&current->node-(void*)current);//l->data;
                if(p->stat == TASK_ZOMBIE) {
                    waitee=p;
                    goto done;
                }
            }
        }

    }else if(pid==0) {
        //等待任意一个和父进程同一个进程组的子进程
        while (1) {
            for(struct List* l=current->child_procs;l;l=l->next) {
                struct process* p=(void*)l-((void*)&current->node-(void*)current);//l->data;
                if(p->gpid==current->gpid&& p->stat == TASK_ZOMBIE) {
                    waitee=p;
                    goto done;
                }
            }
        }
    }else{
        if(pid<0)pid=-pid;
        //检查是不是本进程的子进程
        for(struct List* l=current->child_procs;l;l=l->next) {
            struct process* p=(void*)l-((void*)&current->node-(void*)current);
            if(p->pid==pid){
                waitee=p;
                break;
            }
        }
        if(waitee==NULL||waitee->parent_pid!=current->pid)
            return -ECHILD;//没有这个进程或者不是子进程
        //TODO 等待结束以及等待信号
        //进入休眠，直到接到子进程结束的信号
        proc_sleep();
        // while (waitee->stat != TASK_ZOMBIE);
        *stat_loc=waitee->exit_code;
    }
    done:
    //清除子进程
    waitee->stat=TASK_EMPTY;
    //从链表中删除，不再是子进程
    list_drop(&waitee->node);
    //TODO 被信号中断时返回-1
    return waitee->pid;
}
unsigned long sys_wait4(unsigned long pid,int *status,int options,void *rusage)
{
//    long retval = 0;
//    struct task_struct *child = NULL;
//    struct task_struct *tsk = NULL;
//
//    printf("sys_wait4\n");
//    for(tsk = &init_task_union.task;tsk->next != &init_task_union.task;tsk = tsk->next)
//    {
//        if(tsk->next->pid == pid)
//        {
//            child = tsk->next;
//            break;
//        }
//    }
//
//    if(child == NULL)
//        return -ECHILD;
//    if(options != 0)
//        return -EINVAL;
//
//    if(child->state == TASK_ZOMBIE)
//    {
//        copy_to_user(&child->exit_code,status,sizeof(int));
//        tsk->next = child->next;
//        exit_mm(child);
//        vmfree(child);
//        return retval;
//    }
//
//    interruptible_sleep_on(&current->wait_childexit);
//
//    copy_to_user(&child->exit_code,status,sizeof(long));
//    tsk->next = child->next;
//    exit_mm(child);
//    vmfree(child);
//    return retval;
}
//扩展或者释放进程可用内存（堆）空间。分配时以4K为单位
unsigned long sys_brk(unsigned long brk)
{
   unsigned long new_brk = PAGE_4K_ALIGN(brk);

//	printf("sys_brk\n");
//	printf("brk:%#018lx,new_brk:%#018lx,current->mm->end_brk:%#018lx\n",brk,new_brk,current->mm->end_brk);
    if(new_brk == 0)
       return current->mem_struct.heap_base;
    if(new_brk<current->mem_struct.heap_base)return current->mem_struct.heap_top;
    if(new_brk < current->mem_struct.heap_top)
    {
        size_t ms=current->mem_struct.heap_top-new_brk;
        sys_munmap(brk, ms);
        
    }else {
        new_brk = do_brk(new_brk);	//expand brk space
    }



   current->mem_struct.heap_top = new_brk;
   return new_brk;
}

unsigned long sys_reboot(unsigned long cmd,void * arg)
{
    printf("sys_reboot\n");
    switch(cmd)
    {
        case SYSTEM_REBOOT:
            outb(0x64,0xFE);
            break;

        case SYSTEM_POWEROFF:
            printf("sys_reboot cmd SYSTEM_POWEROFF\n");
            break;

        default:
            printf("sys_reboot cmd ERROR!\n");
            break;
    }
    return 0;
}


unsigned long sys_chdir(char *filename)
{
    char * path = NULL;
    long pathlen = 0;
    struct dir_entry * dentry = NULL;

    printf("sys_chdir\n");
    pathlen = strlen(filename);
    path = (char *) kmalloc(0,pathlen);

    if(path == NULL)
        return -ENOMEM;
    memset(path,0,PAGE_4K_SIZE);
    if(pathlen <= 0)
    {
        kmfree(path);
        return -EFAULT;
    }
    else if(pathlen >= PAGE_4K_SIZE)
    {
        kmfree(path);
        return -ENAMETOOLONG;
    }
    strcpy(filename,path);

    dentry = path_walk(path,0);
    kmfree(path);

    if(dentry == NULL)
        return -ENOENT;
    if(dentry->dir_inode->attribute != FS_ATTR_DIR)
        return -ENOTDIR;
    return 0;
}

unsigned long sys_getdents(int fd, void * dirent, long count)
{
    struct file * filp = NULL;
    unsigned long ret = 0;

//	printf("sys_getdents:%d\n",fd);
    if(fd < 0 || fd > MAX_TASKS)
        return -EBADF;
    if(count < 0)
        return -EINVAL;

    filp = current->openf[fd];
    if(filp->f_ops && filp->f_ops->readdir)
        ret = filp->f_ops->readdir(filp,dirent,&fill_dentry);
    return ret;
}

int sys_munmap(void *addr, size_t len){
    void *addr2=PAGE_4K_ALIGN(addr);
    size_t len2=PAGE_4K_ALIGN(len);
    if(len==0)return 0;
    //本来就没被映射
    if(chk_mmap(addr, len))return 0;
    return do_munmap(addr2,len2);
}
void *sys_mmap(void *addr, size_t len, int prot, int flags,int fildes, off_t off){
    cli();
    comprintf("sys mmap:base=%l,len=%l\n",addr,len);
    int attr=PAGE_PRESENT|PAGE_FOR_ALL;
    if((prot|PROT_WRITE)||(prot|PROT_EXEC))
        attr|=PAGE_RWX;
    if(!addr){
        //没有指定地址
        //寻找一块空的虚拟内存
        while (!chk_mmap(addr,len))
        {
            addr+=PAGE_4K_SIZE;
            if(addr>=KNL_BASE){
                set_errno(-ENOMEM);
                return MAP_FAILED;
            }
        }
    }
    if(!chk_mmap(addr,len)&&(flags&MAP_FIXED)){
        set_errno(-ENOMEM);
        return MAP_FAILED;
    }
    //创建mmap struct
    mmap_struct* mmps=kmalloc(0,sizeof(mmap_struct));
    list_init(&mmps->node);
    //加入到进程mmaps链表
    
    if(!current->mmaps)
        current->mmaps=mmps;
    else
        list_add(&current->mmaps->node,&mmps->node);
    //设置mmap struct
    mmps->base=addr;
    mmps->len=len;
    if(fildes>0)
        mmps->file=current->openf[fildes];
    else
        mmps->file=NULL;
    mmps->fd=fildes;
    mmps->offset=off;
    mmps->pmhdr=NULL;
    mmps->flags=prot|(flags&MAP_SHARED?MMAP_FLAG_S:0);
    
    /* int pgc=(len-1+PAGE_4K_SIZE)/PAGE_4K_SIZE;
    for(int i=0;i<pgc;i++){
        smmap(pmalloc(PAGE_4K_SIZE),addr+i*PAGE_4K_SIZE,attr,current->pml4);

    }
    ===
    int pgc=(len-1+PAGE_4K_SIZE)/PAGE_4K_SIZE;
    for(int i=0;i<pgc;i++){
        smmap(pmalloc(PAGE_4K_SIZE),addr+i*PAGE_4K_SIZE,attr,current->pml4);
    }
    goto sync_f; */
    
// sync_f:
//     if(flags|MAP_ANNONYMOUS){
//         //不需要映射到文件，匿名映射
//         return addr;
//     }
    //根据需要是否同步文件内容
    //目前先一致读取
    // sys_lseek(fildes,off,SEEK_SET);
    // sys_read(fildes,addr,len);
    return addr;
    
}

/*
TODO 
创建文件，可以是FIFO，常规文件，目录和设备文件。除了FIFO，其他类型创建前会检查进程权限（未完成）
*/
int sys_mknod(const char *path, mode_t mode, dev_t dev){
    //TODO 权限检查

    if(!create_node(path, mode, dev)){
        return -1;
    }

    return 0;
}
