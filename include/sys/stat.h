
#define S_IFMT  1
#define S_IFREG 1
#define S_IFDIR 2
#define S_IFBLK 3
#define S_IFCHR 4
#define S_IFIFO 5
#define S_IFLNK 6

#define S_ISBLK(m)  ((m&0x7)==S_IFBLK)
#define S_ISCHR(m)  ((m&0x7)==S_IFCHR)
#define S_ISDIR(m)  ((m&0x7)==S_IFDIR)
#define S_ISFIFO(m) ((m&0x7)==S_IFIFO)
#define S_ISREG(m)  ((m&0x7)==S_IFREG)
#define S_ISLNK(m)  ((m&0x7)==S_IFLNK)

//TODO 待完成
#define S_IRWXU 0
#define S_IRUSR 0
#define S_IWUSR 0
#define S_IXUSR 0
#define S_IRWXG 0
#define S_IRGRP 0
#define S_IWGRP 0
#define S_IXGRP 0
#define S_IRWXO 0
#define S_IROTH 0
#define S_IWOTH 0
#define S_IXOTH 0
#define S_ISUID 0
#define S_ISGID 0
#define S_ISVTX 0