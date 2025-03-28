#include "ioctlarg.h"
#include "memman.h"
#include "tty.h"
#include "com.h"
#include "driverman.h"
#include "int.h"
#include "memory.h"
#include "framebuffer.h"
#include "fcntl.h"
#include "proc.h"
#include "signal.h"
#include "syscall.h"
#include "kb.h"
#include "com/mem.h"
#include "errno.h"
#include "log.h"
#include "wndman.h"
#include "sys/stat.h"
/**
    @brief 控制台窗口实例。
*/
int    stdd = 0;
tty_t* l_tty;
void   write_textbuf(char ch, tty_t* tty);
// dev:完整的设备号
tty_t* get_tty(int dev)
{
    if (dev < 0 || dev >= MAX_TTYS)
        return NULL;
    for (int i = 0; i < MAX_TTYS; i++) {
        if (l_tty[i].dev == dev)
            return l_tty + i;
    }
    return NULL;
}
long close_tty(int dev)
{
    tty_t*        tty  = get_tty(dev);
    tty_openbufs* opbf = tty->stds;
    stdbuf_t*     bi   = &opbf->stdin_buf;
    stdbuf_t*     bo   = &opbf->stdout_buf;
    stdbuf_t*     be   = &opbf->stderr_buf;
    kfree((addr_t)bi);
    kfree((addr_t)bo);
    kfree((addr_t)be);
    // kfree((addr_t) filp->private_data);
    return 1;
}

//打开文件
long open_tty(int dev)
{
    tty_t* t_tty = NULL;

    for (int i = 0; i < MAX_TTYS; i++) {
        if (l_tty[i].dev == dev) {
            t_tty = l_tty + i;
            break;
        }
    }
    if (!t_tty) {
        return -ENOMEM;
    }
    tty_openbufs* ntty = (tty_openbufs*)kmalloc(PAGE_4K_SIZE, NO_ALIGN);
    //创建三个缓冲区
    ntty->stdin_buf.data  = (char*)kmalloc(PAGE_4K_SIZE, NO_ALIGN);
    ntty->stdout_buf.data = (char*)kmalloc(PAGE_4K_SIZE, NO_ALIGN);
    ntty->stderr_buf.data = (char*)kmalloc(PAGE_4K_SIZE, NO_ALIGN);
    ntty->stdin_buf.wptr  = 0;
    ntty->stdout_buf.wptr = 0;
    ntty->stderr_buf.wptr = 0;
    ntty->stdin_buf.rptr  = 0;
    ntty->stdout_buf.rptr = 0;
    ntty->stderr_buf.rptr = 0;
    ntty->stdin_buf.size  = PAGE_4K_SIZE;
    ntty->stdout_buf.size = PAGE_4K_SIZE;
    ntty->stderr_buf.size = PAGE_4K_SIZE;
    //设置inode文件操作方式为tty方式
    // inode->f_ops = &tty_fops;
    // filp->f_ops  = &tty_fops;
    ntty->next = NULL;
    // filp->private_data=ntty;

    t_tty->stds = ntty;
    return 1;
}

long read_tty(int dev, char* buf, unsigned long count, long* position)
{
    tty_t* tty = get_tty(dev);
    if (!tty) {
        comprintf("read tty.err: tty NULL\n");
        return -1;
    }
    tty_openbufs* opbf = tty->stds;
    stdbuf_t*     b    = &opbf->stdin_buf;
    if (b < KNL_BASE) {
        printfk("error read_tty: invalid stdin:%x\n", b);
        return -1;
    }
    int i = 0;
    sti();
    while (i < count) {
        if (b->rptr == b->size)
            b->rptr = 0;
        if (b->rptr == b->wptr) {
            continue;
        }
        buf[i++] = b->data[b->rptr];
        b->rptr++;
        *position++;
    }
    cli();
    return i;
}
long write_tty(int dev, char* buf, unsigned long count, long* position)
{
    tty_openbufs* opbf       = get_tty(dev)->stds;
    stdbuf_t*     b          = &opbf->stdout_buf;
    int           i          = 0;
    int           saved_wptr = b->wptr;
    tty_t*        tty        = get_tty(dev);
    while (i < count) {
        if (b->wptr == b->size)
            b->wptr = 0;
        b->data[b->wptr] = buf[i];
        b->wptr++;
        write_textbuf(buf[i], tty);
        i++;
        *position++;
    }
    //刷新到framebuffer
    flush_textbuf(tty);
    // write_framebuffer(filp,b->data+saved_wptr,count,0);
}
/*
 * TTY_WSTDERR:写stderr。
 * arg指向连续存储的参数内存所在。
 * 依次存放：buf(char*),count(unsigned long)
 * TTY_CONNECT:尝试连接到dev/console,这样会成为controlling terminal,里面的数据才能输出到屏幕上，
 * 因为除了特殊指定的进程都会有一个自己的天tty。
 * 成功返回0。
 * */
