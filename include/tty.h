#pragma once

#define TTY_WSTDERR 0
#define TTY_CONNECT 1
#define TTY_DISCONNECT 2
#include "vfs.h"
//
typedef struct {
    char* data;
    int wptr,rptr,size;
}stdbuf_t;
typedef struct{
    stdbuf_t stdout_buf;
    stdbuf_t stdin_buf;
    stdbuf_t stderr_buf;
    int console_fd;
}tty_t;
long init_tty(struct index_node * inode,struct file * filp);
long close_tty(struct index_node * inode,struct file * filp);
long read_tty(struct file * filp,char * buf,unsigned long count,long * position);
long write_tty(struct file * filp,char * buf,unsigned long count,long * position);
long tty_do_req(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg);

