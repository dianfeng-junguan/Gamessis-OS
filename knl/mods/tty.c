#include "tty.h"
#include "memory.h"
#include "framebuffer.h"
#include "fcntl.h"
#include "syscall.h"

int stdd=0;
struct file_operations tty_fops={
        .open=init_tty, .close=close_tty,.write=write_tty,.read=read_tty,.ioctl=tty_do_req
};

long close_tty(struct index_node * inode,struct file * filp){
    stdbuf_t * bi=&((tty_t*)filp->private_data)->stdin_buf;
    stdbuf_t * bo=&((tty_t*)filp->private_data)->stdout_buf;
    stdbuf_t * be=&((tty_t*)filp->private_data)->stderr_buf;
    vmfree((addr_t)bi);
    vmfree((addr_t)bo);
    vmfree((addr_t)be);
    vmfree((addr_t)filp->private_data);
    return 0;
}
//打开文件
long init_tty(struct index_node * inode,struct file * filp)
{
    tty_t *ntty=(tty_t*)vmalloc();
    //创建三个缓冲区
    ntty->stdin_buf.data= (char*)vmalloc();
    ntty->stdout_buf.data=(char*)vmalloc();
    ntty->stderr_buf.data=(char*)vmalloc();
    ntty->stdin_buf. wptr= 0;
    ntty->stdout_buf.wptr= 0;
    ntty->stderr_buf.wptr= 0;
    ntty->stdin_buf. rptr= 0;
    ntty->stdout_buf.rptr= 0;
    ntty->stderr_buf.rptr= 0;
    ntty->stdin_buf.size= PAGE_4K_SIZE;
    ntty->stdout_buf.size= PAGE_4K_SIZE;
    ntty->stderr_buf.size= PAGE_4K_SIZE;
    //设置inode文件操作方式为tty方式
    inode->f_ops=&tty_fops;
    filp->f_ops=&tty_fops;
    filp->private_data=ntty;
    return 0;
}

long read_tty(struct file * filp,char * buf,unsigned long count,long * position)
{
    stdbuf_t * b=&((tty_t*)filp->private_data)->stdin_buf;
    int i=0;
    while (i<count){
        if(b->rptr==b->size)
            b->rptr=0;
        buf[i++]=b->data[b->rptr];
        b->rptr++;
    }
}
long write_tty(struct file * filp,char * buf,unsigned long count,long * position)
{
    stdbuf_t * b=&((tty_t*)filp->private_data)->stdout_buf;
    int i=0;
    int saved_wptr=b->wptr;
    while (i<count){
        if(b->wptr==b->size)
            b->wptr=0;
        b->data[b->wptr]=buf[i++];
        b->wptr++;
    }
    //刷新到framebuffer
    write_framebuffer(filp,b->data+saved_wptr,count,0);
}
/*
 * TTY_WSTDERR:写stderr。
 * arg指向连续存储的参数内存所在。
 * 依次存放：buf(char*),count(unsigned long)
 * TTY_CONNECT:尝试连接到dev/console,这样会成为controlling terminal,里面的数据才能输出到屏幕上，
 * 因为除了特殊指定的进程都会有一个自己的天tty。
 * 成功返回0。
 * */
long tty_do_req(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg)
{
    stdbuf_t * b=&((tty_t*)filp->private_data)->stderr_buf;
    int i=0;
    char* buf=*((char**)arg);
    unsigned long count=*((unsigned long*)(arg+8));
    int saved_wptr=b->wptr;
    int fd=-1;
    switch (cmd)
    {
        case TTY_WSTDERR:
            while (i<count){
                if(b->wptr==b->size)
                    b->wptr=0;
                b->data[b->wptr]=buf[i++];
                b->wptr++;
            }
            //刷新到framebuffer
            write_framebuffer(filp,b->data+saved_wptr,count,0);
        break;
        case TTY_CONNECT:
            fd=sys_open("dev/console",O_WRONLY|O_CREAT|O_EXCL);
            if(fd==-1)return -1;
            ((tty_t*)filp->private_data)->console_fd=fd;
            break;
        case TTY_DISCONNECT:
            fd=((tty_t*)filp->private_data)->console_fd;
            if(fd==-1)return -1;
            sys_close(fd);
    default:return -1;
    }
    return 0;
}
