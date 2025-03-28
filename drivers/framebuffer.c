#include <framebuffer.h>
#include <memory.h>
#include <typename.h>
#include "driverman.h"
#include "memman.h"
#include "sys/types.h"
#include "com/mem.h"
#include "syscall.h"
#include "sys/mman.h"
#include "log.h"
#include "tty.h"

struct multiboot_tag_framebuffer framebuffer;

bitmap_buffer* list_bitmap_buffers;
bitmap_buffer* display_buffer;
bitmap_buffer* backstage_buffer;
//内核内嵌字体
extern char __attribute__((weak)) _binary_res_font_psf_start[];
extern char __attribute__((weak)) _binary_res_font_psf_end[];

/* char output info */

static u32 fb_cursor_x = 0, fb_cursor_y = 0; /* count by chars */
static u32 max_ch_nr_x, max_ch_nr_y;
int        drv_framebuffer;
/* font info */

static struct psf2_header* boot_font;
static u32                 font_width, font_height;
static u32                 font_width_bytes;
static u8*                 glyph_table;
static u32                 bytes_per_glyph, glyph_nr;
static char*               text_buffer;
static int                 txtbfh = 0, txtbft = 0, max_chs = 0;
int                        font_size = 1;
int                        drv_tty;

/**
    @brief
   framebuffer模块初始化占位函数，因为这个模块是直接编译进内核的，
   所以是由init函数调用register_driver函数注册的，这里如果再调用init_framebuffer就死循环了。
    @return 0
 */
