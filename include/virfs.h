//
// Created by Oniar_Pie on 2024/4/29.
//

#ifndef GMS_KNL_VFS_H
#define GMS_KNL_VFS_H
//dir_entry
#define FILE_MODE_READ 1
#define FILE_MODE_WRITE 2
#define FILE_MODE_RW    3
#define FILE_MODE_BINARY 4
#define FILE_MODE_MEM   5
#define MAX_OPEN_FILES  64
#define MAX_FIFOS 16
#define MAX_FIXED 16
#define MAX_QUICKLOOK 16
#define VOLUME_STAT_EMPTY 0
#define VOLUME_STAT_READY 1
#define MAX_VOLUMES 26
typedef struct _vfs_dentry_{
    int fno;    //文件描述符
    int mode;   //打开模式
    int voln;   //属于哪一个卷
    int link_c; //被引用的次数
    int type;   //文件类型
    int id;     //文件在字文件系统里的id，如果id一样而且在一个卷内，就认为是同一个文件
    int ptr;    //读写指针
    struct _vfs_dentry_* parent;//上级目录

    char name[32];//管道文件的名字
    int pa;     //用于管道文件：对应的物理地址
    int m_size; //管道文件的大小,目前限定在4kb
}vfs_dir_entry;
typedef struct {
    int pa;
    int size;
    int flag;
    int id;
}fifo_t;
typedef struct {
    char name[8];
    void *disk_drv;
    void *fs_drv;
    int stat;
}volume;
int setup_sys_vol(void *disk_drv, void *fs_drv);//系统盘符，用特殊方法装载
int free_vol(int voli);
int reg_vol(int disk_drvi, int fs_drvi, char *name);
#ifndef _ONLY_DATA_
//返回文件描述符
int sys_open(char *path, int mode);
int sys_close(int fno);
int sys_write(int fno, char *src, int pos, int len);
int sys_read(int fno, char *dist, int pos, int len);
int sys_seek(int fno, int offset, int origin);
int sys_tell(int fno);

int sys_mkfifo(int number);
int sys_rmfifo(int number);
int sys_readfifo(int number,char* dist,int len);
int sys_writefifo(int number,char* src,int len);
vfs_dir_entry *get_vfs_entry(int fno);
#endif
//
#endif //GMS_KNL_VFS_H
