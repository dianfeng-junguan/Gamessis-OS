#include "tty.h"
#include "memory.h"
#include "int.h"
#include "devman.h"
#include "devdrv.h"
#include "str.h"
#include <syscall.h>
char *m_ptr=0xb8000;
static int videox=0,videoy=0,stline,endline;
char *video_base,*video_end,*vpage_base;
unsigned int page_boffset;
int video_mode,vpage,line_chs;
int port_reg_index,port_reg_v;
int vpage_size;
/*
0000	黑色	black	    1000	灰色	    gray
0001	蓝色	blue	    1001	淡蓝色	    light blue
0010	绿色	green	    1010	淡绿色	    light green
0011	青色	cyan	    1000	淡青色	    light cyan
0100	红色	red	        1100	淡红色	    light red
0101	紫红色	magenta	    1101	淡紫红色	light magenta
0110	棕色	brown	    1110	黄色	    yellow
0111	银色	light gray	1111	白色	    white
*/
/*
00H：40×25 16色 文本

01H：40×25 16 色 文本

02H：80×25 16色 文本

03H: 80×25 16色 文本

04H：320×200 4色

05H：320×200 4 色

06H：640×200 2色

07H：80×25 2色 文本

08H：160×200 16色

09H：320×200 16 色

0AH：640×200 4色

0BH：保留

0CH：保留

0DH：320×200 16色

0EH：640×200 16 色

0FH：640×350 2(单色)

10H：640×350 4色

11H：640×350 16色

12H：640×480 2 色

13H：640×480 16色

14H：640×480 256色
*/

//页帧缓冲
//void set_framebuffer(unsigned long addr)
//{
//    video_base=addr;
//    m_ptr=addr;
//}
void scrdown(void)
{
    vpage_base+=SCREEN_W*2;
    page_boffset+=SCREEN_W*2;
    if(vpage_base>=video_end)
        vpage_base=video_base;
    set_origin();
}
void scrup()
{
    if(page_boffset<=0)
    {
        page_boffset=0;
        vpage_base=video_base;
        set_origin();
        return;
    }
    vpage_base-=SCREEN_W*2;
    page_boffset-=SCREEN_W*2;
    set_origin();
}
void set_origin(void)
{
    asm volatile("cli");
    outb(port_reg_index,12);
    outb(port_reg_v,(page_boffset>>9)&0xff);
    outb(port_reg_index,13);
    outb(port_reg_v,(page_boffset>>1)&0xff);
    asm volatile("sti");

}
const driver drv_tty={
        .open=init_tty,
        .read=read_tty,
        .write=write_tty,
        .seek=seek_tty,
        .scr_up=scrup,
        .scr_down=scrdown,
        .flush=cls
};
const device dev_tty={
        .type=DEV_TYPE_CHRDEV,
        .flag=DEV_FLAG_USED,
        .drv=&drv_tty
};
const device dev_stdout={
        .type=DEV_TYPE_CHRDEV,
        .flag=DEV_FLAG_USED,
        .drv=&drv_tty
};
void init_tty()
{
    strcpy(dev_tty.name,"tty0");
    strcpy(dev_stdout.name,"stdout");
    reg_driver(&drv_tty);
    reg_device(&dev_tty);
    reg_device(&dev_stdout);
    unsigned char *vp=0x20000;
    if(*vp==0x7)
    {
        video_mode=VIDEO_MONOTEXT;
        video_base=0xb0000;
        video_end=0xb8000-1;
        port_reg_index=0x3b4;
        port_reg_v=0x3b5;
    }else if(*vp<=0x3)
    {
        video_mode=VIDEO_CHROMATEXT;
        video_base=0xb8000;
        video_end=0xc0000-1;
        port_reg_index=0x3d4;
        port_reg_v=0x3d5;
    }else{
        video_mode=VIDEO_GRAPHICS;
        video_base=0xa0000;
        video_end=0xb0000-1;
    }
    if(*vp<=0x1)line_chs=40;
    else if(*vp<=0x3||*vp==0x7)line_chs=80;
    else if(*vp<=0x5||*vp==0x9||*vp==0xd)line_chs=320;
    else if(*vp==0x6||*vp==0xa||*vp>=0xe)line_chs=640;
    else if(*vp==0x8)line_chs=160;
    switch (*vp)
    {
    case 0x0:case 0x1:vpage_size=40*25;break;
    case 2:case 3:case 7:vpage_size=80*25;break;
    case 4:case 5:case 9:case 0xd:vpage_size=320*200;break;
    case 6:case 0xa:case 0xe:vpage_size=640*200;break;
    case 8:vpage_size=160*200;break;
    case 0xf:case 0x10:case 0x11:vpage_size=640*350;break;
    case 0x12:case 0x13:case 0x14:vpage_size=640*480;break;
    default:
        break;
    }
    m_ptr=video_base;
    page_boffset=0;
    vpage_base=video_base;
    vp++;
    vpage=*vp;
    vp++;
    stline=*vp++;
    endline=*vp++;
    videoy=*vp++;
    videox=*vp;
    //logf("video:\n mode:0x%x cursor:%d,%d\n",video_mode,\
    videoy,videox);
}
char m_color=MONITOR_WHITE;
int seek_tty(driver_args * args)
{
    int pos=args->pos;
    m_ptr=0xb8000+pos*2;
}
int tell_monitor()
{
    return (m_ptr-video_base)/2;
}
void del_ch()
{
    char *p=m_ptr-2;
    int pos=tell_monitor()%SCREEN_W;
    for(;pos<SCREEN_W-1;pos++)
    {
        *p=*(p+2);
        p+=2;
    }
    driver_args args= {
            .pos=tell_monitor() - 1
    };
    seek_tty(&args);
    set_cur();
}
void set_cur()
{
    asm volatile("cli");
    outb(port_reg_index,14);
    outb(port_reg_v,((m_ptr-video_base)>>9)&0xff);
    outb(port_reg_index,15);
    outb(port_reg_v,((m_ptr-video_base)>>1)&0xff);
    asm volatile("sti");
}