int framebuffer_mod_init(int dev_id)
{
    return 0;
}
int framebuffer_mod_exit()
{
    return 0;
}
int  framebuffer_mod_ioctl(int cmd, unsigned long long arg) {}
void init_framebuffer()
{
    //映射页帧内存
    size_t w     = framebuffer.common.framebuffer_width;
    size_t h     = framebuffer.common.framebuffer_height;
    size_t bypp  = framebuffer.common.framebuffer_bpp / 8;
    size_t inter = framebuffer.common.framebuffer_pitch;
    size_t pc    = w * h;
    size_t size  = h * inter;
    int    pgc   = size / PAGE_SIZE;
    addr_t p     = FRAMEBUFFER_ADDR;
    addr_t pp    = framebuffer.common.framebuffer_addr;
    for (size_t i = 0; i < pgc; i++) {
        smmap(pp, p, PAGE_PRESENT | PAGE_RWX | PAGE_FOR_ALL, PML4_ADDR);
        pp += PAGE_SIZE;
        p += PAGE_SIZE;
    }
    //申请位图缓冲区
    _create_display_bitmap_buffer(FRAMEBUFFER_ADDR,
                                  framebuffer.common.framebuffer_width,
                                  framebuffer.common.framebuffer_height,
                                  framebuffer.common.framebuffer_bpp,
                                  framebuffer.common.framebuffer_pitch,
                                  size);
    if ((backstage_buffer = create_bitmap_buffer(w, h, bypp * 8, inter, size)) == NULL) {
        comprintf("FATAL: backstage buffer create failed\n");
        die();
    }
    if ((drv_framebuffer = register_driver(
             framebuffer_mod_init, framebuffer_mod_exit, framebuffer_mod_ioctl)) < 0) {
        return;
    }
}
void init_font()
{
    boot_font = (struct psf2_header*)(_binary_res_font_psf_start);

    font_width_bytes = (boot_font->width + 7) / 8;
    font_width       = font_width_bytes * 8;
    font_height      = boot_font->height;

    glyph_table     = (u8*)(_binary_res_font_psf_start) + boot_font->header_size;
    glyph_nr        = boot_font->glyph_nr;
    bytes_per_glyph = boot_font->bytes_per_glyph;

    fb_cursor_x = fb_cursor_y = 0;
    max_ch_nr_x               = framebuffer.common.framebuffer_width / font_width;
    max_ch_nr_y               = framebuffer.common.framebuffer_height / font_height;
    font_size                 = 1;
    max_chs                   = max_ch_nr_x * max_ch_nr_y * 2;
    text_buffer               = kmalloc(max_chs, NO_ALIGN);
    txtbfh                    = 0;
    txtbft                    = 0;
    tty_t tty                 = {.chars_height = max_ch_nr_y, .chars_width = max_ch_nr_x, .dev = 2};
    register_tty(&tty);
}
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
    framebuffer = tag;
}
void fill_rect(int x, int y, int w, int h, unsigned int color)
{

    int t = x;
    x     = y;
    y     = t;
    x     = x > 0 ? x : 0;
    y     = y > 0 ? y : 0;
    w     = w < framebuffer.common.framebuffer_width ? w : framebuffer.common.framebuffer_width;
    h     = h < framebuffer.common.framebuffer_height ? h : framebuffer.common.framebuffer_height;
    int maxy = h + x < framebuffer.common.framebuffer_height
                   ? h + x
                   : framebuffer.common.framebuffer_height;
    int maxx =
        w + y < framebuffer.common.framebuffer_width ? w + y : framebuffer.common.framebuffer_width;
    //目前只写32bpp
    for (int py = x; py < maxy; py++) {
        for (int px = y; px < maxx; px++) {
            set_pixel(backstage_buffer, px, py, color);
        }
    }
}
void fill_rect_old(int x, int y, int w, int h, unsigned int color)
{
    int t = x;
    x     = y;
    y     = t;
    x     = x > 0 ? x : 0;
    y     = y > 0 ? y : 0;
    w     = w < framebuffer.common.framebuffer_width ? w : framebuffer.common.framebuffer_width;
    h     = h < framebuffer.common.framebuffer_height ? h : framebuffer.common.framebuffer_height;
    int maxy = h + x < framebuffer.common.framebuffer_height
                   ? h + x
                   : framebuffer.common.framebuffer_height;
    int maxx =
        w + y < framebuffer.common.framebuffer_width ? w + y : framebuffer.common.framebuffer_width;
    unsigned int* fb = (unsigned int*)FRAMEBUFFER_ADDR;
    //目前只写32bpp
    for (int py = x; py < maxy; py++) {
        for (int px = y; px < maxx; px++) {
            addr_t ptr = FRAMEBUFFER_ADDR + py * framebuffer.common.framebuffer_pitch +
                         px * framebuffer.common.framebuffer_bpp / 8;
            fb  = (unsigned int*)ptr;
            *fb = color;
        }
    }
}
void draw_line(int x1, int y1, int x2, int y2, int width, unsigned int color)
{
    if (x1 > x2) {
        int t = x1;
        x1    = x2;
        x2    = t;
    }
    if (y1 > y2) {
        int t = y1;
        y1    = y2;
        y2    = t;
    }
    if (x1 == x2) {
        for (int py = y1; py < y2; py++) {
            int px = x1 + (py - y1) * (x2 - x1) / (y2 - y1);
            fill_rect(px, py, width, width, color);
        }
    }
    else {
        for (int py = x1; py < x2; py++) {
            int px = y1 + (py - x1) * (y2 - y1) / (x2 - x1);
            fill_rect(py, px, width, width, color);
        }
    }
}

unsigned char letters[];
void          draw_text(int x, int y, int size, char* str, unsigned int fgcolor, int flags)
{
    int tx = x;
    while (*str != '\0') {
        if (*str == '\n') {
            y += font_height * size;
            tx = x;
        }
        else {
            draw_letter(tx, y, size, *str, fgcolor, flags);
            tx += size * font_width;
        }
        str++;
    }
}

//立即在屏幕上清除当前光标位置的字符，但是不会修改文本缓冲区
void erase()
{
    draw_letter(fb_cursor_x * font_width * font_size,
                fb_cursor_y * font_height * font_size,
                font_size,
                ' ',
                COLOR_BLACK,
                0);
}

