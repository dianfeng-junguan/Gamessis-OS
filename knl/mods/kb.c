//
// Created by Oniar_Pie on 2024/5/5.
//

#include "kb.h"
#include "typename.h"
#include "int.h"
#include "devdrv.h"
#include "devman.h"
key_code key_buf[MAX_KEYBUF];
queue_t key_bufq={
        .data=key_buf,
        .head=0,
        .tail=0,
        .size=MAX_KEYBUF
};
const driver drv_keyboard={
        .inthandler=key_proc,
        .open=init_kb

};
const device dev_keyboard={
        .flag=DEV_FLAG_USED,
        .drv=&drv_keyboard,
        .type=DEV_TYPE_CHRDEV
};

char key_stat[13];//位图
static const key_code key_map[] ={
/* 0x00 - none      */ {  0,        0,        0,         0   },
/* 0x01 - ESC       */ {  0x1b,     0x1b,    0x01,      0x1B },
/* 0x02 - '1'       */ { '1',      '!',      0x02,      0x31 },
/* 0x03 - '2'       */ { '2',      '@',      0x03,      0x32 },
/* 0x04 - '3'       */ { '3',      '#',      0x04,      0x33 },
/* 0x05 - '4'       */ { '4',      '$',      0x05,      0x34 },
/* 0x06 - '5'       */ { '5',      '%',      0x06,      0x35 },
/* 0x07 - '6'       */ { '6',      '^',      0x07,      0x36 },
/* 0x08 - '7'       */ { '7',      '&',      0x08,      0x37 },
/* 0x09 - '8'       */ { '8',      '*',      0x09,      0x38 },
/* 0x0A - '9'       */ { '9',      '(',      0x0A,      0x39 },
/* 0x0B - '0'       */ { '0',      ')',      0x0B,      0x30 },
/* 0x0C - '-'       */ { '-',      '_',      0x0C,      0xBD },
/* 0x0D - '='       */ { '=',      '+',      0x0D,      0xBB },
/* 0x0E - BS        */ { '\b',     '\b',     0x0E,      0x08 },
/* 0x0F - TAB       */ {  '\t',    '\t',       0x0F,      0x09 },
/* 0x10 - 'q'       */ { 'q',      'Q',      0x10,      0x51 },
/* 0x11 - 'w'       */ { 'w',      'W',      0x11,      0x57 },
/* 0x12 - 'e'       */ { 'e',      'E',      0x12,      0x45 },
/* 0x13 - 'r'       */ { 'r',      'R',      0x13,      0x52 },
/* 0x14 - 't'       */ { 't',      'T',      0x14,      0x54 },
/* 0x15 - 'y'       */ { 'y',      'Y',      0x15,      0x59 },
/* 0x16 - 'u'       */ { 'u',      'U',      0x16,      0x55 },
/* 0x17 - 'i'       */ { 'i',      'I',      0x17,      0x49 },
/* 0x18 - 'o'       */ { 'o',      'O',      0x18,      0x4F },
/* 0x19 - 'p'       */ { 'p',      'P',      0x19,      0x50 },
/* 0x1A - '['       */ { '[',      '{',      0x1A,      0xDB },
/* 0x1B - ']'       */ { ']',      '}',      0x1B,      0xDD },
/* 0x1C - Enter     */ {  '\n',    '\n',     0x1C,      0x0D },
/* 0x1D - l. Ctrl   */ {  0,        0,       0x1D,      0x11 },
/* 0x1E - 'a'       */ { 'a',      'A',      0x1E,      0x41 },
/* 0x1F - 's'       */ { 's',      'S',      0x1F,      0x53 },
/* 0x20 - 'd'       */ { 'd',      'D',      0x20,      0x44 },
/* 0x21 - 'f'       */ { 'f',      'F',      0x21,      0x46 },
/* 0x22 - 'g'       */ { 'g',      'G',      0x22,      0x47 },
/* 0x23 - 'h'       */ { 'h',      'H',      0x23,      0x48 },
/* 0x24 - 'j'       */ { 'j',      'J',      0x24,      0x4A },
/* 0x25 - 'k'       */ { 'k',      'K',      0x25,      0x4B },
/* 0x26 - 'l'       */ { 'l',      'L',      0x26,      0x4C },
/* 0x27 - ';'       */ { ';',      ':',      0x27,      0xBA },
/* 0x28 - '\''      */ { '\'',     '\"',     0x28,      0xDE },
/* 0x29 - '`'       */ { '`',      '~',      0x29,      0xC0 },
/* 0x2A - l. SHIFT  */ {  0,        0,       0x2A,      0x10 },
/* 0x2B - '\'       */ { '\\',     '|',      0x2B,      0xDC },
/* 0x2C - 'z'       */ { 'z',      'Z',      0x2C,      0x5A },
/* 0x2D - 'x'       */ { 'x',      'X',      0x2D,      0x58 },
/* 0x2E - 'c'       */ { 'c',      'C',      0x2E,      0x43 },
/* 0x2F - 'v'       */ { 'v',      'V',      0x2F,      0x56 },
/* 0x30 - 'b'       */ { 'b',      'B',      0x30,      0x42 },
/* 0x31 - 'n'       */ { 'n',      'N',      0x31,      0x4E },
/* 0x32 - 'm'       */ { 'm',      'M',      0x32,      0x4D },
/* 0x33 - ','       */ { ',',      '<',      0x33,      0xBC },
/* 0x34 - '.'       */ { '.',      '>',      0x34,      0xBE },
/* 0x35 - '/'       */ { '/',      '?',      0x35,      0xBF },
/* 0x36 - r. SHIFT  */ {  0,        0,       0x36,      0x10 },
/* 0x37 - '*'       */ { '*',      '*',      0x37,      0x6A },
/* 0x38 - ALT       */ {  0,        0,       0x38,      0x12 },
/* 0x39 - ' '       */ { ' ',      ' ',      0x39,      0x20 },
/* 0x3A - CapsLock  */ {  0,        0,       0x3A,      0x14 },
/* 0x3B - F1        */ {  0,        0,       0x3B,      0x70 },
/* 0x3C - F2        */ {  0,        0,       0x3C,      0x71 },
/* 0x3D - F3        */ {  0,        0,       0x3D,      0x72 },
/* 0x3E - F4        */ {  0,        0,       0x3E,      0x73 },
/* 0x3F - F5        */ {  0,        0,       0x3F,      0x74 },
/* 0x40 - F6        */ {  0,        0,       0x40,      0x75 },
/* 0x41 - F7        */ {  0,        0,       0x41,      0x76 },
/* 0x42 - F8        */ {  0,        0,       0x42,      0x77 },
/* 0x43 - F9        */ {  0,        0,       0x43,      0x78 },
/* 0x44 - F10       */ {  0,        0,       0x44,      0x79 },
/* 0x45 - NumLock   */ {  0,        0,       0x45,      0x90 },
/* 0x46 - ScrLock   */ {  0,        0,       0x46,      0x91 },
/* 0x47 - Home      */ {  0,        0,       0x47,      0x24 },
/* 0x48 - Up        */ {  0,        0,       0x48,      0x26 },
/* 0x49 - PgUp      */ {  0,        0,       0x49,      0x21 },
/* 0x4A - '-'       */ {  0,        0,       0x4A,      0x6D },
/* 0x4B - Left      */ {  0,        0,       0x4B,      0x25 },
/* 0x4C - MID       */ {  0,        0,       0x4C,      0x0C },
/* 0x4D - Right     */ {  0,        0,       0x4D,      0x27 },
/* 0x4E - '+'       */ {  0,        0,       0x4E,      0x6B },
/* 0x4F - End       */ {  0,        0,       0x4F,      0x23 },
/* 0x50 - Down      */ {  0,        0,       0x50,      0x28 },
/* 0x51 - PgDown    */ {  0,        0,       0x51,      0x22 },
/* 0x52 - Insert    */ {  0,        0,       0x52,      0x2D },
/* 0x53 - Del       */ {  0,        0,       0x53,      0x2E },
/* 0x54 - Enter(不对)*/ {  '\t',     '\t',    0x54,      0x0D },
/* 0x55 - ???       */ {  0,        0,        0,         0   },
/* 0x56 - ???       */ {  0,        0,        0,         0   },
/* 0x57 - F11       */ {  0,        0,       0x57,      0x7A },
/* 0x58 - F12       */ {  0,        0,       0x58,      0x7B },
/* 0x59 - ???       */ {  0,        0,        0,         0   },
/* 0x5A - ???       */ {  0,        0,        0,         0   },
/* 0x5B - Left Win  */ {  0,        0,       0x5B,      0x5B },
/* 0x5C - Right Win */ {  0,        0,       0x5C,      0x5C },
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
    k_shift=!k_shift;
}
void ctrl()
{
    k_ctrl=!k_ctrl;
}
void capslock()
{
    k_capslock=k_capslock==0?1:0;
}
char to_ascii(char scan_code)
{
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
        if(key_map[i].scan_code==scan_code)
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
            else if(k_shift)return key_map[i].ascii_shift;
            else return key_map[i].ascii;
        }

    return '\0';
}
int init_kb()
{
    reg_device(&dev_keyboard);
    reg_driver(&drv_keyboard);
}
int key_proc()
{
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
    key_code tmpc;
    scan1=inb(0x60);
    ch= to_ascii(scan1);
    if(scan1 == 0xe0 || scan1 == 0xe1)
    {
        ch= to_ascii(scan2);
        scan2=inb(0x60);
    }
    tmpc.scan_code=scan1;
    tmpc.scan_code2=scan2;
    tmpc.ascii= ch;

    if(QTAIL(key_bufq)!=QHEAD(key_bufq))
    {
        ENQUEUE(key_bufq,tmpc)
    }

    /*else if(scan1==0x48)
        scrup();
    else if(scan1==0x50)
        scrdown();*/
    /*switch (scan1)
    {
        case 0x36:
        case 0x2a:
        case 0xaa:
        case 0xb6:
            shift();
            break;
        case 0x1d:
        case 0x9d:
            ctrl();
            break;
        case 0x3a:
            capslock();
            break;
        default:
            break;
    }
    if(scan1<=0x80&&ch!=0)
    {
        /*extern io_buf stdin;
        extern int stdinc;
        char tmpc[]={ch,'\0'};
        //fwrite(&ch,1,&stdin);
        insert_to_stdin(ch);
        if(ch=='\b')
            del_ch();
        else
            printf("%s",tmpc);
        //logf("%x\n",stdin.w_ptr);
        //print_stdin();
        //printchar(ch);
        //flush_screen(0);
    }*/
    eoi();
    asm volatile("leave \r\n iret");
}

char sys_getkbc()
{
    if(key_bufq.tail==key_bufq.head)return -1;
    key_code c=key_buf[key_bufq.tail];
    QTAIL(key_bufq)=(QTAIL(key_bufq)+1)%QSIZE(key_bufq);
    return c.ascii;
}