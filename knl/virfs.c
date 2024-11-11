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
#include <log.h>
#include <disk.h>
volume vols[MAX_VOLUMES];
vfs_dir_entry opened[MAX_OPEN_FILES]={0};
fifo_t fifos[MAX_FIFOS]={0};
super_block sbs[MAX_SUPERBLOCKS];
fs_operations fs[MAX_FS];

buffer_head buffer_heads[NR_BUFFERHEADS];
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
            vols[i].fs= &fs[fs_drvi];
            vols[i].disk_drv= get_drv(disk_drvi);
            strcpy(vols[i].name,name);
            return i;
        }
    }
    return -1;
}
//int sys_open(char *path, int mode)
//{
//    //判断是否是绝对路径
//    if(path[0]!='/')
//    {
//
//    }
//    //根据文件路径找到相应的卷
//    char volname[26];
//    int i=0,rec=0;
//    for(;path[i]!='/'&&i<26;i++)
//        volname[i]=path[i];
//    volname[i]='\0';
//    if(!path[i+1])
//        return -2;//是根目录
//    rec=i;
//    for(i=0;i<MAX_VOLUMES;i++)
//        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
//        (strcmp(vols[i].name,volname)==0))
//            break;
//    if(i==MAX_VOLUMES)return -1;
//    driver_args arg={
//            .path=path+rec+1
//    };
//    vfs_dir_entry dir;
//    vfs_dir_entry res;
//    int voln=i;
//    if(vols[i].fs->find(path+rec+1,dir,&res)==-1)//找不到文件 ((driver*)vols[i].fs_drv)->find(&arg)==-1
//    {
//        if(mode&FILE_MODE_WRITE) {
//            return ((driver *) vols[i].fs_drv)->touch(&arg);//这里之后要改
//        }else
//            return -1;
//    }
//    vfs_dir_entry entry=res;//=arg.entry;
//    int j=-1;
//    for(i=0;i<MAX_OPEN_FILES;i++)
//    {
//        if(opened[i].voln==voln&&opened[i].id==entry.id)
//        {
//            if(mode==FILE_MODE_WRITE)
//            {
//                return -1;//读模式会重新给一个fno但是指向同一个文件
//            }
//        }
//    }
//    for(i=0;i<MAX_OPEN_FILES;i++)
//    {
//        if(!opened[i].mode) {
//            j = i;
//            break;
//        }
//    }
//    if(j==-1)return -1;
//    opened[j]=entry;
//    opened[j].fno=i;
//    opened[j].link_c++;
//    add_proc_openf(&opened[j]);
//    return opened[j].fno;
//}
//int sys_close(int fno)
//{
//    for(int i=0;i<MAX_OPEN_FILES;i++)
//    {
//        if(opened[i].fno==fno)
//        {
//            opened[i].link_c--;
//            return 0;
//        }
//    }
//    return -1;
//}
//int sys_write(int fno, char *src, int len)
//{
//    vfs_dir_entry *f= get_vfs_entry(fno);
//    if(!f)return -1;
//    if(f->type==FTYPE_REG)
//    {
//        return vfs_write_file(f,src,len);
//    }else if(f->type==FTYPE_BLKDEV)
//    {
//        int block=get_according_bnr(f);
//        return write_block(f->dev,block,src,len);
//    }
//    return -1;
//   /*  driver_args args={
//            .fid=f->id,
//            .src_addr=src,
//            .len=len,
//            .pos=pos
//    };
//    return ((driver*)vols[f->voln].fs_drv)->write(&args); */
//}
//int sys_read(int fno, char *dist,  int len)
//{
//    vfs_dir_entry *f= get_vfs_entry(fno);
//    if(!f)return -1;
//    if(f->type==FTYPE_REG)
//    {
//        return vfs_read_file(f,dist,len);
//    }else if(f->type==FTYPE_BLKDEV)
//    {
//        int block=get_according_bnr(f);
//        return read_block(f->dev,block,dist,len);
//    }
//    return -1;
//    // driver_args args={
//    //         .fid=f->id,
//    //         .dist_addr=dist,
//    //         .len=len,
//    //         .pos=pos,
//    //         .entry=*f
//    // };
//    // return ((driver*)vols[f->voln].fs_drv)->read(&args);
//}
//int sys_seek(int fno, int offset, int origin)
//{
//    vfs_dir_entry *f= get_vfs_entry(fno);
//    if(!f)return -1;
//    f->ptr=offset+origin;
//    return 0;
//}
int sys_tell(int fno)
{
    struct file* f=current->openf[fno];
    return f->position;
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

//释放缓冲区（只释放这一块）
int brelse(buffer_head* bh)
{
    wait_on_buf(bh);
    if(bh->b_count==0)return -1;
    bh->b_count--;
    if(bh->b_count==0)
        kmfree(bh->b_data);
    return 0;
}
//从设备中读取指定设备的指定块并返回缓冲区
buffer_head* bread(int dev,int blk)
{

    buffer_head *bh=get_buf(dev,blk);
    if(!bh)return -1;//申请失败
    if(!bh->b_uptodate)
    {
        driver_args arg;
        arg.dev=dev;
        arg.cmd=DRVF_READ;
        arg.dist_addr=bh->b_data;
        arg.len=BLOCK_SIZE;
        arg.lba=bh->b_blocknr;
        arg.sec_c=BLOCK_SIZE/512;//之后会改
        //lock_buffer(bh);//锁定缓冲块直到读取完成
        int reqi=make_request(&arg);
        wait_on_req(reqi);
        clear_req(reqi);
    }
    return bh;
}


int vfs_read_file(vfs_dir_entry *f,char *buf,int len)
{
    int dev=f->dev;
    do{
        int block=get_according_bnr(f);
        buffer_head* bh=bread(dev,block);
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
        memcpy(buf,bh->b_data,size);
        len-=BLOCK_SIZE;
        //读写指针后移
        f->ptr+=size;
        brelse(bh);
    }while(len>0);
    return 0;
}
int vfs_write_file(vfs_dir_entry *f,char *buf,int len)
{
    int dev=f->dev;
    do{
        int block=get_according_bnr(f);
        buffer_head* bh=get_buf(dev,block);
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
        memcpy(bh->b_data,buf,size);
        len-=BLOCK_SIZE;
        //读写指针后移
        f->ptr+=size;
        bh->b_dirt=1;//修改置位
        brelse(bh);
    }while(len>0);
    return 0;
}

int vfs_seek_file(vfs_dir_entry *f,int offset,int origin)
{
    switch (origin)
    {
    case SEEK_SET:
        f->ptr=offset;
        break;
    case SEEK_CUR:
        f->ptr+=offset;
        break;
    case SEEK_END:
        f->ptr=f->size;
        break;
    default:
        break;
    }
    return f->ptr;
}
//返回文件ptr在块设备中的块号
int get_according_bnr(vfs_dir_entry *f)
{
    return vols[f->voln].fs->get_according_bnr(f);

}
//获取或者新建一个和dev上block相对应的缓冲区。
buffer_head* get_buf(int dev,int block)
{
    for(int i=0;i<NR_BUFFERHEADS;i++)
    {
        if(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block)
        {
            repeat:
            wait_on_buf(&buffer_heads[i]);//等待解锁
            if(buffer_heads[i].b_count>0)//别的进程正在用
                goto repeat;
            if(!(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block))//别的进程修改了
                continue;
            return &buffer_heads[i];
        }
    }
    //空头中找
    for(int i=0;i<NR_BUFFERHEADS;i++)
    {
        if(buffer_heads[i].b_count==0)
        {
            if(buffer_heads[i].b_dirt)
            {
                sync_buf(&buffer_heads[i]);
                wait_on_buf(&buffer_heads[i]);
            }
            buffer_heads[i].b_count++;
            //给buffer分配一个实际的缓冲区
            buffer_heads[i].b_data= kmalloc();
            return &buffer_heads[i];
        }
    }
}

void wait_on_buf(buffer_head* bh)
{
    //等待缓冲区解锁
    while (bh->b_lock);
    
}

//扫描块设备，读取分区，识别文件系统
int scan_dev(int dev)
{
//    device *blkdev=get_dev(dev);
//    buffer_head* bh=bread(dev,0);
//    if(!bh)return -1;
    char* buf= kmalloc();
    int r=request(DISK_MAJOR_MAJOR,DISK_CMD_READ,0,1,buf);
    chk_result(r);

    dpt_t* dpte=buf+0x1be;
    for(int i=0;i<4;i++)
    {
//        blkdev->par[i].type=dpte->type;
        int stlba=dpte->start_lba;
//        blkdev->par[i].start_sec=stlba;
//        int i;
//        for(i=0;i<MAX_FS;i++)
//        {
//            if(fs[i].read_superblock&&fs[i].read_superblock(dev,stlba)==0)
//            {
//                reg_vol(dev,i,blkdev->name);//识别成功，注册卷
//            }
//        }
//        if(i==MAX_FS)
//        {
//            printf("err:unrecognised partition fs.\n");
//        }

//        blkdev->par[i].end_sec=dpte->end_lba;
        dpte++;
    }
//    brelse(bh);
    return 0;
}

int sync_buf(buffer_head* bh)
{
    int dev=bh->b_dev;
    int block=bh->b_blocknr;
    //这里需要调用块设备写函数write_block
    return write_block(dev,block,bh->b_data,BLOCK_SIZE);

}
//操作块设备函数
int write_block(int dev,int block,char *buf,int len)
{
    do{
        buffer_head* bh=get_buf(dev,block);
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
        memcpy(bh->b_data,buf,size);
        len-=BLOCK_SIZE;
        bh->b_dirt=1;//修改置位
        brelse(bh);
    }while(len>0);
    return 0;
}
int read_block(int dev,int block,char* buf,int len)
{
    do{
        buffer_head* bh=bread(dev,block);
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
        memcpy(buf,bh->b_data,size);
        len-=BLOCK_SIZE;
        brelse(bh);
    }while(len>0);
    return 0;
}

int init_vfs()
{
    //扫描块设备
    extern device *dev_tree[];
    extern device devs[];
    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
    for(;p;p=p->next)
    {
        if(scan_dev(p-devs)!=0)return -1;
    }

    return 0;
}
