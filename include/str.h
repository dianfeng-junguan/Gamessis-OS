#pragma once
#include "sys/types.h"
#include <stdarg.h>
#define RECOMMENDED_MAXSTRLEN 4096
int strcpyk(unsigned char* dest, unsigned char* buf);
//返回实际拷贝了多少字符
int   strncpyk(char* dest, char* src, size_t maxlen);
char* strtokk(char* str, char splitter);
char* strntokk(char* str, char splitter, size_t buf_size);
int   strcmpk(char* s1, char* s2);
int   strncmpk(const char* lhs, const char* rhs, size_t count);
int   strlenk(char* str);
int   strnlenk(char* str, size_t strsz);

void  sprintfk(char* dist, char* str, ...);
void  snprintfk(char* buf, size_t buf_size, char* fmt, ...);
void  vsnprintfk(char* dest, size_t buf_size, char* fmt, va_list vargs);
void  sprintchar(char* dist, char c);
void  sprint_decimal(char* dist, int n);
void  sprint_hex(char* dist, unsigned long long n);
void  sprint_conv(char* dist, unsigned long long num, int base);
char* strcatk(char* dist, char* str);
//限长的拼接字符串。强烈建议使用这个代替strcat。
char* strncatk(char* dist, char* str, size_t len);
char* strchrk(const char* s, int c);
char* strrchrk(const char* s, int c);
