//
// Created by Oniar_Pie on 2024/4/29.
//

#include "virfs.h"
#include "str.h"
#include "memory.h"
#include "mem.h"
#include "proc.h"
#include "devman.h"
#include <syscall.h>
volume vols[MAX_VOLUMES];
vfs_dir_entry opened[MAX_OPEN_FILES]={0};
fifo_t fifos[MAX_FIFOS]={0};

struct buffer_head buffer_heads[NR_BUFFERHEADS];
int setup_sys_vol(void *disk_drv, void *fs_drv)
{
    vols[0].name[0]='C';
    vols[0].name[1]='\0';
    vols[0].disk_drv=disk_drv;
    vols[0].fs_drv=fs_drv;
    vols[0].stat=VOLUME_STAT_READY;
    return 0;
}
//返回管道描述符
int sys_mkfifo(int number)
{
    //查重
    for(int i=0;i<MAX_FIFOS;i++)
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
            return i;
        }
    }
    for(int i=0;i<MAX_FIFOS;i++)
    {
        if(fifos[i].flag==0) {
            fifos[i].flag=1;
            fifos[i].id=number;
            fifos[i].size=CHUNK_SIZE;
            //分配内存
            fifos[i].pa= get_phyaddr(req_a_page());
            return i;
        }
    }
    return -1;
}

int sys_rmfifo(int number)
{
    for(int i=0;i<MAX_FIFOS;i++)
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
            fifos[i].flag=0;
            return i;
        }
    }
    return -1;
}
int free_vol(int voli)
{
    vols[0].stat=VOLUME_STAT_EMPTY;
    return 0;
}

int reg_vol(int disk_drvi, int fs_drvi, char *name)
{
    for(int i=0;i<MAX_VOLUMES;i++)
    {
        if(vols[i].stat==VOLUME_STAT_EMPTY)
        {
            extern driver *drvs;
            vols[i].stat=VOLUME_STAT_READY;
            vols[i].fs_drv= get_drv(fs_drvi);
            vols[i].disk_drv= get_drv(disk_drvi);
            strcpy(vols[i].name,name);
            return i;
        }
    }
    return -1;
}
int sys_open(char *path, int mode)
{
    //判断是否是绝对路径
    if(path[0]!='/')
    {

    }
    //根据文件路径找到相应的卷
    char volname[26];
    int i=0,rec=0;
    for(;path[i]!='/'&&i<26;i++)
        volname[i]=path[i];
    volname[i]='\0';
    if(!path[i+1])
        return -2;//是根目录
    rec=i;
    for(i=0;i<MAX_VOLUMES;i++)
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
        (strcmp(vols[i].name,volname)==0))
            break;
    if(i==MAX_VOLUMES)return -1;
    driver_args arg={
            .path=path+rec+1
    };
    int voln=i;
    if(((driver*)vols[i].fs_drv)->find(&arg)==-1)//找不到文件
    {
        if(mode&FILE_MODE_WRITE) {
            return ((driver *) vols[i].fs_drv)->touch(&arg);
        }else
            return -1;
    }
    vfs_dir_entry entry=arg.entry;
    int j=-1;
    for(i=0;i<MAX_OPEN_FILES;i++)
    {
        if(opened[i].voln==voln&&opened[i].id==entry.id)
        {
            if(mode==FILE_MODE_WRITE)
            {
                return -1;//读模式会重新给一个fno但是指向同一个文件
            }
        }
    }
    for(i=0;i<MAX_OPEN_FILES;i++)
    {
        if(!opened[i].mode) {
            j = i;
            break;
        }
    }
    if(j==-1)return -1;
    opened[j]=entry;
    opened[j].fno=i;
    opened[j].link_c++;
    add_proc_openf(&opened[j]);
    return opened[j].fno;
}
int sys_close(int fno)
{
    for(int i=0;i<MAX_OPEN_FILES;i++)
    {
        if(opened[i].fno==fno)
        {
            opened[i].link_c--;
            return 0;
        }
    }
    return -1;
}
int sys_write(int fno, char *src, int pos, int len)
{
    vfs_dir_entry *f= get_vfs_entry(fno);
    if(!f)return -1;
    driver_args args={
            .fid=f->id,
            .src_addr=src,
            .len=len,
            .pos=pos
    };
    return ((driver*)vols[f->voln].fs_drv)->write(&args);
}
int sys_read(int fno, char *dist, int pos, int len)
{
    vfs_dir_entry *f= get_vfs_entry(fno);
    if(!f)return -1;
    driver_args args={
            .fid=f->id,
            .dist_addr=dist,
            .len=len,
            .pos=pos,
            .entry=*f
    };
    return ((driver*)vols[f->voln].fs_drv)->read(&args);
}
int sys_seek(int fno, int offset, int origin)
{
    vfs_dir_entry *f= get_vfs_entry(fno);
    if(!f)return -1;
    f->ptr=offset+origin;
    return 0;
}
int sys_tell(int fno)
{
    vfs_dir_entry *f= get_vfs_entry(fno);
    if(!f)return -1;
    return f->ptr;
}
vfs_dir_entry *get_vfs_entry(int fno)
{
    for(int i=0;i<MAX_OPEN_FILES;i++)
    {
        if(opened[i].fno==fno)
        {
            return &opened[i];
        }
    }
    return NULL;
}

