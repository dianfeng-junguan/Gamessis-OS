#include "dirent.h"
#include "fcntl.h"
#include "sys/unistd.h"
#include "syscall.h"

#define NULL 0

DIR* opendir(const char* name)
{
    DIR* dirp = (DIR*)malloc(sizeof(DIR));
    if (dirp == NULL) {
        return NULL;
    }
    dirp->fd = open(name, O_DIRECTORY);
    if (dirp->fd < 0) {
        free(dirp);
        return NULL;
    }
    dirp->buf = (char*)malloc(1024);
    if (dirp->buf == NULL) {
        close(dirp->fd);
        free(dirp);
        return NULL;
    }
    dirp->buflen = 1024;
    dirp->pos    = 0;
    dirp->end    = 0;
    dirp->eof    = 0;
    return dirp;
}

int closedir(DIR* dirp)
{
    if (dirp == NULL) {
        return -1;
    }
    do_syscall(SYSCALL_CLOSE, dirp->fd, 0, 0, 0, 0, 0);
    free(dirp->buf);
    free(dirp);
    return 0;
}

struct dirent* readdir(DIR* dirp)
{
    // readdir syscall返回的是状态码
    if (do_syscall(SYSCALL_READDIR, dirp->fd, dirp->buf, 0, 0, 0, 0) < 0) {
        dirp->eof = 1;
        return NULL;
    }
    return (struct dirent*)dirp->buf;
}
int chdir(const char* name)
{
    return do_syscall(SYSCALL_CHDIR, (long long)name, 0, 0, 0, 0, 0);
}
int creat(const char* name, mode_t mode)
{
    return do_syscall(SYSCALL_OPEN,
                      (long long)name,
                      (long long)O_CREAT | (long long)O_WRONLY | (long long)mode,
                      0,
                      0,
                      0,
                      0);
}

int mkdir(const char* path, mode_t mode)
{
    return creat(path, mode | O_DIRECTORY);
}
int rename(const char* oldpath, const char* newpath)
{
    return do_syscall(SYSCALL_RENAME, (long long)oldpath, (long long)newpath, 0, 0, 0, 0);
}
char* getcwd(char* buf, size_t size)
{
    if (!buf) {
        buf = malloc(size);
    }
    return (char*)do_syscall(SYSCALL_GETCWD, (long long)buf, (long long)size, 0, 0, 0, 0);
}
