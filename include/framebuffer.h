#pragma once
//专门处理页帧（显存缓冲区）的功能。
#include <multiboot2.h>
#include "vfs.h"
#define FRAMEBUFFER_ADDR 0xffff800040000000ul
#define PSF1_FONT_MAGIC 0x0436
struct psf1_header
{
    unsigned short magic;     /* magic number for identification */
    unsigned char  font_mode; /* PSF font mode */
    unsigned char  char_size; /* PSF char size */
};
#define PSF2_FONT_MAGIC 0x864ab572
struct psf2_header
{
    unsigned int magic;           /* magic number for PSF */
    unsigned int version;         /* zero */
    unsigned int header_size;     /* offset of bitmaps in file, 32 */
    unsigned int flags;           /* 0 if there's no unicode table */
    unsigned int glyph_nr;        /* number of glyphs */
    unsigned int bytes_per_glyph; /* size of each glyph */
    unsigned int height;          /* height in pixels */
    unsigned int width;           /* width in pixels */
};
#define COLOR_BLACK 0x000000
#define COLOR_BLUE 0x0000FF
#define COLOR_GREEN 0x00FF00
#define COLOR_CYAN 0x00FFFF
#define COLOR_RED 0xFF0000
#define COLOR_MAGENTA 0xFF00FF
#define COLOR_YELLOW 0xFFFF00
#define COLOR_WHITE 0xFFFFFF
#define COLOR_GREY 0x808080
#define COLOR_LIGHTBLUE 0xADD8E6
#define COLOR_LIGHTGREEN 0x90EE90
#define COLOR_LIGHTCYAN 0xDA70D6
#define COLOR_LIGHTRED 0xFFA07A
#define COLOR_LIGHTMAGENTA 0xFFA07A
#define COLOR_LIGHTYELLOW 0xFFFFE0
#define COLOR_LIGHTWHITE 0xFFFFFF
#define COLOR_DARKBLUE 0x00008B
//映射页帧缓冲区
void init_framebuffer();
void set_framebuffer(struct multiboot_tag_framebuffer tag);

//图形绘制
void init_font();
void fill_rect(int x, int y, int w, int h, unsigned int color);
void draw_text(int x, int y, int size, char* str, unsigned int fgcolor, int flags);
void draw_line(int x1, int y1, int x2, int y2, int width, unsigned int color);
#define TEXT_BG_TRANSPARENT 1
void draw_letter(int x, int y, int size, char c, unsigned int fgcolor, int flags);
void print(char* s);
void printl(char* s, int len);
void framebuffer_set_curpos(int x, int y);

long open_framebuffer(struct index_node* inode, struct file* filp);
long close_framebuffer(struct index_node* inode, struct file* filp);
long read_framebuffer(struct file* filp, char* buf, unsigned long count, long* position);
long write_framebuffer(struct file* filp, char* buf, unsigned long count, long* position);
long ioctl_framebuffer(struct index_node* inode, struct file* filp, unsigned long cmd,
                       unsigned long arg);


void framebuffer_putchar(char c);
void scr_up();
void scr_down();
void erase();
void display(char ch);
void offset_cursor(int dx, int dy);

extern struct file_operations framebuffer_fops;
extern int                    drv_framebuffer;
