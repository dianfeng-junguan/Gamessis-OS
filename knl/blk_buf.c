#include <blk_buf.h>
#include <blk_dev.h>
#include <mem.h>
#include <errno.h>
#include <memory.h>
buffer_head l_buffer_heads[MAX_BUFFERHEADS];
//这个存储的是各个块设备映射的缓冲区链表中的头
buffer_head* l_blk_bh_heads[MAX_BLKDEVS];
void init_blkbuf(){
    for(int i=0;i<MAX_BUFFERHEADS;i++){
        l_buffer_heads[i].dev=-1;
        l_blk_bh_heads[i]=NULL;
    }
}
buffer_head *bget(){
    for(int i=0;i<MAX_BUFFERHEADS;i++){
        if(l_buffer_heads[i].dev==(unsigned short)-1)
        {
            l_buffer_heads[i].data=kmalloc(0,PAGE_4K_SIZE);
            l_buffer_heads[i].count=0;
            l_buffer_heads[i].next=NULL;
            l_buffer_heads[i].prev=NULL;
            return l_buffer_heads+i;
        }
    }
    //errno = -ENOBUF
    return NULL;
}

buffer_head *get_block(unsigned short dev,int blocknr){
    buffer_head *bh=l_blk_bh_heads[BLKDEV_MAJOR(dev)];
    if(!bh){
        //这个设备没有任何的缓冲区
        bh=bget();
        if(!bh){
            //errno=-ENOBUFS
            return NULL;
        }
        bh->dev=dev;
        bh->blocknr=blocknr;
        l_blk_bh_heads[BLKDEV_MAJOR(dev)]=bh;
    }else{
        for(;bh->next&&bh->blocknr!=blocknr;bh=bh->next);
        if(bh->blocknr!=blocknr)
        {
            //这块数据没有缓冲
            //这个时候肯定处于链表最后一个了
            bh->next=bget();
            buffer_head *bhn=bh->next;
            bhn->prev=bh;
            bh=bhn;
            bh->dev=dev;
            bh->blocknr=blocknr;
        }
    }
    //TODO 等待缓冲解锁
    bh->count++;
    return bh;
}
//从指定的块设备中读取一块数据，然后返回这块数据。
buffer_head* bread(unsigned short dev,int blkn){
    if(!blk_devs[BLKDEV_MAJOR(dev)].do_request)
        return NULL;
    buffer_head *bh=get_block(dev,blkn);
    if(!bh)
        return NULL;
    if(bh->uptodate)
        return bh;//数据没变，可以直接返回
    //这里的疑点是，可以直接返回吗？
    //应该要等数据准备完毕之后再返回的
    make_request(dev,BLKDEV_REQ_READ,blkn*BLOCK_SIZE/SECTOR_SIZE,BLOCK_SIZE,bh->data);
    //TODO 等待读取完成
    return bh;
}
/*
向缓冲区写入数据。注意缓冲区的大小固定BLOCK_SIZE。
这会使得dirty置位。
*/
int bwrite(buffer_head* bh,char* src,int pos,int count){
    if(!bh)
        return -ENOBUFS;
    if (count+pos>BLOCK_SIZE)
        count=BLOCK_SIZE-pos;//truncate
    memcpy(bh->data+pos,src,count);
    bh->dirt=1;
    bh->uptodate=0;
    return 1;
}
/*
立即把缓冲区里面的更新应用到块设备上。
*/
int bflush(buffer_head* bh){
    if(!blk_devs[bh->dev].do_request)
        return -ENODEV;
    if(!bh->dirt)
        return 1;
    make_request(bh->dev,BLKDEV_REQ_WRITE,bh->blocknr*BLOCK_SIZE/SECTOR_SIZE,BLOCK_SIZE/SECTOR_SIZE,bh->data);
    //这个不用等
    return 1;
}
//丢弃更改。
int bdiscard(buffer_head *bh){
    if(bh->dev==-1||!blk_devs[bh->dev].do_request)
        return -ENODEV;
    
    if(bh->uptodate)
        return 1;//数据没变，可以直接返回
    //这里的疑点是，可以直接返回吗？
    //应该要等数据准备完毕之后再返回的
    make_request(bh->dev,BLKDEV_REQ_READ,bh->blocknr*BLOCK_SIZE/SECTOR_SIZE,BLOCK_SIZE/SECTOR_SIZE,bh->data);
    //TODO 等待读取完成
    return 1;
}

int bupdate(buffer_head *bh){
    return bdiscard(bh);
}
/*
bread的更高级封装，可以不以块为单位读取到buf。
*/
int blkdev_read(unsigned short dev,off_t offset, size_t count, char *buf){
    int n=TO_BLKN(count);
    off_t blkn=BLOCK_FLOOR(offset);
    off_t first_off=offset%BLOCK_SIZE;
    char* p=buf;
    size_t mod_count=count%BLOCK_SIZE;
    int len=BLOCK_SIZE-first_off;
    for(int i=0;i<n;i++){
        buffer_head *bh=bread(dev,blkn);
        if(!bh)
            return -ENOBUFS;//buffer不够了
        if(i==n-1)
            len=mod_count;
        else if(i==2)
            len=BLOCK_SIZE;
        memcpy(p,bh->data+first_off,len);
        brelse(bh);
        blkn++;
        p+=BLOCK_SIZE;
        first_off=0;
    }
    return 1;
}

int blkdev_write(unsigned short dev,off_t offset, size_t count, char *buf){
    int n=TO_BLKN(count);
    off_t blkn=BLOCK_FLOOR(offset);
    off_t first_off=offset%BLOCK_SIZE;
    char* p=buf;
    size_t mod_count=count%BLOCK_SIZE;
    int len=BLOCK_SIZE-first_off;
    for(int i=0;i<n;i++){
        buffer_head *bh=get_block(dev,blkn);
        if(!bh)
            return -ENOBUFS;//buffer不够了
        if(i==n-1)
            len=mod_count;
        else if(i==2)
            len=BLOCK_SIZE;
        memcpy(bh->data+first_off,p,len);
        brelse(bh);
        blkn++;
        p+=BLOCK_SIZE;
        first_off=0;
    }
    return 1;

}
int brelse(buffer_head *bh){
    if(bh->dev==(unsigned short)-1||!blk_devs[BLKDEV_MAJOR(bh->dev)].do_request)
        return -ENODEV;
    if(bh->dirt)
        bflush(bh);
    bh->count--;
    if(bh->count==0)
    {
        if(bh->prev)
            bh->prev->next=bh->next;
        if(bh->next)
            bh->next->prev=bh->prev;
        for(int i=0;i<MAX_BLKDEVS;i++){
            if(l_blk_bh_heads[i]==bh)
            {
                l_blk_bh_heads[i]=bh->next;
                break;
            }
        }
        bh->dev=-1;
        kmfree(bh->data);
    }
    return 1;
}