long ioctl_tty(struct index_node* inode, struct file* filp, unsigned long cmd, unsigned long arg)
{
    stdbuf_t*     b          = &((tty_openbufs*)filp->private_data)->stderr_buf;
    stdbuf_t*     ib         = &((tty_openbufs*)filp->private_data)->stdin_buf;
    int           i          = 0;
    char*         buf        = *((char**)arg);
    unsigned long count      = *((unsigned long*)(arg + 8));
    int           saved_wptr = b->wptr;
    int           fd         = -1;
    switch (cmd) {
    case TTY_WSTDERR:
        while (i < count) {
            if (b->wptr == b->size)
                b->wptr = 0;
            b->data[b->wptr] = buf[i++];
            b->wptr++;
        }
        //刷新到framebuffer
        write_framebuffer(filp, b->data + saved_wptr, count, 0);
        break;
    case TTY_CONNECT:
        fd = sys_open("dev/console", O_WRONLY | O_CREAT | O_EXCL);
        if (fd == -1)
            return -1;
        ((tty_openbufs*)filp->private_data)->console_fd = fd;
        break;
    case TTY_DISCONNECT:
        fd = ((tty_openbufs*)filp->private_data)->console_fd;
        if (fd == -1)
            return -1;
        sys_close(fd);
    case TTY_WSTDIN:
        while (i < count) {
            if (ib->wptr == ib->size)
                ib->wptr = 0;
            ib->data[ib->wptr] = buf[i++];
            ib->wptr++;
        }
        break;
    default: return -1;
    }
    return 0;
}

