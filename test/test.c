//
// Created by Oniar_Pie on 2024/11/15.
//
#include "syscall.h"
#include <sys/unistd.h>
#include <stdio.h>
#include <string.h>

int a=1,b=2,c=0;
char *as="Gamessis OS,",*bs=" is loaded!\n";
int __main(){}
int main(int argc,char** argv){
    char *cs=strcat(as,bs);
    write(2,cs,strlen(cs));
    // do_syscall(SYSCAll_WRITE, 2, (int) "test exe running.\n", 0, 0, 0,0);
    c=a+b;
    return 0;
}