int read_tty(driver_args *args)
{
    char* dist=args->dist_addr;
    int len=args->len;
    for(int i=0;i<len;i++)
    {
        *dist++=*m_ptr;
        if(m_ptr==0xbffff&&i>0)
        {
            return 1;//读到尾了
        }
        m_ptr+=2;
    }
    set_cur();
    return 0;
}
int write_tty(driver_args *args)
{
    char* src=args->src_addr;
    int len=args->len;
    for(int i=0;i<len;i++)
    {
        if(*src=='\n')
        {
            unsigned int off=m_ptr-0xb8000;
            off=(off/160+1)*160;
            ////logf("%x\n",off);
            m_ptr=0xb8000u+off;
            src++;
            continue;
        }else if(*src=='\0')
            break;
        if(*src=='\b')
        {
            m_ptr-=2;
            *m_ptr=0;
        }else
        {
            *m_ptr++=*src++;
            *m_ptr++=m_color;
        }
        if(m_ptr-vpage_base>=vpage_size*2-line_chs*2&&i>0)
        {
            //下滚一行
            scrdown();
        }
    }
    set_cur();
    return 0;
}

void cls(driver_args *args)
{
    for(int i=0;i<vpage_size*2;i+=2)
    {
        vpage_base[i]=0;
    }
    m_ptr=vpage_base;
    set_cur();
}

void set_color(char color)
{
    m_color=color;
}