int tty_mod_init(int drvid)
{
    // dev_tty = drvid;
}
int      tty_mod_exit() {}
drvret_t tty_mod_ioctl(int command, unsigned long long arg)
{
    int rv = 1;
    switch (command) {
    case DRIVER_CMD_READ:
    {
        int           dev      = GET_ARG(arg, 0, int);
        char*         buf      = GET_ARG(arg, 1, char*);
        unsigned long count    = GET_ARG(arg, 2, unsigned long);
        long*         position = GET_ARG(arg, 3, long*);
        rv                     = read_tty(dev, buf, count, position);
        break;
    }
    case DRIVER_CMD_WRITE:
    {
        int           dev      = GET_ARG(arg, 0, int);
        char*         buf      = GET_ARG(arg, 1, char*);
        unsigned long count    = GET_ARG(arg, 2, unsigned long);
        long*         position = GET_ARG(arg, 3, long*);
        rv                     = write_tty(dev, buf, count, position);
        break;
    }
    case DRIVER_CMD_OPEN:
    {
        int dev = GET_ARG(arg, 0, int);
        rv      = open_tty(dev);
        break;
    }
    case DRIVER_CMD_CLOSE:
    {
        int dev = GET_ARG(arg, 0, int);
        rv      = close_tty(dev);
        break;
    }
    case TTY_WSTDERR:
    {
        struct file*  filp       = GET_ARG(arg, 0, struct file*);
        char*         buf        = GET_ARG(arg, 1, char*);
        unsigned long count      = GET_ARG(arg, 2, unsigned long);
        stdbuf_t*     b          = &((tty_openbufs*)filp->private_data)->stderr_buf;
        stdbuf_t*     ib         = &((tty_openbufs*)filp->private_data)->stdin_buf;
        int           i          = 0;
        int           saved_wptr = b->wptr;
        while (i < count) {
            if (b->wptr == b->size)
                b->wptr = 0;
            b->data[b->wptr] = buf[i++];
            b->wptr++;
        }
        //刷新到framebuffer
        rv = write_framebuffer(filp, b->data + saved_wptr, count, 0);
        break;
    }
    case TTY_CONNECT:
    {
        struct file* filp = GET_ARG(arg, 0, struct file*);
        int          fd   = sys_open("dev/console", O_WRONLY | O_CREAT | O_EXCL);
        if (fd == -1)
            return -1;
        ((tty_openbufs*)filp->private_data)->console_fd = fd;
        break;
    }
    case TTY_DISCONNECT:
    {
        struct file* filp = GET_ARG(arg, 0, struct file*);
        int          fd   = ((tty_openbufs*)filp->private_data)->console_fd;
        if (fd == -1)
            return -1;
        rv = sys_close(fd);
    }
    case TTY_WSTDIN:
    {
        struct file*  filp  = GET_ARG(arg, 0, struct file*);
        char*         buf   = GET_ARG(arg, 1, char*);
        unsigned long count = GET_ARG(arg, 2, unsigned long);
        stdbuf_t*     b     = &((tty_openbufs*)filp->private_data)->stderr_buf;
        stdbuf_t*     ib    = &((tty_openbufs*)filp->private_data)->stdin_buf;
        int           i     = 0;
        while (i < count) {
            if (ib->wptr == ib->size)
                ib->wptr = 0;
            ib->data[ib->wptr] = buf[i++];
            ib->wptr++;
        }
        break;
    }
    default: rv = -1; break;
    }
    change_driver_stat(drv_tty, DRIVER_STAT_DONE);
    next_request(drv_tty);
    return rv;
}
// void __attribute__((interrupt)) _key_proc(void* arg, unsigned long long code)
// {
//     key_proc();
// }
//初始化主控制台。
int init_console()
{
    l_tty = kmalloc(sizeof(tty_t) * MAX_TTYS, NO_ALIGN);
    for (int i = 0; i < MAX_TTYS; i++) {
        l_tty[i].stds          = NULL;
        l_tty[i].text_buf      = NULL;
        l_tty[i].text_buf_head = 0;
        l_tty[i].text_buf_tail = 0;
        l_tty[i].dev           = -1;
    }
    extern void _key_proc(), _mouse_proc();
    // set_gate(0x21, (addr_t)key_proc, GDT_SEL_CODE, GATE_PRESENT | INT_GATE);
    register_int(0x21, _key_proc, key_proc, GATE_PRESENT | INT_GATE);
    register_int(0x2c, _mouse_proc, mouse_proc, GATE_PRESENT | INT_GATE);
    ps2_init();
    if ((drv_tty = register_driver(tty_mod_init, tty_mod_exit, tty_mod_ioctl)) < 0) {
        return -1;
    }
}

char to_ascii(char scan_code, int cap)
{
    for (int i = 0; i < 0x5e; i++)   // sizeof(key_map)/sizeof(key_code)
        if (key_map[i].scan_code == scan_code) {
            if (cap && key_map[i].ascii >= 'a' && key_map[i].ascii <= 'z')
                return key_map[i].ascii_shift;
            else if (cap)
                return key_map[i].ascii_shift;
            else
                return key_map[i].ascii;
        }

    return '\0';
}
//计算text buffer里面head到tail之间的距离
int txtbf_distance(tty_t* tty)
{
    int c = 0;
    for (int i = tty->text_buf_head; i != tty->text_buf_tail; i = (i + 1) % tty->text_buf_size, c++)
        ;
    return c;
}
//计算text buffer里面head到tail之间的字符占用了多少行
int txtbf_distancel(tty_t* tty)
{
    int c = 0;
    c     = (txtbf_distance(tty) - 1 + tty->chars_width) / tty->chars_width;
    return c;
}
//将text buffer的指针后移，到末尾自动回到开头
void txtbf_forward(int* ptr, int offset, tty_t* tty)
{
    *ptr = (*ptr + offset) % (tty->text_buf_size);
}