//立即在屏幕上当前光标位置显示字符，但是不会修改文本缓冲区
void display(char ch)
{
    draw_letter(fb_cursor_x * font_width * font_size,
                fb_cursor_y * font_height * font_size,
                font_size,
                ch,
                COLOR_WHITE,
                0);
}
void offset_cursor(int dx, int dy)
{
    fb_cursor_x += dx;
    fb_cursor_y += dy;
    if (fb_cursor_x < 0) {
        fb_cursor_x += max_ch_nr_x;
        fb_cursor_y--;
    }
    else if (fb_cursor_x >= max_ch_nr_x) {
        fb_cursor_x -= max_ch_nr_x;
        fb_cursor_y++;
    }
    if (fb_cursor_y < 0) {
        fb_cursor_y = 0;
    }
    else if (fb_cursor_y >= max_ch_nr_y) {
        fb_cursor_y = 0;
    }
}
void draw_letter(int x, volatile int y, int size, char c, unsigned int fgcolor, int flags)
{
    u8* glyph = glyph_table;
    if (c < glyph_nr) {
        glyph += c * bytes_per_glyph;
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
        u8 mask = 1 << 7;

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
            int  px  = x + ch_x * size;
            int  py  = y + ch_y * size;
            int* ptr = backstage_buffer->buffer + py * framebuffer.common.framebuffer_pitch +
                       px * framebuffer.common.framebuffer_bpp / 8;
            if ((*(glyph + ch_x / 8) & mask) != 0) {
                *ptr = fgcolor;
            }
            else if (!(flags & TEXT_BG_TRANSPARENT)) {
                *ptr = 0;
            }

            mask >>= 1;
            if (ch_x % 8 == 0) {
                mask = 1 << 7;
            }
        }

        glyph += font_width_bytes;
    }
}
void print_textbuffer()
{
    int c = 0;
    for (int i = txtbfh; i != txtbft; i = (i + 1) % max_chs) {
        if (text_buffer[i] == '\0')
            break;
        if (text_buffer[i] == '\n') {
            //剩下用空格填满
            for (; fb_cursor_x < max_ch_nr_x; fb_cursor_x++)
                draw_letter(fb_cursor_x * font_width * font_size,
                            fb_cursor_y * font_height * font_size,
                            font_size,
                            ' ',
                            COLOR_WHITE,
                            0);

            fb_cursor_y += 1;
            fb_cursor_x = 0;
            continue;
        }
        if (fb_cursor_x > max_ch_nr_x) {
            fb_cursor_y += 1;
            fb_cursor_x = 0;
        }
        if (fb_cursor_y >= max_ch_nr_y - 1) {
            fb_cursor_y = max_ch_nr_y - 1;
            // fb_cursor_y=0;
        }
        draw_letter(fb_cursor_x * font_width * font_size,
                    fb_cursor_y * font_height * font_size,
                    font_size,
                    text_buffer[i],
                    COLOR_WHITE,
                    0);
        fb_cursor_x += 1;
        c++;
        if (c >= max_chs)
            break;
    }
}
//向上滚动一行
void scr_up()
{
    for (; text_buffer[txtbfh] != '\n' && txtbfh != txtbft; txtbfh = (txtbfh + 1) % max_chs)
        ;
    if ((txtbfh + 1) % max_chs != txtbft)
        txtbfh = (txtbfh + 1) % max_chs;
    fb_cursor_x         = 0;
    fb_cursor_y         = 0;
    text_buffer[txtbft] = '\0';
    print_textbuffer();
    // for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
    //     for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
    //         char *p=(char*)(FRAMEBUFFER_ADDR+
    //                 dy*framebuffer.common.framebuffer_pitch
    //                 +dx*framebuffer.common.framebuffer_bpp/8);
    //         *p=*(p+framebuffer.common.framebuffer_pitch);
    //         p++;
    //     }

    // }
    //    for(int i=0;i<
    //    framebuffer.common.framebuffer_width*framebuffer.common.framebuffer_bpp/8;i++)
    //        *(p++)=0;
}
void scr_down()
{
    unsigned int prev_fbx = fb_cursor_x, prev_fby = fb_cursor_y;
    fb_cursor_x         = 0;
    fb_cursor_y         = 0;
    char* p             = text_buffer[txtbfh];
    text_buffer[txtbft] = '\0';
    while (*p && p != text_buffer + txtbft && *p != '\n') {
        p--;
        if (p == text_buffer)
            p = text_buffer + max_chs - 1;
    }
    p = text_buffer + (p - text_buffer + 1) % max_chs;
    print(p);
    // for(int dy=1;dy<max_ch_nr_y;dy++){
    //     for(int dx=0;dx<max_ch_nr_x;dx++){
    //         char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
    //                         +dx*framebuffer.common.framebuffer_bpp/8);
    //         *p=*(p-framebuffer.common.framebuffer_pitch);
    //     }

    // }
}
void print(char* s)
{
    // if(!verify_area(s, 1, PROT_READ)){
    //     comprintf("frambuffer.err:invalid mem:%l\n",s);
    //     return;
    // }
    for (; *s; s++) {
        text_buffer[txtbft++] = *s;
        if (txtbft == max_chs)
            txtbft = 0;
        if (*s == '\n') {
            //剩下用空格填满
            for (; fb_cursor_x < max_ch_nr_x; fb_cursor_x++)
                draw_letter(fb_cursor_x * font_width * font_size,
                            fb_cursor_y * font_height * font_size,
                            font_size,
                            ' ',
                            COLOR_WHITE,
                            0);

            fb_cursor_y += 1;
            fb_cursor_x = 0;
            continue;
        }
        if (fb_cursor_x > max_ch_nr_x) {
            fb_cursor_y += 1;
            fb_cursor_x = 0;
        }
        if (*s == '\n')
            continue;
        if (fb_cursor_y >= max_ch_nr_y - 1) {
            fb_cursor_y = max_ch_nr_y - 1;
            scr_up();
            // fb_cursor_y=0;
        }
        draw_letter(fb_cursor_x * font_width * font_size,
                    fb_cursor_y * font_height * font_size,
                    font_size,
                    *s,
                    COLOR_WHITE,
                    0);
        fb_cursor_x += 1;
    }
}
void framebuffer_putchar(char c)
{
    /* if(c=='\n'){
       //剩下用空格填满
       for(;fb_cursor_x<max_ch_nr_x;fb_cursor_x++)
           draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,'
   ');

       fb_cursor_y+=1;
       fb_cursor_x=0;
       return;
   } */
    if (fb_cursor_x >= max_ch_nr_x) {
        fb_cursor_y += 1;
        fb_cursor_x = 0;
    }
    //    if(c=='\n')return;
    if (fb_cursor_y >= max_ch_nr_y - 1) {
        fb_cursor_y = max_ch_nr_y - 1;
        //    scr_up();
    }
    draw_letter(fb_cursor_x * font_width * font_size,
                fb_cursor_y * font_height * font_size,
                font_size,
                c,
                COLOR_WHITE,
                0);
    fb_cursor_x += 1;
}
void printl(char* s, int len)
{
    for (int i = 0; i < len; i++, *s++) {
        text_buffer[txtbft++] = *s;
        if (txtbft == max_chs)
            txtbft = 0;
        if (*s == '\n') {
            //剩下用空格填满
            for (; fb_cursor_x < max_ch_nr_x; fb_cursor_x++)
                draw_letter(fb_cursor_x * font_width * font_size,
                            fb_cursor_y * font_height * font_size,
                            font_size,
                            ' ',
                            COLOR_WHITE,
                            0);

            fb_cursor_y += 1;
            fb_cursor_x = 0;
            continue;
        }
        if (fb_cursor_x > max_ch_nr_x) {
            fb_cursor_y += 1;
            fb_cursor_x = 0;
        }
        if (*s == '\n')
            continue;
        if (fb_cursor_y >= max_ch_nr_y - 1) {
            fb_cursor_y = max_ch_nr_y - 1;
            scr_up();
            // fb_cursor_y=0;
        }
        draw_letter(fb_cursor_x * font_width * font_size,
                    fb_cursor_y * font_height * font_size,
                    font_size,
                    *s,
                    COLOR_WHITE,
                    0);
        fb_cursor_x += 1;
    }
}
struct file_operations framebuffer_fops = {.open  = open_framebuffer,
                                           .close = close_framebuffer,
                                           .read  = read_framebuffer,
                                           .write = write_framebuffer,
                                           .ioctl = ioctl_framebuffer};
