#include "fat16.h"
#include "mem.h"
#include "str.h"
#include "syscall.h"
#include "typename.h"
#define _ONLY_DATA_
#include "virfs.h"
#include "devman.h"
#define NULL (void*)0
BPB superblock;
dir_entry root_dir[MAX_FILES_PER_DIR];
dir_entry cur_dir;
dir_entry a_clu_of_dir[16];
short fat[8192];
//经过验证的数据，不要再动了
int clu_sec_balance=63;
//记录进入了几层目录：0=根目录。
//和ls的方式有关。
int dir_depth=0;
const driver fat16_drv={
        .open=load,
        .read=read_file,
        .write=write_file,
        .mkdir=mkdir,
        .touch=touch,
        .find=get_entry,
        .rm=rm
};
const device fat16_dev={
        .drv=&fat16_drv,
        .flag=DEV_FLAG_USED,
        .type=DEV_TYPE_BLKDEV
};

int fat16_drvi;
extern driver drv_disk;
extern int disk_drvi;
int init_fat16()
{
    reg_device(&fat16_dev);
    fat16_drvi=reg_driver(&fat16_drv);
    driver_args arg;
    load(&arg);//syscall(SYSCALL_CALL_DRVFUNC,fat16_drvi,DRVF_OPEN,&arg,0,0);
    reg_vol(disk_drvi,fat16_drvi,"a");
    return 0;
}
int load(driver_args *args)
{
    //sys_read superblock
    int req_id=-1;
    read_sec(&superblock,0,1);
    //只能一个一个读
    read_sec(fat,superblock.rsvdSec,superblock.secPerFAT);

    //sys_read root
    int root_sec_num=superblock.rsvdSec+superblock.secPerFAT*\
    superblock.numOfFAT;
    //printf("root sec num:%d\n",root_sec_num);
    //usually a root dir has 32 secs
    int root_sec_c=((u32)superblock.rootEntries* sizeof(dir_entry))/(u32)superblock.bytesPerSec;
    read_sec(root_dir,root_sec_num,root_sec_c);

    cur_dir.fistCluNum=0;

    //set some vars
    //why? because the .bss won't be packed into bin so any init
    //of global var in .c is meaningless.
    clu_sec_balance=superblock.rsvdSec+32+32-2;//63;
    //printf("clu sec bal:%d\n",clu_sec_balance);
    dir_depth=0;
    return 0;

}