//填充一行剩下的字符
void fill_rest_of_line(tty_t* tty, char c)
{
    int line = tty->chars_width;
    int lc   = txtbf_distance(tty);
    for (; lc % line; lc++) {
        tty->text_buf[tty->text_buf_tail] = c;
        txtbf_forward(&tty->text_buf_tail, 1, tty);
    }
}
//向当前进程的tty的屏幕显示文字缓冲写入字符。
void write_textbuf(char ch, tty_t* tty)
{
    switch (ch) {
    case '\n': fill_rest_of_line(tty, ' '); break;
    case '\b':
    case '\r':
        txtbf_forward(&tty->text_buf_tail, -1, tty);
        erase();   //擦除光标
        offset_cursor(-1, 0);
        erase();
        break;
    case '\t':
        for (int i = 0; i < 4; i++) {
            tty->text_buf[tty->text_buf_tail] = ' ';
            txtbf_forward(&tty->text_buf_tail, 1, tty);
        }
        break;
    default:
        tty->text_buf[tty->text_buf_tail] = ch;
        txtbf_forward(&tty->text_buf_tail, 1, tty);
        break;
    }
    //显示光标
    if (ch != '\b') {
        offset_cursor(1, 0);
        display('_');
        offset_cursor(-1, 0);
    }
    else {
        display('_');
    }

    if (txtbf_distancel(tty) == tty->chars_height) {
        //到达最后一行，应当上滚
        txtbf_forward(&tty->text_buf_head, tty->chars_width, tty);
    }
}

void switch_key(int bit, unsigned int* p_kmap)
{
    unsigned int b = 1u << bit;
    if (*p_kmap & b)
        *p_kmap &= ~b;
    else
        *p_kmap |= b;
}
int get_key(int bit, unsigned int kmap)
{
    unsigned int b = 1u << bit;
    return kmap & b;
}
int key_proc()
{
    // comprintf("key proc\n");
    //获取完整的扫描码
    unsigned char scan1 = 0, scan2 = 0, ch = 0;
    if (!current->openf[current->tty_fd]) {
        return 0;
    }
    tty_t* tty = get_tty(current->openf[current->tty_fd]->dentry->dir_inode->dev);
    scan1      = inb(0x60);
    ch =
        to_ascii(scan1, get_key(CTLK_CAPSLOCK, tty->ctl_kmap) | get_key(CTLK_SHIFT, tty->ctl_kmap));
    if (scan1 == 0xe0 || scan1 == 0xe1) {
        scan2 = inb(0x60);
        ch    = to_ascii(scan2,
                      get_key(CTLK_CAPSLOCK, tty->ctl_kmap) | get_key(CTLK_SHIFT, tty->ctl_kmap));
    }

    switch (scan1) {
    case 0x36:
    case 0x2a:
    case 0xaa:
    case 0xb6: switch_key(CTLK_SHIFT, &tty->ctl_kmap); break;
    case 0x1d:
    case 0x9d: switch_key(CTLK_CTRL, &tty->ctl_kmap); break;
    case 0x3a: switch_key(CTLK_CAPSLOCK, &tty->ctl_kmap); break;
    case 0xe0:
    case 0xe1:
        if (scan2 == 0x48)
            scr_up();
        if (scan2 == 0x50)
            scr_down();
        break;
    default: break;
    }
    //发送到std
    if (!(scan1 & FLAG_BREAK) && ch < 0x80 && !tty->readonly) {
        if ((ch == 'c' || ch == 'C') && get_key(CTLK_CTRL, tty->ctl_kmap)) {
            // ctrl+c
            send_signal(current->pid, SIGINT);
        }
        //写入stdin
        for (tty_openbufs* tp = tty->stds; tp; tp = tp->next) {
            stdbuf_t* stdin            = &tp->stdin_buf;
            stdin->data[stdin->wptr++] = ch;
            stdin->wptr %= stdin->size;
        }
        //回显到屏幕上
        if (tty->show) {
            com_putchar(ch, PORT_COM1);
            // write_textbuf(ch, tty);
            // flush_textbuf(tty);
        }
    }
    if (scan1 & FLAG_BREAK) {
        _on_key_up(ch);
    }
    else {
        _on_key_down(ch);
    }
}

