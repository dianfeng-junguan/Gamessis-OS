#include <blk_dev.h>
#include <errno.h>
struct blk_dev blk_devs[MAX_BLKDEVS];
struct request requests[MAX_REQUESTS];
int reg_blkdev(struct blk_dev* dev){
    for(int i=0;i<MAX_BLKDEVS;i++){
        if(blk_devs[i].do_request)continue;
        blk_devs[i]=*dev;
        blk_devs[i].current_request=NULL;
        return i;
    }
    return -ENOMEM;
}
int unreg_blkdev(unsigned short dev){
    if(blk_devs[dev].current_request)
        return -EBUSY;//设备还有没完成的请求
    blk_devs[dev].do_request=0;//清除
}
int make_request(unsigned short dev,int cmd,unsigned long sector, unsigned long count,char * buffer){
    struct blk_dev* d=&blk_devs[BLKDEV_MAJOR(dev)];
    if(!d->do_request)
        return -ENODEV;//没有这个设备
    //找一个空的请求
    struct request* req=NULL;
    for(int i=0;i<MAX_REQUESTS;i++){
        if(requests[i].dev==(unsigned short)-1){
            req=requests+i;
            break;
        }
    }
    //下面的处理不太好。感觉最好是等到有空位置为止。
    if(!req)
        return -ENOMEM;//没有空的请求位置。
    /*
    检查有没有请求正在运行，有的话接到后面，没有的话直接接上去，前面请求完成之后顺着链表下一个，
    这样就能保证所有请求都可以被访问到。
    */
    req->dev=dev;
    req->cmd=cmd;
    req->buffer=buffer;
    req->count=count;
    req->next=NULL;
    req->nr_sectors=TO_BLKN(count);
    req->sector=sector;
    req->waiting=current;
    //这里可能不需要阻塞进程，有的设备不需要阻塞。    
    if(!d->current_request)
    {
        d->current_request=req;
        d->do_request(d->current_request);
    }else{
        struct request* rp=d->current_request;
        for(;rp->next;rp=rp->next);
        rp->next=req;
    }
    return 1;
}
void init_blkdev(void){
    for(int i=0;i<MAX_REQUESTS;i++){
        requests[i].dev=-1;
    }
}