//检查输入的文件名长度是否合法，以及是否出现非法字符（但是不检查大小写和.）
//返回值为布尔值。
int verify_name(char *str)
{
    char valid_ch[]="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,/![]|+";
    if(strlen(str)>11||strlen(str)==0) {
        //printf("length not valid\n");
        return 0;
    }
    int c=0,i=0,flag=0,vchf=1;
    for(;str[i]!='.'&&str[i]!='\0';i++)
    {
        int j=0;
        for(;j<sizeof(valid_ch);j++)
            if(str[i]==valid_ch[j])break;
        if(j>=sizeof(valid_ch))
        {
            //printf("invalid char\n");
            return 0;//出现非法字符
        }
        if(str[i]!=' ')flag=1;
        c++;
    }
    if(c>8||flag==0){
        //printf("file name blank\n");
        return 0;//不能全是空格
    }
    if(str[i]=='\0')//没有扩展名
        return 1;
    c=0;
    flag=0;
    for(i++;str[i]!='\0';i++)
    {
        int j=0;
        for(;j<sizeof(valid_ch);j++)
            if(str[i]==valid_ch[j])break;
        if(j>=sizeof(valid_ch)){
            //printf("invalid char:%x\n",str[i]);
            return 0;//出现非法字符
        }
        if(str[i]!=' ')flag=1;
        if(str[i]=='.'){
            //printf("multiple dots.");
            return 0;//不能多次出现.
        }
        c++;
    }
    if(c>3||flag==0){
        //printf("file name blank\n");
        return 0;//不能全是空格
    }
    return 1;
}
//将“aaa.bb”的文件名形式转换为可以直接strcmp(,,11)的形式。
//默认文件名合法，请先检查文件名再使用。
void format_name(char *str)
{
    char v[12]="           ";
    int ptr=0;
    int namelen=0;
    for(int i=0;str[i]!='\0';i++)
    {
        if(str[i]>='a'&&str[i]<='z')
        {
            v[ptr++]=str[i]-'a'+'A';
            namelen++;
        }
        else if(str[i]=='.')
        {
            ptr+=(8-namelen);
        }else
        {
            v[ptr++]=str[i];
            namelen++;
        }
    }
    v[12]='\0';
    strcpy(str,v);
}
int req_cluster()
{
    for(int i=3;i<sizeof(fat)/sizeof(short);i++)
    {
        if(fat[i]==0)
        {
            fat[i]=0xffff;
            return i;
        }
    }
    return -1;
}
int write_sec(char *src, int sec_num, int sec_c)
{
    driver_args arg={
            .src_addr=src,
            .sec_n=sec_num,
            .sec_c=sec_c
    };
    return drv_disk.read(&arg);
}
void set_attr(dir_entry *f,char attr)
{
    f->attr|=attr;
}
/*
situations that might change the fat:
mkdir
touch
rm
situations that might change the root:
mkdir
touch
rm
*/
void update_fat_and_root()
{
    int root_loc=superblock.rsvdSec+\
    superblock.secPerFAT*superblock.numOfFAT;
    //printf("root_loc:0x%x\n",root_loc);
    write_sec(root_dir,root_loc,sizeof(root_dir));
    //printf("updated root\n");
    write_sec(fat,superblock.rsvdSec,sizeof(fat));
    //printf("updated fat\n");

}
void add_dot_and_ddot_dir(dir_entry dir)
{
    //it must be a regular dir to add. and ..
    //and this must be done when the dir is created
    //regular dir
    int cluster = dir.fistCluNum;
    read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
    superblock.secPerClu);
    //.
    strcpy(a_clu_of_dir[0].name,".       ");
    strcpy(a_clu_of_dir[0].extension,"   ");
    a_clu_of_dir[0].fistCluNum=dir.fistCluNum;
    a_clu_of_dir[0].len=0;
    set_attr(&a_clu_of_dir[0],ATTR_DIR);
    //..
    strcpy(a_clu_of_dir[1].name,"..      ");
    strcpy(a_clu_of_dir[1].extension,"   ");
    a_clu_of_dir[1].fistCluNum=cur_dir.fistCluNum;
    a_clu_of_dir[1].len=0;
    set_attr(&a_clu_of_dir[1],ATTR_DIR);
    //update the dir
    int dir_loc=cluster+clu_sec_balance;
    write_sec(a_clu_of_dir,dir_loc,sizeof(a_clu_of_dir));
    //no need to update fat and root
}
void translate_attr(char attr,char *attr_s)
{
    //rwhds (s: system h:hidden)
    int v=attr&1;
    if(v)//sys_read-only
        attr_s[1]='-';
    v=attr&2;
    if(v)//hidden
        attr_s[2]='h';
    v=attr&4;
    if(v)//system
        attr_s[4]='s';
    v=attr&8;
    if(v)//volume label
        attr_s[3]='v';
    v=attr&16;
    if(v)//dir
        attr_s[3]='d';
    //archive: do nothing
    attr_s[5]='\0';
}
int extend_cluster(short cluster)
{
    int new_clu=req_cluster();
    if(new_clu==-1)
        return -1;
    fat[cluster]=new_clu;
    return 0;
}
/*
5.  偏移地址36H，长度2，内容为BA 49。表示时间=小时*2048+分钟*32+秒/2。
得出的结果换算成16进制填入即可。也就是：36H字节的0~4位是以2秒为单位的量值；36H字节的5~7位
和37H字节的0~2位是分钟；37H字节的3~7位是小时。


6.  偏移地址38H，长度2，内容为A3 3A。表示日期=(年份-1980)*512+月份*32+日。
得出的结果换算成16进制填入即可。也就是：38H字节0~4位是日期数；38H字节5~7位和39H字节0位是月份；
39H字节的1~7位为年号，原定义中0~119分别代表1980~2099，目前高版本的Windows允许取0~127，
即年号最大可以到2107年。
*/
int touch(driver_args *arg)
{
    char *name=arg->path;
    dir_entry dir;
    dir.fistCluNum=arg->entry.id;
    //default set to 512
    int max_files=16;
    dir_entry *dir_table=a_clu_of_dir;
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
    //current cluster you're at
    unsigned short cluster=dir.fistCluNum;
    do{
        for(int i=0;i<max_files;i++)
        {
            //printf("%s\n",dir_table[i].name);
            if((unsigned char)dir_table[i].name[0]==0xe5||\
            dir_table[i].name[0]==0)
            {
                //available
                //put name
                format_name(name);
                memcpy(dir_table[i].name,name,11);
                int clu=req_cluster();
                if(clu==-1)
                {
                    //puts("err: full disk");
                    return -1;
                }
                dir_table[i].fistCluNum=clu;
                set_attr(&dir_table[i],ATTR_ARCHIVE);
                dir_table[i].len=superblock.bytesPerSec*superblock.secPerClu;
                //date and time
                //dir_table[i].lastModfDate=get_date_stab();
                //dir_table[i].lastModfTime=get_time_stab();
                //update
                write_sec(dir_table,cluster+clu_sec_balance,\
                superblock.bytesPerSec*superblock.secPerClu);
                return -1;
            }
        }
        if(fat[cluster]>=FAT_EOF&&extend_cluster(cluster)==-1)
        {
            //extend fail
            //puts("err:full disk");
            return -1;
        }else if(cluster<FAT_EOF)
        {
            cluster=fat[cluster];
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
        }
    }while(cluster<FAT_EOF);
    return 0;
}
//attention: the name must be char[12]
int mkdir(driver_args *arg)
{
    char *name=arg->path;
    dir_entry dir;
    dir.fistCluNum=arg->entry.id;
    format_name(name);
    //regular dir
    unsigned short cluster = dir.fistCluNum;
    do
    {
        read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
            superblock.secPerClu);
        for (int i = 0; i < 16; i++)
        {
            if(a_clu_of_dir[i].fistCluNum==0||\
            (unsigned char)root_dir[i].name[0]==0xe5||\
            (unsigned char)root_dir[i].name[0]==0)
            {
                memset(&a_clu_of_dir[i],0,sizeof(dir_entry));
                memset(a_clu_of_dir[i].name,' ',11);
                strcpy(a_clu_of_dir[i].name,name);
                a_clu_of_dir[i].name[strlen(name)]=' ';
                int clu=req_cluster();
                if(clu==-1)//check
                {
                    //puts("err:full dir");
                    return -1;
                }
                a_clu_of_dir[i].fistCluNum=clu;
                //set attr
                set_attr(&a_clu_of_dir[i],ATTR_DIR);
                //set length
                a_clu_of_dir[i].len=0;
                //date and time
                /*a_clu_of_dir[i].lastModfDate=get_date_stab();
                a_clu_of_dir[i].lastModfTime=get_time_stab();*/
                //set date:temporarily none
                //add . and ..
                add_dot_and_ddot_dir(a_clu_of_dir[i]);
                //update the dir
                int dir_loc=cluster+clu_sec_balance;
                write_sec(a_clu_of_dir,dir_loc,sizeof(a_clu_of_dir));
                update_fat_and_root();
                return 0;
            }
        }

        if(cluster<FAT_EOF)
            cluster=fat[cluster];
    } while (cluster<FAT_EOF);
    return -1;
}
/*void ls()
{
    unsigned short cluster = cur_dir.fistCluNum;
    char *format_str="%s    %s   %s   %d\n\0";
    //puts("name    ext  attr   len");
    if(!dir_depth)
    {
        //root dir
        for(int i=0;i<MAX_FILES_PER_DIR;i++)
        {
            //0xe5 is the char for deleted file
            if((unsigned char)root_dir[i].name[0]!=0xe5&&\
            root_dir[i].name[0]!=0)
            {
                dir_entry tmp=root_dir[i];
                char name[9]={0};
                memcpy(name,tmp.name,8);
                //analyze the attr
                char attr=tmp.attr;
                char attr_s[6]="rw---";//rwhds (s: system h:hidden)
                translate_attr(attr,attr_s);
                //archive: do nothing
                //printf(format_str,name,tmp.extension,\
                attr_s,tmp.len);
            }
        }
    }else
    {
        do
        {
            read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
            superblock.secPerClu);
            for (int i = 0; i < 16; i++)
            {
                if((unsigned char)a_clu_of_dir[i].name[0]!=0xe5&&\
            a_clu_of_dir[i].name[0]!=0)
                {
                    dir_entry tmp=a_clu_of_dir[i];
                    char name[9]={0};
                    memcpy(name,tmp.name,8);
                    //analyze the attr
                    char attr=tmp.attr;
                    char attr_s[6]="rw---";//rwhds (s: system h:hidden)
                    translate_attr(attr,attr_s);
                    //printf(format_str,name,tmp.extension,\
                    attr_s,tmp.len);
                }
            }
            
            if(cluster<FAT_EOF)
                cluster=fat[cluster];
        } while (cluster<FAT_EOF);
    }
    
    
}*/
int read_sec(char *dist, int sec_num, int sec_count)
{
    driver_args arg={
            .dist_addr=dist,
            .lba=sec_num,
            .sec_c=1
    };
    for(int i=0;i<sec_count;i++)
    {
        drv_disk.read(&arg);
        arg.dist_addr+=superblock.bytesPerSec;
        arg.lba++;
    }
    return 0;
}

