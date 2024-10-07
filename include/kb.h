//
// Created by Oniar_Pie on 2024/5/5.
//

#ifndef GMS_KNL_KB_H
#define GMS_KNL_KB_H
#define MAX_KEYBUF 512
#define FLAG_BREAK	0x80
typedef struct
{
    char ascii;
    char ascii_shift;
    char scan_code;
    char scan_code2;
    char key_code;
}key_code;

char to_ascii(char code);
void shift();
void ctrl();
void capslock();

//系统中断函数：获取键盘缓冲区的一个有效字符
char sys_getkbc();

int init_kb();
int key_proc();
#endif //GMS_KNL_KB_H
