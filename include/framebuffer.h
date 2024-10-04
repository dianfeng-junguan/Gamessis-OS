#pragma once
//专门处理页帧（显存缓冲区）的功能。
#include <multiboot2.h>
#define FRAMEBUFFER_ADDR 0x40000000ul

#define PSF1_FONT_MAGIC 0x0436
struct psf1_header {
    unsigned short magic;     /* magic number for identification */
    unsigned char font_mode;  /* PSF font mode */
    unsigned char char_size;  /* PSF char size */
};
#define PSF2_FONT_MAGIC 0x864ab572
struct psf2_header {
    unsigned int magic;             /* magic number for PSF */
    unsigned int version;           /* zero */
    unsigned int header_size;       /* offset of bitmaps in file, 32 */
    unsigned int flags;             /* 0 if there's no unicode table */
    unsigned int glyph_nr;          /* number of glyphs */
    unsigned int bytes_per_glyph;   /* size of each glyph */
    unsigned int height;            /* height in pixels */
    unsigned int width;             /* width in pixels */
};

//映射页帧缓冲区
void init_framebuffer();
void set_framebuffer(struct multiboot_tag_framebuffer tag);

//图形绘制
void init_font();
void fill_rect(int x,int y,int w,int h,unsigned int color);
void draw_text(int x, int y, int size, char *str);
void draw_letter(int x, int y, int size, char c);
void print(char* s);

void scr_up();
void scr_down();