int rm(driver_args* args)
{
    char *name=args->path;
    dir_entry dir;
    driver_args tmparg={
            .path=args->dir_path,
    };
    if(get_entry(&tmparg)==-1)return -1;
    dir.fistCluNum=tmparg.entry.id;
    dir_entry *dir_table=a_clu_of_dir;
    //regular dir
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
    superblock.secPerClu);
    dir_table=a_clu_of_dir;
    //current cluster you're at
    unsigned short cluster=dir.fistCluNum;
    int i=0;
    while(cluster<FAT_EOF){
        read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
        for(;i<16;i++)
        {
            if(dir_table[i].fistCluNum==args->entry.id)
            {
                if(dir_table[i].attr&ATTR_DIR){
                    //要处理里面的文件
                }
                dir_table[i].name[0]=0xe5;
                goto del_entry_finish;
            }
        }
        if(cluster<FAT_EOF)
        {
            cluster=fat[cluster];
            //update
            //if you can reach here it means it's a regular dir
        }

    }
del_entry_finish:
    ;
    //del fat
    unsigned short del_clu=dir_table[i].fistCluNum;
    unsigned short pion=del_clu<FAT_EOF?fat[del_clu]:0xffff;
    while(pion<FAT_EOF)
    {
        fat[del_clu]=0;
        del_clu=pion;
        pion=fat[pion];
    }
    fat[del_clu]=0;
    //del dir entry
    write_sec(dir_table,cluster+clu_sec_balance,\
    superblock.secPerClu*superblock.bytesPerSec);
    update_fat_and_root();
    return 0;
}
int find_f=0;
int find(char *name)
{
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
    int index=0;
    dir_entry *dir_table=a_clu_of_dir;
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
    if(cur_dir.fistCluNum==0)
        dir_table=root_dir;
    else {
        max_files=16;
        read_sec(dir_table, cluster + clu_sec_balance, \
            superblock.secPerClu);
    }
    do{
        for(int i=0;i<max_files;i++)
        {
            if(dir_table[i].name[0]==0||dir_table[i].name[0]==0xe5)
                continue;
            if(memcmp(dir_table[i].name,name,11)==0)
            {
                return index+i;
            }
        }
        if(cur_dir.fistCluNum==0)
            return -1;
        else if(cluster<FAT_EOF)
        {
            index+=16;
            cluster=fat[cluster];
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
        }
    }while(cluster<FAT_EOF);
    return -1;

}