int tty_do_req(driver_args *args)
{
    switch (args->cmd)
    {
    case DRVF_READ:
        read_tty(args);
        break;
    case DRVF_WRITE:
        write_tty(args);
        break;
    case DRVF_SEEK:
        seek_tty(args);
        break;
    case DRVF_TELL:
        tell_monitor(args);
        break;
    default:return -1;
    }
    return 0;
}
//=======
//VBE
//0x103（800*600， 256色）
//256色模式： 共8 bits (B: 2 bits; G: 3 bits; R: 3 bits)。
/*
unsigned int vbe_base;
unsigned int lvbe_base;
int color_depth=8;
int letter_gird=18;
//用于文字输出
//8*8
unsigned char letters[];

void init_vbe()
{
    vbe_base=*((int*)0x9d000);
    //特别设置：需要把显存对应地址在页目录内设置为可访问
    extern page_item* page_table;
    unsigned int i=0x1b00;//(unsigned)vbe_base
    //把显存映射到0x1b0 0000-0x200 0000
    int ptr=0xfc000013;
    for(int j=0;j<1280;j++,ptr+=0x1000)
        page_table[i+j]=ptr;//0x13+vbe_base;
    lvbe_base=0x1b00000;
    letter_gird=18;
    //设置颜色调色盘
    set_pallete(0,0,0,0);//black
    set_pallete(1,63,63,63);//white
    set_pallete(RGB_GRAY,30,30,30);//gray
    set_pallete(RGB_MARINE,26,36,37);//marine
    set_pallete(RGB_DARKGRAY,19,19,19);
}
void set_pallete(int i,char r,char g,char b)
{
    outb(COLOR_PALLETE_INDEX_PORT,i);//i号调色盘
    outb(COLOR_PALLETE_VALUE_PORT,r);
    outb(COLOR_PALLETE_VALUE_PORT,g);
    outb(COLOR_PALLETE_VALUE_PORT,b);
}
//使用的颜色应当填写调色盘编号
void draw_pixel(int x, int y, unsigned char color)
{
    unsigned char* p=lvbe_base;
    p+=y*800+x;
    *p=color;
}

void draw_rect(int x,int y,int w,int h,int color)
{
    for(int i=0;i<w;i++)
    {
        for(int j=0;j<h;j++)
        {
            draw_pixel(x+i,y+j,color);
        }
    }
}
unsigned char get_color(int x,int y)
{
    unsigned char* p=lvbe_base;
    p+=y*800+x;
    return *p;
}
void draw_letter(int x,int y,char c)
{
    int pi=0;
    if(c>='A'&&c<='Z')pi=(c-'A')*8;
    else if(c>='0'&&c<='9')pi=(c-'0'+26)*8;
    else if (c=='>')pi=36*8;
    else pi=37*8;
    for(int i=0;i<8;i++,pi++)
    {
        for(int j=0;j<8;j++)
        {
            unsigned int tmp=letters[pi]&(1<<(7-j));
            if(tmp)
            {
                draw_rect(x+j*2,y+i*2,2,2,RGB_WHITE);
            }
        }
    }
}

void draw_text(int x,int y,char* str)
{
    int tx=x;
    while(*str!='\0')
    {
        if(*str=='\n')
        {
            y+=letter_gird;
            tx=x;
        }
        else
        {
            draw_letter(tx,y,*str);
            tx+=letter_gird;
        }
        str++;
    }
}
 unsigned char letters[]={
        0b00011000,
        0b00100100,
        0b00100100,
        0b01111110,
        0b01000010,
        0b10000001,
        0b10000001,
        0b10000001,

        0b11111110,
        0b10000001,
        0b10000001,
        0b11111110,
        0b10000001,
        0b10000001,
        0b10000001,
        0b11111111,

        0b01111110,
        0b10000001,
        0b10000000,
        0b10000000,
        0b10000000,
        0b10000000,
        0b10000001,
        0b01111110,

        0b11111110,
        0b10000001,
        0b10000001,
        0b10000001,
        0b10000001,
        0b10000001,
        0b10000001,
        0b11111110,

        0b11111111,
        0b10000000,
        0b10000000,
        0b11111111,
        0b10000000,
        0b10000000,
        0b10000000,
        0b11111111,

        0b11111111,
        0b10000000,
        0b10000000,
        0b11111111,
        0b10000000,
        0b10000000,
        0b10000000,
        0b10000000,


        0b11111110,
        0b10000000,
        0b10000000,
        0b10000000,
        0b10000111,
        0b10000001,
        0b10000001,
        0b11111110,

        0b10000001,
        0b10000001,
        0b10000001,
        0b11111111,
        0b10000001,
        0b10000001,
        0b10000001,
        0b10000001,

        0b00011100,
        0b00001000,
        0b00001000,
        0b00001000,
        0b00001000,
        0b00001000,
        0b00001000,
        0b00011100,

        0b00011100,
        0b00001000,
        0b00001000,
        0b00001000,
        0b00001000,
        0b10001000,
        0b10001000,
        0b01111000,

        0b10001000,
        0b10010000,
        0b10100000,
        0b11000000,
        0b11000000,
        0b10100000,
        0b10010000,
        0b11001000,

        0b10000000,
        0b10000000,
        0b10000000,
        0b10000000,
        0b10000000,
        0b10000000,
        0b10000000,
        0b11111111,

        0b11111111,
        0b10010001,
        0b10010001,
        0b10010001,
        0b10010001,
        0b10010001,
        0b10010001,
        0b10010001,

        0b11111111,
        0b10000001,
        0b10000001,
        0b10000001,
        0b10000001,
        0b10000001,
        0b10000001,
        0b10000001,

        0b11111111,
        0b10000001,
        0b10000001,
        0b10000001,
        0b10000001,
        0b10000001,
        0b10000001,
        0b11111111,

        0b11111111,
        0b10000001,
        0b10000001,
        0b11111111,
        0b10000000,
        0b10000000,
        0b10000000,
        0b10000000,

        0b11111111,
        0b10000001,
        0b10000001,
        0b10010001,
        0b10001001,
        0b10000101,
        0b10000011,
        0b11111111,

        0b11111111,
        0b10000001,
        0b10000001,
        0b11111111,
        0b11000000,
        0b10110000,
        0b10011000,
        0b10001110,

        0b11111110,
        0b10000001,
        0b10000000,
        0b01111110,
        0b00000001,
        0b00000001,
        0b10000001,
        0b01111110,

        0b11111111,
        0b00011000,
        0b00011000,
        0b00011000,
        0b00011000,
        0b00011000,
        0b00011000,
        0b00011000,

        0b10000001,
        0b10000001,
        0b10000001,
        0b10000001,
        0b10000001,
        0b10000001,
        0b10000001,
        0b11111111,

        0b10000001,
        0b10000001,
        0b01000010,
        0b01000010,
        0b00100100,
        0b00100100,
        0b00011000,
        0b00011000,

        0b10011001,
        0b10011001,
        0b10011001,
        0b10011001,
        0b10011001,
        0b10011001,
        0b10011001,
        0b01111110,

        0b10000001,
        0b10000001,
        0b01000010,
        0b00111100,
        0b01000010,
        0b10000001,
        0b10000001,
        0b10000001,

        0b10000001,
        0b10000001,
        0b01000010,
        0b00111100,
        0b00011000,
        0b00011000,
        0b00011000,
        0b00011000,

        0b11111111,
        0b00000001,
        0b00000010,
        0b00000100,
        0b00001000,
        0b00010000,
        0b00100000,
        0b11111111,


        0b11111111,
        0b11000001,
        0b10100001,
        0b10010001,
        0b10001001,
        0b10000101,
        0b10000011,
        0b11111111,

        0b00111000,
        0b01011000,
        0b00011000,
        0b00011000,
        0b00011000,
        0b00011000,
        0b00011000,
        0b00111100,

        0b11111111,
        0b00000001,
        0b00000001,
        0b01111110,
        0b10000000,
        0b10000000,
        0b10000000,
        0b11111111,


        0b11111111,
        0b00000001,
        0b00000001,
        0b00000001,
        0b11111111,
        0b00000001,
        0b00000001,
        0b11111111,

        0b10000001,
        0b10000001,
        0b10000001,
        0b11111111,
        0b00000001,
        0b00000001,
        0b00000001,
        0b00000001,

        0b11111111,
        0b10000000,
        0b10000000,
        0b10000000,
        0b11111111,
        0b00000001,
        0b00000001,
        0b11111111,

        0b11111111,
        0b10000000,
        0b10000000,
        0b10000000,
        0b11111111,
        0b10000001,
        0b10000001,
        0b11111111,

        0b11111111,
        0b00000001,
        0b00000001,
        0b00000001,
        0b00000001,
        0b00000001,
        0b00000001,
        0b00000001,

        0b11111111,
        0b10000001,
        0b10000001,
        0b10000001,
        0b11111111,
        0b10000001,
        0b10000001,
        0b11111111,

        0b11111111,
        0b10000001,
        0b10000001,
        0b10000001,
        0b11111111,
        0b00000001,
        0b00000001,
        0b11111111,

        0b11000000,
        0b00110000,
        0b00001100,
        0b00000011,
        0b00000011,
        0b00001100,
        0b00110000,
        0b11000000,

        0b00000000,
        0b00000000,
        0b00000000,
        0b00000000,
        0b00000000,
        0b00000000,
        0b00000000,
        0b00000000
};*/

