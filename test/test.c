//
// Created by Oniar_Pie on 2024/11/15.
//
#include "syscall.h"
#include <sys/unistd.h>
#include <stdio.h>
#include <string.h>

int a=1,b=2,c=0;
char *as="Gamessis OS shell";
int __main(){}
int main(int argc,char** argv){
    write(2,as,strlen(as));
    char cmd[128]={0};
    while (1)
    {
        memset(cmd,0,128);
        int p=0;
        while (cmd[p]!='\n')
        {
            read(1,cmd+p,1);
            p++;
            if(p==128)p=0;
        }
        cmd[p]=0;
        write(2,cmd,strlen(cmd));
        if (strcmp(cmd,"version")==0)
        {
            write(1,"Gamessis OS 1.0.\n",19);
        }else if(strcmp(cmd,"exit")==0)break;
    }
    
    
    // do_syscall(SYSCAll_WRITE, 2, (int) "test exe running.\n", 0, 0, 0,0);
    
    return 0;
}