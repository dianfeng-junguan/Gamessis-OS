#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char* buf)
{
    while (*buf != '\0') {
        *(dest++) = *(buf++);
    }
    *dest = '\0';
}
static char strtokkee[512], *strtokkeeptr = strtokkee;
static int  tokptr = 0;
static char retbuf[512], *retbptr = retbuf;
char*       strtok(char* str, char splitter)
{
    // limit: cannot cut string longer than 512
    if (str != (void*)0) {
        // cut for the first time
        strcpy(strtokkee, str);
        char* ptr = strtokkee;
        for (tokptr = 0; strtokkee[tokptr] != splitter && strtokkee[tokptr] != '\0';
             tokptr = (tokptr + 1) % 512)
            ;
        strtokkee[tokptr] = '\0';
        tokptr            = (tokptr + 1) % 512;
        return ptr;
    }
    // go on cutting
    int   c   = 0;
    char* ptr = strtokkee + tokptr;
    for (; strtokkee[tokptr] != splitter && strtokkee[tokptr] != '\0';
         tokptr = (tokptr + 1) % 512, c++)
        ;
    strtokkee[tokptr] = '\0';
    tokptr            = (tokptr + 1) % 512;
    if (c)
        return ptr;
    else
        return (void*)0;
}
int strcmp(char* s1, char* s2)
{
    while (*s1 != '\0' && *s2 != '\0') {
        if (*s1 > *s2)
            return 1;
        else if (*s1 < *s2)
            return -1;
        s1++;
        s2++;
    }
    if (*s1 == *s2)
        return 0;
}
int strncmp(const char* s1, const char* s2, size_t count)
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
int strlen(char* str)
{
    int l = 0;
    for (; *str != '\0'; str++, l++)
        ;
    return l;
}
int strnlen(char* str, size_t strsz)
{
    int l = 0;
    for (; *str != '\0' && l < strsz; str++, l++)
        ;
    return l;
}
void sprintf(char* dist, char* str, ...)
{

    // count num of args
    char* pstr   = str;
    char* prev   = str;
    int   argnum = 0;
    while (*pstr != '\n') {
        if (*pstr == '%' && *prev != '%')
            argnum++;
        prev = pstr;
        pstr++;
    }

    va_list vargs;
    va_start(vargs, str);
    pstr = str;
    for (; *pstr != '\0'; pstr++) {
        if (*pstr == '%' && *(pstr + 1) != '\0') {
            pstr++;
            if (*pstr == 'x') {
                int v = va_arg(vargs, int);
                sprint_hex(dist, v);
            }
            else if (*pstr == 's') {
                char* v = va_arg(vargs, char*);
                sprintn(dist, v);
            }
            else if (*pstr == 'd') {
                char* v = va_arg(vargs, char*);
                sprint_decimal(dist, v);
            }
            else if (*pstr == 'c') {
                char v = va_arg(vargs, char);
                sprintchar(dist, v);
            }
            else {
                sprintchar(dist, *pstr);
            }
        }
        else {
            sprintchar(dist, *pstr);
        }
    }
    va_end(vargs);
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
    unsigned char st[22];
    int           p = 0;
    while (p < sizeof(unsigned long) * 2) {
        unsigned char a = c % 10 + '0';
        st[p++]         = a;
        c /= 10;
    }
    while (p > 0) {
        sprintchar(dist, st[--p]);
    }
}
void sprint_hex(char* dist, unsigned long long c)
{
    unsigned char st[17];
    int           p = 0;
    while (p < 17) {
        unsigned char a = c % 16;
        if (a > 9)
            a += 'a' - 10;
        else
            a += '0';
        st[p++] = a;
        c /= 16;
    }
    while (st[--p] == '0')   //除去无效数字
        ;
    while (p >= 0) {
        sprintchar(dist, st[p--]);
    }
}
void sprintn(char* dist, char* str)
{
    while (*str != '\0') {
        sprintchar(dist, *str++);
    }
}