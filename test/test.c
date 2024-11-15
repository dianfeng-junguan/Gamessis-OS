//
// Created by Oniar_Pie on 2024/11/15.
//
#include "syscall.h"
#include "proc.h"

int a=1,b=2,c=0;
int __main(){}
int main(int argc,char** argv){
    do_syscall(SYSCAll_WRITE, 2, (int) "test exe running.\n", 0, 0, 0,0);
    c=a+b;
    return 0;
}