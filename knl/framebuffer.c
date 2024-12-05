#include <framebuffer.h>
#include <memory.h>
#include <typename.h>
#include "sys/types.h"
#include "mem.h"
#include "syscall.h"
#include "sys/mman.h"
#include "log.h"

struct multiboot_tag_framebuffer framebuffer;

//内核内嵌字体
extern char _binary_res_font_psf_start[];
extern char _binary_res_font_psf_end[];

/* char output info */

static u32 fb_cursor_x=0, fb_cursor_y=0;    /* count by chars */
static u32 max_ch_nr_x, max_ch_nr_y;

/* font info */

static struct psf2_header *boot_font;
static u32 font_width, font_height;
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
static char *text_buffer;
static int txtbfh=0,txtbft=0,max_chs=0;
int font_size=1;
void init_framebuffer()
{
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
    size_t h=framebuffer.common.framebuffer_height;
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
    size_t inter=framebuffer.common.framebuffer_pitch;
    size_t pc=w*h;
    size_t size=h*inter;
    int pgc=size/PAGE_SIZE;
    addr_t p=FRAMEBUFFER_ADDR;
    addr_t pp=framebuffer.common.framebuffer_addr;
    for (size_t i = 0; i < pgc; i++)
    {
        smmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,PML4_ADDR);
        pp+=PAGE_SIZE;
        p+=PAGE_SIZE;
    }
    
}
void init_font(){
    boot_font = (struct psf2_header*) (_binary_res_font_psf_start);

    font_width_bytes = (boot_font->width + 7) / 8;
    font_width = font_width_bytes * 8;
    font_height = boot_font->height;

    glyph_table = (u8*)(_binary_res_font_psf_start)+boot_font->header_size;
    glyph_nr = boot_font->glyph_nr;
    bytes_per_glyph = boot_font->bytes_per_glyph;

    fb_cursor_x = fb_cursor_y = 0;
    max_ch_nr_x = framebuffer.common.framebuffer_width / font_width;
    max_ch_nr_y = framebuffer.common.framebuffer_height / font_height;
    font_size=1;
    max_chs=max_ch_nr_x*max_ch_nr_y*2;
    text_buffer=kmalloc(0, max_chs);
    
}
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
    framebuffer=tag;
}

void fill_rect(int x,int y,int w,int h,unsigned int color){
    unsigned int* fb= (unsigned int*) FRAMEBUFFER_ADDR;
    //目前只写32bpp
    for(int py=x;py<h+x;py++){
        for(int px=y;px<w+y;px++){
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
                       +px*framebuffer.common.framebuffer_bpp/8;
            fb=(unsigned int*)ptr;
            *fb=color;
        }
    }
}
unsigned char letters[];
void draw_text(int x, int y, int size, char *str)
{
    int tx=x;
    while(*str!='\0')
    {
        if(*str=='\n')
        {
            y+=font_height*size;
            tx=x;
        }
        else
        {
            draw_letter(tx,y,size,*str);
            tx+=size*font_width;
        }
        str++;
    }
}
void draw_letter(int x, volatile int y, int size, char c) {
    u8 *glyph = glyph_table;
    if (c < glyph_nr) {
        glyph += c * bytes_per_glyph;
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
        u8 mask = 1 << 7;

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
            int px=x+ch_x*size;
            int py=y+ch_y*size;
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
                     +px*framebuffer.common.framebuffer_bpp/8;
            if ((*(glyph + ch_x / 8) & mask) != 0) {
                *ptr=-1;
            } else {
                *ptr=0;
            }

            mask >>= 1;
            if (ch_x % 8 == 0) {
                mask = 1 << 7;
            }
        }

        glyph += font_width_bytes;
    }
}
void print_textbuffer(){
    for(int i=txtbfh;i!=txtbft;i=(i+1)%max_chs){
        if(text_buffer[i]=='\n'){
            //剩下用空格填满
            for(;fb_cursor_x<max_ch_nr_x;fb_cursor_x++)
                draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,' ');
            
            fb_cursor_y+=1;
            fb_cursor_x=0;
            continue;
        }
        if(fb_cursor_x>max_ch_nr_x)
        {
            fb_cursor_y+=1;
            fb_cursor_x=0;
        }
        if(fb_cursor_y>=max_ch_nr_y-1){
            fb_cursor_y=max_ch_nr_y-1;
            // fb_cursor_y=0;
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,text_buffer[i]);
        fb_cursor_x+=1;
    }
}
//向上滚动一行
void scr_up(){
    txtbfh=(txtbfh+max_ch_nr_x)%max_chs;
    fb_cursor_x=0;
    fb_cursor_y=0;
    text_buffer[txtbft]='\0';
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
//    for(int i=0;i< framebuffer.common.framebuffer_width*framebuffer.common.framebuffer_bpp/8;i++)
//        *(p++)=0;
}
void scr_down(){
    for(int dy=1;dy<max_ch_nr_y;dy++){
        for(int dx=0;dx<max_ch_nr_x;dx++){
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
                            +dx*framebuffer.common.framebuffer_bpp/8);
            *p=*(p-framebuffer.common.framebuffer_pitch);
        }

    }
}
void print(char* s){
    // if(!verify_area(s, 1, PROT_READ)){
    //     comprintf("frambuffer.err:invalid mem:%l\n",s);
    //     return;
    // }
    for(;*s;s++){
        text_buffer[txtbft++]=*s;
        if(txtbft==max_chs)txtbft=0;
        if(fb_cursor_x>max_ch_nr_x||*s=='\n')
        {
            fb_cursor_y+=1;
            fb_cursor_x=0;
        }
        if(*s=='\n')continue;
        if(fb_cursor_y>=max_ch_nr_y-1){
            // scr_up();
            // fb_cursor_y=max_ch_nr_y-1;
            fb_cursor_y=0;
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
        fb_cursor_x+=1;
    }
}
struct file_operations framebuffer_fops={
        .open=open_framebuffer,.close=close_framebuffer,.read=read_framebuffer,.write=write_framebuffer,
        .ioctl=ioctl_framebuffer
};
long open_framebuffer(struct index_node * inode,struct file * filp){
    inode->f_ops=&framebuffer_fops;
    filp->f_ops=&framebuffer_fops;
    return 1;
}
long close_framebuffer(struct index_node * inode,struct file * filp){

}
long read_framebuffer(struct file * filp,char * buf,unsigned long count,long * position){

}
long write_framebuffer(struct file * filp,char * buf,unsigned long count,long * position){
    char *tmp= (char*) kmalloc(0,PAGE_4K_SIZE);
    int c=count/(PAGE_4K_SIZE-1),p=0;
    //一块一块输出
    for(int i=0;i<(c?c:1);i++){
        memcpy(tmp,buf+p,PAGE_4K_SIZE-1);
        tmp[PAGE_4K_SIZE-1]=0;
        print(tmp);
        p+=PAGE_4K_SIZE-1;
    }
    kmfree(tmp);
    return 0;
}
long ioctl_framebuffer(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg){

}
