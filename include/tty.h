#pragma once

#define TTY_WSTDERR 0
#define TTY_CONNECT 1
#define TTY_DISCONNECT 2
#define TTY_WSTDIN 3
#define TTY_WRKEYBUF 4

#define FLAG_BREAK	0x80
#include "vfs.h"
//
typedef struct {
    char* data;
    int wptr,rptr,size;
}stdbuf_t;
typedef struct _tty_openbufs{
    stdbuf_t stdout_buf;
    stdbuf_t stdin_buf;
    stdbuf_t stderr_buf;
    int console_fd;
    struct _tty_openbufs* next;
}tty_openbufs;
#define CTLK_CTRL  0
#define CTLK_SHIFT 1
#define CTLK_CAPSLOCK 2
#define CTLK_ALT   3
#define CTLK_FN 4
typedef struct{
    char* text_buf;//存储输出记录，显示在屏幕上
    int text_buf_head;//开始显示的地方在textbuf里面的偏移
    int text_buf_tail,text_buf_size;
    int show;//输入回显
    int readonly;//只读
    unsigned int ctl_kmap;//特殊按键的状态位图，例如左右ctrl、 shift这些按键。
    tty_openbufs* stds;
    int chars_width,chars_height;//控制台显示屏的长宽参数，以字符为单位。
}tty_t;
#define MAX_TTYS 32
long open_tty(struct index_node * inode,struct file * filp);
long close_tty(struct index_node * inode,struct file * filp);
long read_tty(struct file * filp,char * buf,unsigned long count,long * position);
long write_tty(struct file * filp,char * buf,unsigned long count,long * position);
long ioctl_tty(struct index_node * inode, struct file * filp, unsigned long cmd, unsigned long arg);


int init_console();

//切换特殊按键状态
void switch_key(int bit,unsigned int *p_kmap);
//获取特殊按键状态
int get_key(int bit,unsigned int kmap);

void flush_textbuf(tty_t* tty);
int key_proc();
//注册一个tty设备，要求tty中预先填好chars width 和chars height。
//返回一个完整的字符设备号
int register_tty(tty_t* tty);
int unreigster_tty(int dev);
extern struct file_operations tty_fops;
extern int dev_tty;

