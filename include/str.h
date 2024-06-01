#pragma once
void strcpy(unsigned char* dest, unsigned char *buf);
char* strtok(char *str,char splitter);
int strcmp(char *s1,char *s2);
int strlen(char *str);


void sprintf(char *dist,char *str,...);
void sprintchar(char *dist,char c);
void sprint_decimal(char *dist,int n);
void sprint_hex(char *dist,unsigned int n);
void sprintn(char *dist,char *str);