long                   open_framebuffer(struct index_node* inode, struct file* filp)
{
    inode->f_ops = &framebuffer_fops;
    filp->f_ops  = &framebuffer_fops;
    return 1;
}
long close_framebuffer(struct index_node* inode, struct file* filp) {}
long read_framebuffer(struct file* filp, char* buf, unsigned long count, long* position) {}
long write_framebuffer(struct file* filp, char* buf, unsigned long count, long* position)
{
    char* tmp = (char*)kmalloc(PAGE_4K_SIZE, NO_ALIGN);
    int   c = count / (PAGE_4K_SIZE - 1), p = 0;
    //一块一块输出
    for (int i = 0; i < (c ? c : 1); i++) {
        memcpy(tmp, buf + p, PAGE_4K_SIZE - 1);
        tmp[PAGE_4K_SIZE - 1] = 0;
        print(tmp);
        p += PAGE_4K_SIZE - 1;
    }
    kfree(tmp);
    return 0;
}
long ioctl_framebuffer(struct index_node* inode, struct file* filp, unsigned long cmd,
                       unsigned long arg)
{}

void framebuffer_set_curpos(int x, int y)
{
    fb_cursor_x = x;
    fb_cursor_y = y;
}
void set_pixel(bitmap_buffer* buffer, int x, int y, unsigned int color)
{
    if (y * buffer->pitch + x * buffer->bpp / 8 >= buffer->size) {
        return;
    }
    unsigned int* p1 = (char*)buffer->buffer + y * buffer->pitch + x * buffer->bpp / 8;
    *p1              = color;
}
unsigned int get_pixel(bitmap_buffer* buffer, int x, int y)
{
    unsigned int* p1 = (char*)buffer->buffer + y * buffer->pitch + x * buffer->bpp / 8;
    return *p1;
}
void clear_framebuffer(bitmap_buffer* buffer, unsigned int color)
{
    for (int py = 0; py < buffer->height; py++) {
        for (int px = 0; px < buffer->width; px++) {
            set_pixel(buffer, px, py, color);
        }
    }
}
void update_display()
{
    copy_to_display(backstage_buffer, 0, 0, display_buffer->width, display_buffer->height, 0, 0);
}
void copy_to_display(bitmap_buffer* buffer, int x, int y, int w, int h, int dx, int dy)
{
    for (int py = 0; py < w; py++) {
        for (int px = 0; px < h; px++) {
            unsigned int pbuf = get_pixel(buffer, px + x, py + y);
            set_pixel(display_buffer, px + dx, py + dy, pbuf);
        }
    }
}