//把块设备的存储块映射到内存中。
int bmap(int dev,struct buffer_head* bh,int blkn)
{
    //先查找重复
    for(int i=0;i<NR_BUFFERHEADS;i++)
    {
        if(buffer_heads[i].b_blocknr==blkn&& buffer_heads[i].b_dev==dev)//为空
        {
            bh=&buffer_heads[i];
            return 0;
        }
    }
    bh=bread(dev,blkn);
    if(!bh)return -1;
    //申请新的映射
    bh->b_blocknr=blkn;
    bh->b_dev=dev;
    bh->b_dirt=0;
    bh->b_uptodate=1;
    return 0;
}
//申请一块新的缓存
struct buffer_head* new_buffer()
{
    for(int i=0;i<NR_BUFFERHEADS;i++)
    {
        if(buffer_heads[i].b_blocknr==-1)//为空
        {
            return &buffer_heads[i];
        }
    }
    return NULL;
}
//把新的缓冲区接到原来链表结尾。
int add_buffer(struct buffer_head *addition,struct buffer_head* list)
{
    if(!list){
        list=addition;
        return 0;    
    }
    while (list->b_next)
    {
        list=list->b_next;
    }
    list->b_next=addition;
    addition->b_prev=list;
    return 0;
}

//回写缓冲区内容(同步，只同步这一块)
int bsync(struct buffer_head* bh)
{
    driver_args arg;
    arg.dev=bh->b_dev;
    arg.cmd=DRVF_WRITE;
    arg.src_addr=bh->b_data;
    arg.len=BLOCK_SIZE;
    arg.lba=bh->b_blocknr;
    //lock_buffer(bh);//锁定缓冲区
    return make_request(&arg);
}
//回写缓冲区内容(同步，同步整个链)
int bsynca(struct buffer_head *bh)
{
    if(!bh)return -1;
    struct buffer_head* tmp=bh->b_next;
    while(bh)
    {
        bsync(bh);
        bh=tmp;
        if(tmp)tmp=tmp->b_next;
    }
    return 0;
}
//释放缓冲区（只释放这一块）
int brelse(struct buffer_head* bh)
{
    if(bh->b_blocknr==-1)return 0;
    if(!bh)return -1;
    if(bh->b_prev)
    {
        bh->b_prev->b_next=bh->b_next;
    }
    bh->b_blocknr=-1;
    return 0;
}
//释放缓冲区（释放整个链的）
int brelsea(struct buffer_head* bh)
{
    if(!bh)return -1;
    struct buffer_head* tmp=bh->b_next;
    while(bh)
    {
        brelse(bh);
        bh=tmp;
        if(tmp)tmp=tmp->b_next;
    }
    return 0;
}
//从设备中读取指定设备的指定块并返回缓冲区
struct buffer_head* bread(int dev,int blk)
{
    struct buffer_head *bh=new_buffer();
    if(!bh)return -1;//申请失败
    bh->b_dev=dev;
    bh->b_blocknr=blk;
    bh->b_uptodate=1;
    bh->b_dirt;

    driver_args arg;
    arg.dev=dev;
    arg.cmd=DRVF_READ;
    arg.dist_addr=bh->b_data;
    arg.len=BLOCK_SIZE;
    arg.lba=bh->b_blocknr;
    //lock_buffer(bh);//锁定缓冲块直到读取完成
    return make_request(&arg);
}