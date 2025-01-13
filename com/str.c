#include "str.h"
#include "typename.h"
#include <stdarg.h>
static char strtokkee[512], *strtokkeeptr = strtokkee;
static int  tokptr = 0;
static char retbuf[512], *retbptr = retbuf;

int strcpyk(unsigned char* dest, unsigned char* buf)
{
    return strncpyk(dest, buf, RECOMMENDED_MAXSTRLEN);
}
int strncpyk(char* dest, char* buf, size_t maxlen)
{
    int i = 0;
    while (*buf != '\0' && i < maxlen) {
        *(dest++) = *(buf++);
        i++;
    }
    *dest = '\0';
    return i + 1;
}

char* strntokk(char* str, char splitter, size_t buf_size)
{

    if (str != (void*)0) {
        // cut for the first time
        strcpyk(strtokkee, str);
        char* ptr = strtokkee;
        for (tokptr = 0;
             strtokkee[tokptr] != splitter && strtokkee[tokptr] != '\0' && tokptr < buf_size;
             tokptr++)
            ;
        if (tokptr < buf_size) {
            //如果越界了，就什么都不会做
            strtokkee[tokptr++] = '\0';
        }
        return ptr;
    }
    // go on cutting
    int   c   = 0;
    char* ptr = strtokkee + tokptr;
    for (; strtokkee[tokptr] != splitter && strtokkee[tokptr] != '\0' && tokptr < buf_size;
         tokptr++, c++)
        ;
    if (tokptr < buf_size) {
        //如果越界了，就什么都不会做
        strtokkee[tokptr++] = '\0';
    }
    if (c)
        return ptr;
    else
        return (void*)0;
}

char* strtokk(char* str, char splitter)
{
    return strntokk(str, splitter, RECOMMENDED_MAXSTRLEN);
}
int strcmpk(char* s1, char* s2)
{
    return strncmpk(s1, s2, RECOMMENDED_MAXSTRLEN);
}
int strncmpk(const char* s1, const char* s2, size_t count)
{
    size_t c = 0;
    while (*s1 != '\0' && *s2 != '\0' && c < count) {
        if (*s1 > *s2)
            return 1;
        else if (*s1 < *s2)
            return -1;
        s1++;
        s2++;
        c++;
    }
    return *s1 - *s2;
}
int strlenk(char* str)
{
    return strnlenk(str, RECOMMENDED_MAXSTRLEN);
}
int strnlenk(char* str, size_t strsz)
{
    int l = 0;
    for (; *str != '\0' && l < strsz; str++, l++)
        ;
    return l;
}
void sprintfk(char* dist, char* str, ...)
{
    va_list vargs;
    va_start(vargs, str);
    vsnprintfk(dist, RECOMMENDED_MAXSTRLEN, str, vargs);
    va_end(vargs);
}
void snprintfk(char* buf, size_t buf_size, char* fmt, ...)
{
    va_list vargs;
    va_start(vargs, fmt);
    vsnprintfk(buf, buf_size, fmt, vargs);
    va_end(vargs);
}
//调用前先va_start，用后va_end。
void vsnprintfk(char* dest, size_t buf_size, char* fmt, va_list vargs)
{
    char* pstr = fmt;
    for (int i = 0; *pstr != '\0' && i < buf_size; pstr++, i++) {
        if (*pstr == '%' && *(pstr + 1) != '\0') {
            pstr++;
            if (*pstr == 'x') {
                unsigned long long v = va_arg(vargs, unsigned long long);
                sprint_hex(dest, v);
            }
            else if (*pstr == 's') {
                char* v = va_arg(vargs, char*);
                strcatk(dest, v);
            }
            else if (*pstr == 'd') {
                int v = va_arg(vargs, int);
                sprint_decimal(dest, v);
            }
            else if (*pstr == 'c') {
                int v = va_arg(vargs, int);
                sprintchar(dest, v);
            }
            else if (*pstr == 'l') {
                unsigned long long v = va_arg(vargs, unsigned long long);
                sprint_hex(dest, v);
            }
            else if (*pstr == 'p') {
                addr_t v = va_arg(vargs, addr_t);
                sprint_hex(dest, v);
            }
            else {
                sprintchar(dest, *pstr);
            }
        }
        else {
            sprintchar(dest, *pstr);
        }
    }
    sprintchar(dest, '\0');
}
void sprintchar(char* dist, char c)
{
    while (*dist != '\0')
        dist++;
    *dist++ = c;
    *dist   = '\0';
}
void sprint_decimal(char* dist, int c)
{
    sprint_conv(dist, c, 10);
}
void sprint_hex(char* dist, unsigned long long c)
{
    sprint_conv(dist, c, 16);
}
void sprint_conv(char* dist, unsigned long long num, int base)
{
    if (base > 36) {
        return;
    }
    unsigned char st[18];
    st[17] = '\0';
    int p  = 16;
    if (!num) {
        st[p] = '0';
        strncatk(dist, &st[p], 2);
        return;
    }
    while (p >= 0 && num) {
        unsigned char a = num % base;
        if (a > 9)
            a += 'a' - 10;
        else
            a += '0';
        st[p--] = a;
        num /= base;
    }
    strncatk(dist, st + (++p), 17);
}
char* strcatk(char* dist, char* str)
{
    return strncatk(dist, str, RECOMMENDED_MAXSTRLEN);
}
char* strncatk(char* dist, char* str, size_t len)
{
    char* ret = dist;
    int   i   = 0;
    while (*dist)
        dist++;
    while (*str && i < len) {
        *dist++ = *str++;
        i++;
    }
    *dist = '\0';
    return ret;
}
