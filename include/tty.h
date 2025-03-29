#pragma once

#define TTY_WSTDERR 10
#define TTY_CONNECT 11
#define TTY_DISCONNECT 12
#define TTY_WSTDIN 13
#define TTY_WRKEYBUF 14

#define FLAG_BREAK 0x80
#define PIC1_COMMAND 0x20
#define PIC1_DATA 0x21
#define PIC2_COMMAND 0xA0
#define PIC2_DATA 0xA1

#define PS2_COMMAND 0x64
#define PS2_DATA 0x60

#define ICW1_ICW4 0x01        // ICW4 (not) needed
#define ICW1_SINGLE 0x02      // Single (cascade) mode
#define ICW1_INTERVAL4 0x04   // Call address interval 4 (8)
#define ICW1_LEVEL 0x08       // Level triggered (edge) mode
#define ICW1_INIT 0x10        // Initialization - required!

#define ICW4_8086 0x01         // 8086/88 (MCS-80/85) mode
#define ICW4_AUTO 0x02         // Auto (normal) EOI
#define ICW4_BUF_SLAVE 0x08    // Buffered mode/slave
#define ICW4_BUF_MASTER 0x0C   // Buffered mode/master
#define ICW4_SFNM 0x10         // Special fully nested (not)
#include "vfs.h"
//
typedef struct
{
    char* data;
    int   wptr, rptr, size;
} stdbuf_t;
typedef struct _tty_openbufs
{
    stdbuf_t              stdout_buf;
    stdbuf_t              stdin_buf;
    stdbuf_t              stderr_buf;
    int                   console_fd;
    struct _tty_openbufs* next;
} tty_openbufs;
#define CTLK_CTRL 0
#define CTLK_SHIFT 1
#define CTLK_CAPSLOCK 2
#define CTLK_ALT 3
#define CTLK_FN 4
typedef struct
{
    char*        text_buf;        //存储输出记录，显示在屏幕上
    int          text_buf_head;   //开始显示的地方在textbuf里面的偏移
    int          text_buf_tail, text_buf_size;
    int          show;       //输入回显
    int          readonly;   //只读
    unsigned int ctl_kmap;   //特殊按键的状态位图，例如左右ctrl、 shift这些按键。
    tty_openbufs* stds;
    int chars_width, chars_height;   //控制台显示屏的长宽参数，以字符为单位。
    int dev;                         //所属的tty设备设备号
    int link;                        //控制台的链接数
} tty_t;
#define MAX_TTYS 32
// long open_tty(struct index_node* inode, struct file* filp);
// long close_tty(struct index_node* inode, struct file* filp);
// long read_tty(struct file* filp, char* buf, unsigned long count, long* position);
// long write_tty(struct file* filp, char* buf, unsigned long count, long* position);
// long ioctl_tty(struct index_node* inode, struct file* filp, unsigned long cmd, unsigned long
// arg);
long open_tty(int dev);
long close_tty(int dev);
long read_tty(int dev, char* buf, unsigned long count, long* position);
long write_tty(int dev, char* buf, unsigned long count, long* position);
long ioctl_tty(struct index_node* inode, struct file* filp, unsigned long cmd, unsigned long arg);

int init_console();

//切换特殊按键状态
void switch_key(int bit, unsigned int* p_kmap);
//获取特殊按键状态
int get_key(int bit, unsigned int kmap);

void ps2_init();
void flush_textbuf(tty_t* tty);
int  key_proc();
void mouse_proc();
/**
    @brief 注册一个tty数据结构，要求tty中预先填好dev（关联的tty设备）, chars width 和chars height。
    @param tty 指向一个tty数据结构的指针。
    @return 成功返回索引值，失败返回ERRNO。
*/
int        register_tty(tty_t* tty);
int        unreigster_tty(int dev);
extern int drv_tty;