int read_file_byname(char *full_name,char *dist,int pos,int len)
{
    int index= find(NULL);
    if(index==-1||pos<0)
        return -1;
    
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
    dir_entry *dir_table=root_dir;
    int in_root=1;
    if(cur_dir.fistCluNum!=0)
    {
        //regular dir
        in_root=0;
        max_files=16;
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
        dir_table=a_clu_of_dir;
    }
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
    while(!in_root&&index>=16&&cluster<FAT_EOF){
        index-=16;
        if(cluster<FAT_EOF)
        {
            cluster=fat[cluster];
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
        }
    }
    //arrived
    dir_entry file=dir_table[index];
    int f_cluster = file.fistCluNum;
    int cluster_size=superblock.bytesPerSec*superblock.secPerClu;
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
    {
        pos-=cluster_size;
        f_cluster=fat[f_cluster];
        if(pos<cluster_size)
            break;
    }
    if(f_cluster>=FAT_EOF&&pos>=cluster_size)
        return -1;//pos out of range
    //
    char temp[cluster_size];
    //the first time of reading might be not aligned
    read_sec(temp,f_cluster+clu_sec_balance,superblock.secPerClu);
    memcpy(dist,temp+pos,cluster_size-pos);
    dist+=cluster_size-pos;
    len-=cluster_size-pos;
    while (f_cluster<FAT_EOF&&len>0)
    {
        f_cluster=fat[f_cluster];
        read_sec(dist,f_cluster+clu_sec_balance,superblock.secPerClu);
        dist+=cluster_size;
        len-=cluster_size;
    }
    return 0;
    
}
int write_file_byname(char *full_name,char *src,int pos,int len)
{
    int index= find(NULL);
    if(index==-1||pos<0)
        return -1;
    
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
    dir_entry *dir_table=root_dir;
    int in_root=1;
    if(cur_dir.fistCluNum!=0)
    {
        //regular dir
        in_root=0;
        max_files=16;
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
        dir_table=a_clu_of_dir;
    }
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
    while(!in_root&&index>=16&&cluster<FAT_EOF){
        index-=16;
        if(cluster<FAT_EOF)
        {
            cluster=fat[cluster];
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
        }
    }
    //arrived
    dir_entry file=dir_table[index];
    int f_cluster = file.fistCluNum;
    int cluster_size=superblock.bytesPerSec*superblock.secPerClu;
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
    {
        pos-=cluster_size;
        if(pos<cluster_size)
            break;
        f_cluster=fat[f_cluster];
    }
    if(f_cluster>=FAT_EOF&&pos>=cluster_size)
        return -1;//pos out of range
    //
    char temp[cluster_size];
    //the first time of writing might not be aligned
    if(pos>0)
    {
        memcpy(temp+pos,src,cluster_size-pos);
        write_sec(temp,f_cluster,cluster_size-pos);
        if(fat[f_cluster]>=FAT_EOF&&len>0)
        {
            //extend
            extend_cluster(f_cluster);
        }
        f_cluster=fat[f_cluster];
    }
    while (f_cluster<FAT_EOF&&len>=cluster_size)
    {
        write_sec(src,f_cluster+clu_sec_balance,cluster_size);
        src+=cluster_size;
        len-=cluster_size;
        if(fat[f_cluster]>=FAT_EOF&&len>0)
        {
            //extend
            extend_cluster(f_cluster);
        }
        f_cluster=fat[f_cluster];
    }
    if(len>0)
    {
        //there might be some leftover less than a cluster
        memcpy(temp,src,len);
        write_sec(temp,f_cluster+clu_sec_balance,cluster_size);
    }
    return 0;

}


