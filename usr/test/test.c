//
// Created by Oniar_Pie on 2024/11/15.
//
#include "fcntl.h"
#include "syscall.h"
#include "sys/wait.h"
#include "c/stdio.h"
#include "c/string.h"


int a = 1, b = 2, c = 0;
// unsigned long long __bss_start__ = 0, __bss_end__ = 0;

int         __main() {}
char        text[128];
windowptr_t window, shellcontent;

void on_enter_pressed(struct _window* wndptr, int event_type, window_event_t* event)
{
    get_window_text(shellcontent, text, 128);
    strcat(text, "enter pressed\n");
    set_window_text(shellcontent, text);
}
// int   __stack_chk_fail() {}
int main(int argc, char** argv, char** environ)
{
    // write(2, as, strlenk(as));
    char* prepared_environ = {"os=gms"};
    puts("Gamessis OS shell\n");
    char cmd[128]  = {0};
    char path[128] = "/";

    /* window         = create_window("Shell", WNDTYPE_WINDOW);
    shellcontent   = create_window("SHELL", WNDTYPE_EDITBOX);
    resize_window(shellcontent, 200, 190);
    move_window(shellcontent, 0, 30);
    attach_window(shellcontent, window);
    show_window(shellcontent);
    show_window(window); */
    // add_window_event_listener(shellcontent, WND_EVENT_KEY_DOWN, on_enter_pressed);
    // void* console = create_console();
    // attach_console(console);
    /* while (1) {
        window_event_t event;
        if (fetch_event(&event) == 0) {
            switch (event.event_type) {
            case WND_EVENT_KEY_DOWN:
                on_enter_pressed(shellcontent, event.event_type, &event);
                break;
            default: default_deal_window_event(&event); break;
            }
        }
    } */
    while (1) {
        memset(cmd, 0, 128);
        int p = 0;
        printf("%s:>", path);
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
        else if (strcmp(cmd, "ls") == 0) {
            // ls
            getcwd(path, 128);
            DIR*           dp = opendir(path);
            struct dirent* dirp;
            if (!dp) {
                printf("error opening directory\n");
                continue;
            }
            while ((dirp = readdir(dp)) != NULL) {
                printf("%s\n", dirp->d_name);
            }
            close(dp);
        }
        else if (strcmp(cmd, "cd") == 0) {
            // cd
            char tmppath[128] = {0};
            printf("enter path:");
            // write(2, "enter path:", 11);
            gets(tmppath);
            if (chdir(tmppath) == -1) {
                printf("cannot find directory:%s\n", tmppath);
                continue;
            }

            //修改tmppath
            //要考虑..和.的情况
            //..的时候，要路径缩短
            //.的时候，不用动
            if (strcmp(tmppath, "..") == 0) {
                char* p = tmppath + strlen(tmppath) - 1;
                while (p > tmppath && *p == '/') {
                    *p-- = 0;
                }
                while (p > tmppath && *(p) != '/') {
                    *p-- = 0;
                }
            }
            else if (strcmp(tmppath, ".") == 0) {
                continue;
            }
            else {
                strcat(path, tmppath);
                strcat(path, "/");
            }
            printf("current directory:%s\n", tmppath);
        }
        else if (strcmp(cmd, "touch") == 0) {
            char path[100] = {0};
            printf("input path:");
            gets(path);
            int fd = creat(path, O_CREAT);
            if (fd < 0) {
                printf("create file %s failed\n", path);
            }
            else {
                printf("create file %s success\n", path);
                close(fd);
            }
        }
        else if (strcmp(cmd, "rm") == 0) {
            char path[100] = {0};
            printf("input path:");
            gets(path);
            int stat = remove(path);
            if (stat < 0) {
                printf("remove file/dir %s failed\n", path);
            }
            else {
                printf("remove file/dir %s success\n", path);
            }
        }
        else if (strcmp(cmd, "mv") == 0) {
            char src[100] = {0};
            char dst[100] = {0};
            printf("input src path:");
            gets(src);
            printf("input dst path:");
            gets(dst);
            int stat = rename(src, dst);
            if (stat < 0) {
                printf("move file/dir %s to %s failed\n", src, dst);
            }
            else {
                printf("move file/dir %s to %s success\n", src, dst);
            }
        }
        else if (strcmp(cmd, "cat") == 0) {
            char path[100] = {0};
            printf("input path:");
            gets(path);
            int fd = open(path, O_RDONLY);
            if (fd < 0) {
                printf("open file %s failed\n", path);
            }
            else {
                char buffer[100] = {0};
                int  len         = 0;
                while ((len = read(fd, buffer, 100)) > 0) {
                    printf("%s", buffer);
                }
                puts("");
                close(fd);
            }
        }
        else if (strcmp(cmd, "write") == 0) {
            char path[100] = {0};
            printf("input path:");
            gets(path);
            int fd = open(path, O_WRONLY);
            if (fd < 0) {
                printf("open file %s failed\n", path);
            }
            else {
                char buffer[100] = {0};
                printf("input content:");
                gets(buffer);
                int len = strlen(buffer);
                write(fd, buffer, len);
                printf("write %d bytes to file %s success\n", len, path);
                close(fd);
            }
        }
        else if (strcmp(cmd, "reboot") == 0) {
            do_syscall(41, 1, 0, 0, 0, 0, 0);
        }
        else {
            printf("trying to execute...\n");
            int pid = 0;
            if ((pid = fork()) == 0) {
                printf("forked, ready to execve\n");
                if (execve(cmd, argv, environ) == -1) {
                    printf("cannot find file:%s\n", cmd);
                    continue;
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