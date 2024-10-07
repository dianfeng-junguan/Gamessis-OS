#include <log.h>
#include "framebuffer.h"

static unsigned char* video;
static int xpos,ypos;
/* 将整数 D 转换为字符串并保存在 BUF 中。如果 BASE 为 'd'，则 D 为十进制，如果 BASE 为 'x'，则 D 为十六进制。 */

int init_logging()
{
    video=0xb8000;
    xpos=0;
    ypos=0;
}

static void itoa (char *buf, int base, int d)
{
    char *p = buf;
    char *p1, *p2;
    unsigned long ud = d;
    int divisor = 10;
 
    /* 如果指定了 %d 并且 D 是负数，在开始添上负号。 */
    if (base == 'd' && d < 0)
    {
        *p++ = '-';
        buf++;
        ud = -d;
    }
    else if (base == 'x')
        divisor = 16;
 
    /* 用 DIVISOR 去除 UD 直到 UD == 0。 */
    do
    {
        int remainder = ud % divisor;
 
        *p++ = (remainder < 10) ? remainder + '0' : remainder + 'a' - 10;
    }
    while (ud /= divisor);
 
    /* 在字符串尾添上终结符。 */
    *p = 0;
 
    /* 反转 BUF。 */
    p1 = buf;
    p2 = p - 1;
    while (p1 < p2)
    {
        char tmp = *p1;
        *p1 = *p2;
        *p2 = tmp;
        p1++;
        p2--;
    }
}
 
/* 在屏幕上输出字符 C 。 */
void putchar (char c)
{
    char s[2]={c,'\0'};
    print(s);
    return;
    if (c == '\n' || c == '\r')
    {
newline:
        xpos = 0;
        ypos++;
        if (ypos >= LINES)
            ypos = 0;
        return;
    }
 
    *(video + (xpos + ypos * COLUMNS) * 2) = c & 0xFF;
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
 
    xpos++;
    if (xpos >= COLUMNS)
        goto newline;
}
 
/* 格式化字符串并在屏幕上输出，就像 libc 函数 printf 一样。 */
void printf (const char *format, ...)
{
    char **arg = (char **) &format;
    char c;
    char buf[20];
 
    arg++;
 
    while ((c = *format++) != 0)
    {
        if (c != '%')
            putchar (c);
        else
        {
            char *p;
 
            c = *format++;
            switch (c)
            {
            case 'd':
            case 'u':
            case 'x':
                itoa (buf, c, *((int *) arg++));
                p = buf;
                goto string;
                break;
 
            case 's':
                p = *arg++;
                if (! p)
                    p = "(null)";
 
string:
                while (*p)
                    putchar (*p++);
                break;
 
            default:
                putchar (*((int *) arg++));
                break;
            }
        }
    }
}