int file_exist(dir_entry entry)
{
    if((unsigned char)entry.name[0]==0xe5u||\
    (unsigned char)entry.name[0]==0u)
    {
        //printf("file not exist\n");
        return 0;

    }
    return 1;
}
int get_entry(driver_args* args)
{
    char *name=args->path;
    dir_entry dir;
    dir.fistCluNum=((vfs_dir_entry*)args->cwd)->id;
    dir_entry entry;
    vfs_dir_entry ret;
    entry.name[0]=0xe5;

    char *p=name;
    char nametmp[12];
    int index=-1;
    while(*name!='\0')
    {
        if(*name=='/')
        {
            if(name-p>11)return -1;
            memcpy(nametmp,p,name-p);
            cur_dir=dir;
            format_name(nametmp);
            index= find(nametmp);
            if(index==-1)return -1;
            if(cur_dir.fistCluNum==0)//在根目录
                dir=root_dir[index];
            else//在子目录
                dir=a_clu_of_dir[index%16];
            p=name+1;
        }
        name++;
    }

    //现在就可以开始找文件了
    format_name(p);
    index= find(p);
    if(index==-1)return -1;
    
    if(cur_dir.fistCluNum==0)//在根目录
        entry=root_dir[index];
    else//在子目录
        entry=a_clu_of_dir[index%16];
    ret.id=entry.fistCluNum;
    args->entry=ret;
    return 0;
}
/*
int cd(char *name)
{
    dir_entry dir;
    get_entry(name,&dir,cur_dir);
    if(!file_exist(dir))
        return;
    if(memcmp(dir.name,"..      ",8)==0)
        dir_depth--;
    else if(memcmp(dir.name,".       ",8)!=0)
        dir_depth++;
    cur_dir=dir;
}*/
/*
int enter_dir(char *path)
{
    char *dir=strtok(path,'/');
    while(dir!=NULL)
    {
        if(find(NULL) == -1)
            return 0;
        cd(dir);
        dir=strtok(NULL,'/');
    }
    return 0;
}*/
void get_fname(char *path,char *name)
{
    char *prev,*ptr=strtok(path,'/');
    while(ptr!=NULL)
    {
        prev=ptr;
        ptr=strtok(NULL,'/');
    }
    strcpy(name,prev);
}
char buf[1024];
int read_file(driver_args* args)
{
    int len=args->len;
    int pos=args->pos;
    dir_entry f;
    f.fistCluNum=args->entry.id;
    char* dist=args->dist_addr;
    int c=len/superblock.bytesPerSec;
    c+=len%superblock.bytesPerSec?1:0;
    //printf("[fs]%d secs to sys_read.\n",c);
    int n=0;
    unsigned short clu=f.fistCluNum;
    int mpos=pos/superblock.bytesPerSec;
    for(;clu<FAT_EOF&&mpos>0;mpos--)
    {
         clu=fat[clu];
    }
    if(mpos>0)return -1;//读取位置超出范围
    pos%=superblock.bytesPerSec;
    int block_size=superblock.secPerClu*superblock.bytesPerSec;
    while(n<c)
    {
        read_sec(buf,clu+clu_sec_balance,superblock.secPerClu);
        //printf("%x+%x\n",buf,pos);
        int cplen=block_size-pos>len?len:block_size-pos;
        memcpy(dist,buf+pos,cplen);
        n++;
        dist+=block_size-pos;
        if(pos>0)pos=0;
        clu=fat[clu];
        if(clu>=FAT_EOF)break;
    }
    return n;
}
int write_file(driver_args* args)
{
    int len=args->len;
    int pos=args->pos;
    dir_entry f;
    f.fistCluNum=args->entry.id;
    char* src=args->src_addr;
    pos/=superblock.bytesPerSec;
    int c=len/512+len%512?1:0;
    int n=0;
    unsigned short clu=f.fistCluNum;
    for(;clu<FAT_EOF&&pos>0;pos--,clu=fat[clu]);
    if(pos>0)return -1;//读取位置超出范围
    while(n<c)
    {
        write_sec(src,clu+clu_sec_balance,1);
        n++;
        src+=superblock.bytesPerSec;
        clu=fat[clu];
        if(clu>=FAT_EOF)break;
    }
    return n;
    
}