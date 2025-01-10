#pragma once
#include "sys/types.h"
void  strcpy(unsigned char* dest, unsigned char* buf);
char* strtok(char* str, char splitter);
int   strcmp(char* s1, char* s2);
int   strncmp(const char* lhs, const char* rhs, size_t count);
int   strlen(char* str);
int   strnlen(char* str, size_t strsz);


void sprintf(char* dist, char* str, ...);
void sprintchar(char* dist, char c);
void sprint_decimal(char* dist, int n);
void sprint_hex(char* dist, unsigned long long n);
void sprintn(char* dist, char* str);