void flush_textbuf(tty_t* tty)
{
    framebuffer_set_curpos(0, 0);
    int tot = tty->chars_height * tty->chars_width, len = tot, dis = txtbf_distance(tty);
    if (len > dis)
        len = dis;
    int i = 0;
    for (; i < len; i++) {
        char c = tty->text_buf[(tty->text_buf_head + i) % tty->text_buf_size];
        framebuffer_putchar(c);
        // com_putchar(c, PORT_COM1);
    }
    //剩下没有字符部分用空格填充
    // for(;i<tot;i++){
    //     framebuffer_putchar(' ');
    // }
}

int register_tty(tty_t* tty)
{
    tty_t* target = NULL;
    int    i      = 0;
    for (; i < MAX_TTYS; i++) {
        if (l_tty[i].dev < 0) {
            target = l_tty + i;
            break;
        }
    }
    if (!target)
        return -ENOMEM;
    target->chars_height = tty->chars_height;
    target->chars_width  = tty->chars_width;
    target->dev          = tty->dev;

    int page_size = tty->chars_height * tty->chars_width;

    target->text_buf = kmalloc(2 * page_size, NO_ALIGN);
    memset(target->text_buf, 0, 2 * page_size);
    target->text_buf_size = 2 * page_size;
    target->show          = 1;
    target->readonly      = 0;
    return i;
}
int unreigster_tty(int dev)
{
    for (int i = 0; i < MAX_TTYS; i++) {
        if (l_tty[i].dev == dev) {
            tty_t* t_tty = l_tty + i;
            kfree(t_tty->text_buf);
            t_tty->text_buf = NULL;
            t_tty->dev      = -1;
            return 0;
        }
    }
    return -1;
}
int prev_mouse_button = -1;
int mouse_btns[3]     = {0, 0, 0};
int mouse_x           = 0;
int mouse_y           = 0;
int mouse_sens        = 80;
int mouse_maxspeed    = 15;
int clamp(int v, int min, int max)
{
    return v < min ? min : (v > max ? max : v);
}
int           mouse_int_phase = 0;
unsigned char mouse_buf[3];

void mouse_proc()
{
    unsigned char b = inb(0x60);
    if (mouse_int_phase == 0) {

        if (b == 0xfa) {
            mouse_int_phase = 1;
        }
    }
    else if (mouse_int_phase == 1) {

        if ((b & 0xc8) == 0x08) {

            mouse_buf[0]    = b;
            mouse_int_phase = 2;
        }
    }
    else if (mouse_int_phase == 2) {

        mouse_buf[1]    = b;
        mouse_int_phase = 3;
    }
    else if (mouse_int_phase == 3) {

        mouse_buf[2]               = b;
        mouse_int_phase            = 1;
        unsigned char mouse_button = mouse_buf[0] & 0x07;

        int x = mouse_buf[1];
        int y = mouse_buf[2];
        if ((mouse_buf[0] & 0x10) != 0) {
            x |= 0xffffff00;
        }
        if ((mouse_buf[0] & 0x20) != 0) {
            y |= 0xffffff00;
        }

        for (int i = 0; i < 1; i++) {
            int newstat = mouse_button & (1 << i) ? 1 : 0;
            if (mouse_btns[i] != newstat) {
                if (newstat) {
                    _on_mouse_down(x, y, i);
                }
                else {
                    _on_mouse_up(x, y, i);
                }
                mouse_btns[i] = newstat;
            }
        }

        if (x || y) {
            //鼠标移动
            int dx = x * mouse_sens / 100;
            int dy = y * mouse_sens / 100;
            dx     = clamp(dx, -mouse_maxspeed, mouse_maxspeed);
            dy     = clamp(dy, -mouse_maxspeed, mouse_maxspeed);
            mouse_x += dx;
            mouse_y -= dy;
            mouse_x = clamp(mouse_x, 0, 1023);
            mouse_y = clamp(mouse_y, 0, 767);
            _on_mouse_move(mouse_x, mouse_y);
        }
    }
}
// 初始化 PS/2 控制器
void ps2_init()
{
    // 等待输入缓冲区为空
    while (inb(PS2_COMMAND) & 0x02)
        ;

    // 发送命令，启用鼠标
    outb(PS2_COMMAND, 0xA8);

    // 等待输入缓冲区为空
    while (inb(PS2_COMMAND) & 0x02)
        ;

    // 读取控制器状态
    outb(PS2_COMMAND, 0x20);
    char status = inb(PS2_DATA);

    // 设置状态寄存器，启用鼠标和键盘中断
    status |= 0x02;
    status |= 0x01;

    // 等待输入缓冲区为空
    while (inb(PS2_COMMAND) & 0x02)
        ;

    // 写入新的状态寄存器值
    outb(PS2_COMMAND, 0x60);
    outb(PS2_DATA, status);

    // 等待输入缓冲区为空
    while (inb(PS2_COMMAND) & 0x02)
        ;

    // 向鼠标发送激活命令
    outb(PS2_COMMAND, 0xD4);
    outb(PS2_DATA, 0xF4);
}
console_t* all_consoles;