int _create_display_bitmap_buffer(int* bufaddr, int width, int height, int bpp, int pitch, int size)
{
    display_buffer = (bitmap_buffer*)kmalloc(size, NO_ALIGN);
    if (!display_buffer)
        return -1;
    display_buffer->width  = width;
    display_buffer->height = height;
    display_buffer->bpp    = bpp;
    display_buffer->pitch  = pitch;
    display_buffer->size   = size;
    display_buffer->buffer = bufaddr;
    display_buffer->next   = NULL;
    list_bitmap_buffers    = display_buffer;
    return 0;
}
bitmap_buffer* create_bitmap_buffer(int width, int height, int bpp, int pitch, int size)
{
    bitmap_buffer* buffer = (bitmap_buffer*)kmalloc(size, NO_ALIGN);
    if (!buffer)
        return -1;
    buffer->width  = width;
    buffer->height = height;
    buffer->bpp    = bpp;
    buffer->pitch  = pitch;
    buffer->size   = size;
    // framebuffer太大了，不能用kmalloc
    buffer->buffer = (int*)buddy_alloc(size, NO_ALIGN);
    if (!buffer->buffer) {
        buddy_free(buffer);
        return -1;
    }
    buffer->next        = list_bitmap_buffers;
    list_bitmap_buffers = buffer;
    return buffer;
}
void free_bitmap_buffer(bitmap_buffer* buffer)
{
    bitmap_buffer *p = list_bitmap_buffers, *q = 0;
    while (p) {
        if (p == buffer) {
            if (q)
                q->next = p->next;
            else
                list_bitmap_buffers = p->next;
            kfree(p->buffer);
            kfree(p);
            return;
        }
        q = p;
        p = p->next;
    }
}