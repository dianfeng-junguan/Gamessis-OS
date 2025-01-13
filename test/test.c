//
// Created by Oniar_Pie on 2024/11/15.
//
#include "fcntl.h"
#include "syscall.h"
#include "sys/wait.h"
#include "c/stdio.h"
#include "c/string.h"
#include <sys/unistd.h>



int a = 1, b = 2, c = 0;
// unsigned long long __bss_start__ = 0, __bss_end__ = 0;

int __main() {}
// int   __stack_chk_fail() {}
int main(int argc, char** argv)
{
    // write(2, as, strlenk(as));
    char* prepared_environ = {"os=gms"};
    puts("Gamessis OS shell\n");
    char cmd[128] = {0};
    while (1) {
        memset(cmd, 0, 128);
        int p = 0;
        printf("shell:>");
        // write(2, "shell:>", 7);
        gets(cmd);
        puts(cmd);
        // write(2, cmd, p);
        if (strcmp(cmd, "version") == 0) {
            puts("Gamessis OS 1.0.\n");
        }
        else if (strcmp(cmd, "exit") == 0) {
            break;
        }
        else {
            printf("trying to execute...\n");
            int pid = 0;
            if ((pid = fork()) == 0) {
                printf("forked, ready to execve\n");
                if (execve(cmd, argv, environ) == -1) {
                    printf("cannot find file:%s\n", cmd);
                    break;
                }
            }
            printf("forked. pid=%d\n", pid);
            int loc = 0;

            waitpid(pid, &loc, 0);
        }
    }


    // do_syscall(SYSCAll_WRITE, 2, (int) "test exe running.\n", 0, 0, 0,0);

    return 0;
}