int init_conhost()
{
    all_consoles = 0;
    if (create_kthread(conhost_thread) < 0) {
        panic("create conhost thread failed");
    }
    return 0;
}
static int _tty_nameid = 0;
/**
    @brief 创建控制台窗口，作为新进程的窗口
*/
console_t* create_console()
{
    console_t* console = kmalloc(sizeof(console_t), NO_ALIGN);
    if (!console) {
        return NULL;
    }

    console->console_wnd = create_window("Console", WNDTYPE_WINDOW);
    if (!console->console_wnd) {
        close_tty(console->tty);
        kfree(console);
        return NULL;
    }
    windowptr_t displaycontent_editbox = create_window("console", WNDTYPE_EDITBOX);
    move_window(displaycontent_editbox, 0, 0);
    attach_window(displaycontent_editbox, console->console_wnd);
    show_window(displaycontent_editbox);

    char name[16]  = "tty";
    int  i         = 3;
    int  new_ttyid = _tty_nameid++;
    for (; i < 16; i++) {
        name[i] = '0' + (new_ttyid % 10);
        new_ttyid /= 10;
    }
    name[i] = 0;

    dev_t new_ttydev = reg_device(name, S_IFCHR, drv_tty, drv_tty);
    console->tty_dev = new_ttydev;
    console->tty     = open_tty(new_ttydev);
    if (!all_consoles) {
        all_consoles = console;
    }
    else {
        console_t* p = all_consoles;
        while (p->next) {
            p = p->next;
        }
        p->next = console;
    }
    return console;
}
int destroy_console(console_t* console)
{
    if (!console) {
        return -1;
    }
    if (console == all_consoles) {
        all_consoles = console->next;
    }
    else {
        console_t* p = all_consoles;
        while (p->next != console) {
            p = p->next;
        }
        p->next = console->next;
    }
    destroy_window(console->console_wnd);
    unreg_device(console->tty_dev);
    close_tty(console->tty);
    kfree(console);
    return 0;
}
void conhost_thread()
{
    while (1) {
        console_t* console = all_consoles;
        while (console) {
            window_event_t event;
            //控制台窗口只使用简单地gets,scanf等函数获取输入，因此需要conhost托管处理事件
            if (do_fetch_event(console->last_attaching_task, &event) < 0)
                continue;
            if (event.event_type == WND_EVENT_KEY_DOWN) {
                char              ch        = event.key_code;
                drvioctlarg_write ioctl_arg = {
                    .buf   = &ch,
                    .count = 1,
                    .dev   = console->tty_dev,
                };
                tty_mod_ioctl(DRIVER_CMD_WRITE, &ioctl_arg);
            }
            default_deal_window_event(&event);

            console = console->next;
        }
    }
}
/**
    @brief 将一个进程附着到一个控制台窗口上，该进程将使用该控制台的std
    @param pid 要附着的进程id
    @param console 要附着到的控制台窗口
    @return 成功返回0，失败返回-1
*/
int attach_to_console(pid_t pid, console_t* console)
{
    task[pid].attached_console = console;
    // TODO 切换std，即重新设置前三个opened files
    console->last_attaching_task = pid;
    console->link++;
    return 0;
}
int detach_console(pid_t pid)
{
    console_t* console = task[pid].attached_console;
    console->link--;
    task[pid].attached_console = NULL;
    // 切换std，即重新设置前三个opened files
    for (int i = 0; i < 3; i++) {
        task[pid].openf[i] = NULL;
    }

    // 检查该控制台是否已经没有进程在用了，如果是就释放这个控制台
    if (console->link == 0) {
        destroy_console(console);
    }
    return 0;
}