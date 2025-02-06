/**
    @file dirent.h
 */
#ifndef __DIRENT_H__

#define __DIRENT_H__

struct dirent
{
    long d_offset;
    long d_type;
    long d_namelen;
    char d_name[];
};
struct dirstream
{
    int   fd;
    char* buf;
    int   buflen;
    int   pos;
    int   end;
    int   eof;
};
typedef struct dirstream DIR;

DIR*           opendir(const char* name);
int            closedir(DIR* dirp);
struct dirent* readdir(DIR* dirp);
void           rewinddir(DIR* dirp);
int scandir(const char* dirpath, struct dirent*** namelist, int (*filter)(const struct dirent*),
            int (*compar)(const struct dirent**, const struct dirent**));
#endif
