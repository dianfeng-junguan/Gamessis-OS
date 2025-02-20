#include "fat32.h"

#include "devman.h"
#include "driverman.h"
#include "errno.h"
#include "ioctlarg.h"
#include "log.h"
#include "memory.h"
#include "proc.h"
#include "str.h"
#include "vfs.h"
#include "volume.h"
#include "sys/stat.h"
#include "kwchar.h"
#ifdef DEBUG
#    include <stdio.h>
#    include <string.h>
#    include <stdlib.h>
#    include <wchar.h>
#    include <sys/types.h>
#else
#    include "sys/unistd.h"
#endif
/**
 * @brief 读取扇区数据
 * @param dev 设备号
 * @param offset 扇区字节偏移
 */
int read_block(unsigned short dev, off_t offset, size_t len, char* buf)
{
    drvioctlarg_read ioctlarg;
    ioctlarg.lba   = offset / 512;
    ioctlarg.count = (len + 511) / 512;
    ioctlarg.dev   = dev;
    char* tmpbuf   = (char*)kmalloc(0, len);
    ioctlarg.buf   = tmpbuf;
    if (dev_ioctl(dev, DRIVER_CMD_READ, 1, &ioctlarg) < 0) {
        KFREE(tmpbuf);
        return -1;
    }
    memcpy(buf + offset % 512, tmpbuf, len);
    KFREE(tmpbuf);
    return 0;
}
/**
 * @brief
 * 写入扇区数据，只支持以扇区为单位的整块写入，请不要用来部分地修改扇区数据
 * @param dev 设备号
 * @param offset 扇区字节偏移
 * @param count 写入字节数
 * @param buf 写入数据缓冲区
 * @return 0 成功，-1 失败
 */
int write_block(unsigned short dev, off_t offset, size_t count, char* buf)
{
    drvioctlarg_read ioctlarg;
    ioctlarg.lba   = offset / 512;
    ioctlarg.count = count / 512;
    ioctlarg.buf   = buf;
    ioctlarg.dev   = dev;
    if (dev_ioctl(dev, DRIVER_CMD_WRITE, 1, &ioctlarg) < 0) {
        return -1;
    }
    return 0;
}

unsigned int DISK1_FAT32_read_FAT_Entry(struct FAT32_sb_info* fsbi, unsigned int fat_entry)
{
    size_t        fat_size = fsbi->sector_per_FAT * 512;
    int           sector   = fsbi->FAT1_firstsector + (fat_entry >> 7);
    unsigned int* buf      = kmalloc(0, fat_size);
    if (read_block(ROOT_DEV, sector * 512, fat_size, buf) < 0) {
        KPRINTF("DISK1_FAT32_read_FAT_Entry read_block ERROR!!!!!!!!!!\n");
        KFREE(buf);
        return 0;
    }
    // comprintf("DISK1_FAT32_read_FAT_Entry
    // fat_entry:%x,%x\n",fat_entry,buf[fat_entry & 0x7f]);
    unsigned int fatr = buf[fat_entry & 0x7f] & 0x0fffffff;
    KFREE(buf);
    return fatr;
}

unsigned long DISK1_FAT32_write_FAT_Entry(struct FAT32_sb_info* fsbi, unsigned int fat_entry,
                                          unsigned int value)
{
    unsigned int* buf = kmalloc(0, 512);
    int           i;
    read_block(ROOT_DEV, (fsbi->FAT1_firstsector + (fat_entry >> 7)) * 512, 512, buf);
    // buffer_head* bh       = bread(ROOT_DEV, fsbi->FAT1_firstsector + (fat_entry
    // >> 7)); buf                   = bh->data;
    buf[fat_entry & 0x7f] = (buf[fat_entry & 0x7f] & 0xf0000000) | (value & 0x0fffffff);

    for (i = 0; i < fsbi->NumFATs; i++) {
        off_t off = (fsbi->FAT1_firstsector + fsbi->sector_per_FAT * i + (fat_entry >> 7)) * 512;
        write_block(ROOT_DEV, off, 512, buf);
    }
    KFREE(buf);
    // brelse(bh);

    return 1;
}

long FAT32_open(struct index_node* inode, struct file* filp)
{
    return 1;
}

long FAT32_close(struct index_node* inode, struct file* filp)
{
    return 1;
}

long FAT32_read(struct file* filp, char* buf, unsigned long count, long* position)
{
    struct FAT32_inode_info* finode = filp->dentry->dir_inode->private_index_info;
    struct FAT32_sb_info*    fsbi   = filp->dentry->dir_inode->sb->private_sb_info;

    unsigned long cluster = finode->first_cluster;
    unsigned long sector  = 0;
    int           i, length = 0;
    long          retval = 0;
    int           index  = *position / fsbi->bytes_per_cluster;
    long          offset = *position % fsbi->bytes_per_cluster;
    char*         buffer = (char*)kmalloc(0, fsbi->bytes_per_cluster + PAGE_4K_SIZE - 1);

    if (!cluster)
        return -EFAULT;
    for (i = 0; i < index; i++)
        cluster = DISK1_FAT32_read_FAT_Entry(fsbi, cluster);

    if (*position + count > filp->dentry->dir_inode->file_size)
        index = count = filp->dentry->dir_inode->file_size - *position;
    else
        index = count;

    //	comprintf("FAT32_read
    // first_cluster:%d,size:%d,preempt_count:%d\n",finode->first_cluster,filp->dentry->dir_inode->file_size,current->preempt_count);

    do {
        memset(buffer, 0, fsbi->bytes_per_cluster);
        sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
        if (read_block(filp->dentry->dir_inode->dev,
                       sector * 512,
                       fsbi->sector_per_cluster * 512,
                       buffer) < 0) {
            comprintf("FAT32 FS(read) read disk ERROR!!!!!!!!!!\n");
            retval = -EIO;
            break;
        }

        length =
            index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;

        if ((unsigned long)buf < MAX_TASKS)
            memcpy(buf, buffer + offset, length);
        else
            memcpy(buf, buffer + offset, length);

        index -= length;
        buf += length;
        offset -= offset;
        *position += length;
    } while (index && (cluster = DISK1_FAT32_read_FAT_Entry(fsbi, cluster)));

    KFREE(buffer);
    if (!index)
        retval = count;
    return retval;
}

unsigned long FAT32_find_available_cluster(struct FAT32_sb_info* fsbi)
{
    int           i, j;
    int           fat_entry;
    unsigned long sector_per_fat = fsbi->sector_per_FAT;
    unsigned int  buf[128];

    //	fsbi->fat_fsinfo->FSI_Free_Count & fsbi->fat_fsinfo->FSI_Nxt_Free not
    // exactly,so unuse

    for (i = 0; i < sector_per_fat; i++) {
        memset(buf, 0, 512);
        read_block(ROOT_DEV, (fsbi->FAT1_firstsector + i) * 512, 512, buf);

        for (j = 0; j < 128; j++) {
            if ((buf[j] & 0x0fffffff) == 0)
                return (i << 7) + j;
        }
    }
    return 0;
}

long FAT32_write(struct file* filp, char* buf, unsigned long count, long* position)
{
    struct FAT32_inode_info* finode = filp->dentry->dir_inode->private_index_info;
    struct FAT32_sb_info*    fsbi   = filp->dentry->dir_inode->sb->private_sb_info;

    unsigned long cluster      = finode->first_cluster;
    unsigned long next_cluster = 0;
    unsigned long sector       = 0;
    int           i, length = 0;
    long          retval = 0;
    long          flags  = 0;
    int           index  = *position / fsbi->bytes_per_cluster;
    long          offset = *position % fsbi->bytes_per_cluster;
    char*         buffer = (char*)kmalloc(0, fsbi->bytes_per_cluster);

    if (!cluster) {
        cluster = FAT32_find_available_cluster(fsbi);
        flags   = 1;
    }
    else
        for (i = 0; i < index; i++)
            cluster = DISK1_FAT32_read_FAT_Entry(fsbi, cluster);

    if (!cluster) {
        KFREE(buffer);
        return -ENOSPC;
    }

    if (flags) {
        finode->first_cluster = cluster;
        filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
        DISK1_FAT32_write_FAT_Entry(fsbi, cluster, 0x0ffffff8);
    }

    index = count;

    do {
        if (!flags) {
            memset(buffer, 0, fsbi->bytes_per_cluster);
            sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;

            if (read_block(filp->dentry->dir_inode->dev,
                           sector * 512,
                           fsbi->sector_per_cluster * 512,
                           buffer) < 0) {
                comprintf("FAT32 FS(write) read disk ERROR!!!!!!!!!!\n");
                retval = -EIO;
                break;
            }
        }

        length =
            index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;

        if ((unsigned long)buf < MAX_TASKS)
            memcpy(buffer + offset, buf, length);
        else
            memcpy(buffer + offset, buf, length);
        sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
        if (write_block(filp->dentry->dir_inode->dev,
                        sector * 512,
                        fsbi->sector_per_cluster * 512,
                        buffer) < 0) {
            comprintf("FAT32 FS(write) write disk ERROR!!!!!!!!!!\n");
            retval = -EIO;
            break;
        }

        index -= length;
        buf += length;
        offset -= offset;
        *position += length;

        if (index)
            next_cluster = DISK1_FAT32_read_FAT_Entry(fsbi, cluster);
        else
            break;

        if (next_cluster >= 0x0ffffff8) {
            next_cluster = FAT32_find_available_cluster(fsbi);
            if (!next_cluster) {
                KFREE(buffer);
                return -ENOSPC;
            }

            DISK1_FAT32_write_FAT_Entry(fsbi, cluster, next_cluster);
            DISK1_FAT32_write_FAT_Entry(fsbi, next_cluster, 0x0ffffff8);
            cluster = next_cluster;
            flags   = 1;
        }

    } while (index);

    if (*position > filp->dentry->dir_inode->file_size) {
        filp->dentry->dir_inode->file_size = *position;
        filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
    }

    KFREE(buffer);
    if (!index)
        retval = count;
    return retval;
}

long FAT32_lseek(struct file* filp, long offset, long origin)
{
    struct index_node* inode = filp->dentry->dir_inode;
    long               pos   = 0;

    switch (origin) {
    case SEEK_SET: pos = offset; break;

    case SEEK_CUR: pos = filp->position + offset; break;

    case SEEK_END: pos = filp->dentry->dir_inode->file_size + offset; break;

    default: return -EINVAL; break;
    }

    if (pos < 0 || pos > filp->dentry->dir_inode->file_size)
        return -EOVERFLOW;

    filp->position = pos;
    comprintf("FAT32 FS(lseek) alert position:%d\n", filp->position);

    return pos;
}

long FAT32_ioctl(struct index_node* inode, struct file* filp, unsigned long cmd, unsigned long arg)
{}

long FAT32_readdir(struct file* filp, void* dirent, filldir_t filler)
{
    struct FAT32_inode_info* finode = filp->dentry->dir_inode->private_index_info;
    struct FAT32_sb_info*    fsbi   = filp->dentry->dir_inode->sb->private_sb_info;

    unsigned int                cluster = 0;
    unsigned long               sector  = 0;
    unsigned char*              buf     = NULL;
    char*                       name    = NULL;
    int                         namelen = 0;
    int                         i = 0, j = 0, x = 0, y = 0;
    struct FAT32_Directory*     tmpdentry  = NULL;
    struct FAT32_LongDirectory* tmpldentry = NULL;

    buf = kmalloc(0, fsbi->bytes_per_cluster);

    cluster = finode->first_cluster;

    j = filp->position / fsbi->bytes_per_cluster;

    for (i = 0; i < j; i++) {
        cluster = DISK1_FAT32_read_FAT_Entry(fsbi, cluster);
        if (cluster > 0x0ffffff7) {
            comprintf("FAT32 FS(readdir) cluster didn`t exist\n");
            return -1;
        }
    }

next_cluster:
    sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
    if (read_block(
            filp->dentry->dir_inode->dev, sector * 512, fsbi->sector_per_cluster * 512, buf) < 0) {
        comprintf("FAT32 FS(readdir) read disk ERROR!!!!!!!!!!\n");
        KFREE(buf);
        return -1;
    }

    tmpdentry = (struct FAT32_Directory*)(buf + filp->position % fsbi->bytes_per_cluster);

    for (i = filp->position % fsbi->bytes_per_cluster; i < fsbi->bytes_per_cluster;
         i += 32, tmpdentry++, filp->position += 32) {
        if (tmpdentry->DIR_Attr == ATTR_LONG_NAME)
            continue;
        if (tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 ||
            tmpdentry->DIR_Name[0] == 0x05)
            continue;

        namelen    = 0;
        tmpldentry = (struct FAT32_LongDirectory*)tmpdentry - 1;

        if (tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5 &&
            tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05) {
            j = 0;
            // long file/dir name read
            while (tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5 &&
                   tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05) {
                j++;
                if (tmpldentry->LDIR_Ord & 0x40)
                    break;
                tmpldentry--;
            }

            name = kmalloc(0, j * 13 + 1);
            memset(name, 0, j * 13 + 1);
            tmpldentry = (struct FAT32_LongDirectory*)tmpdentry - 1;

            for (x = 0; x < j; x++, tmpldentry--) {
                for (y = 0; y < 5; y++)
                    if (tmpldentry->LDIR_Name1[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
                        name[namelen++] = (char)tmpldentry->LDIR_Name1[y];

                for (y = 0; y < 6; y++)
                    if (tmpldentry->LDIR_Name2[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
                        name[namelen++] = (char)tmpldentry->LDIR_Name2[y];

                for (y = 0; y < 2; y++)
                    if (tmpldentry->LDIR_Name3[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
                        name[namelen++] = (char)tmpldentry->LDIR_Name3[y];
            }
            goto find_lookup_success;
        }

        name = kmalloc(0, 15);
        memset(name, 0, 15);
        // short file/dir base name compare
        for (x = 0; x < 8; x++) {
            if (tmpdentry->DIR_Name[x] == ' ')
                break;
            if (tmpdentry->DIR_NTRes & LOWERCASE_BASE)
                name[namelen++] = tmpdentry->DIR_Name[x] + 32;
            else
                name[namelen++] = tmpdentry->DIR_Name[x];
        }

        if (tmpdentry->DIR_Attr & ATTR_DIRECTORY)
            goto find_lookup_success;

        name[namelen++] = '.';

        // short file ext name compare
        for (x = 8; x < 11; x++) {
            if (tmpdentry->DIR_Name[x] == ' ')
                break;
            if (tmpdentry->DIR_NTRes & LOWERCASE_EXT)
                name[namelen++] = tmpdentry->DIR_Name[x] + 32;
            else
                name[namelen++] = tmpdentry->DIR_Name[x];
        }
        if (x == 8)
            name[--namelen] = 0;
        goto find_lookup_success;
    }

    cluster = DISK1_FAT32_read_FAT_Entry(fsbi, cluster);
    if (cluster < 0x0ffffff7)
        goto next_cluster;

    KFREE(buf);
    return -1;

find_lookup_success:

    filp->position += 32;
    return filler(dirent, name, namelen, 0, 0);
}

struct file_operations FAT32_file_ops = {
    .open  = FAT32_open,
    .close = FAT32_close,
    .read  = FAT32_read,
    .write = FAT32_write,
    .lseek = FAT32_lseek,
    .ioctl = FAT32_ioctl,

    .readdir = FAT32_readdir,
};

void generate_short_name(char* full_name, char* short_name)
{
    // 这里简化处理，实际需要实现8.3格式的短文件名生成
    // 例如：生成一个短文件名ABCDEF~1.TXT
    memset(short_name, ' ', 11);
    strncpyk(short_name, full_name, 8);
    for (int i = 0; i < 8; i++) {
        if (short_name[i] == '\0') {
            short_name[i] = ' ';
        }
    }

    char* ext = strrchrk(full_name, '.');
    if (ext && ext != full_name) {
        ext++;
        strncpyk(short_name + 8, ext, 3);
        for (int i = 8; i < 11; i++) {
            if (short_name[i] == '\0') {
                short_name[i] = ' ';
            }
        }
    }

    short_name[8]  = '~';
    short_name[9]  = '1';
    short_name[10] = '.';
}

unsigned char calculate_alias_checksum(char* short_name)
{
    // 计算短文件名的校验和
    unsigned char checksum = 0;
    for (int i = 0; i < 11; i++) {
        checksum = ((checksum & 1) << 7) + (checksum >> 1) + short_name[i];
    }
    return checksum;
}

void write_short_dir_entry(struct index_node* parent_inode, struct FAT32_Directory* short_entry,
                           struct FAT32_inode_info* fatinode)
{
    struct FAT32_inode_info* finode = parent_inode->private_index_info;
    struct FAT32_sb_info*    fsbi   = parent_inode->sb->private_sb_info;

    unsigned int                cluster = 0;
    unsigned long               sector  = 0;
    unsigned char*              buf     = NULL;
    int                         i = 0, j = 0, x = 0;
    struct FAT32_Directory*     tmpdentry  = NULL;
    struct FAT32_LongDirectory* tmpldentry = NULL;
    struct index_node*          p          = NULL;

    buf = kmalloc(0, fsbi->bytes_per_cluster);

    cluster = finode->first_cluster;

next_cluster:
    sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
    comprintf("lookup cluster:0x%x,sector:0x%x\r\n", cluster, sector);
    if (read_block(parent_inode->dev, sector * 512, fsbi->sector_per_cluster * 512, buf) < 0) {
        comprintf("FAT32 FS(create) read disk ERROR!!!!!!!!!!\n");
        KFREE(buf);
        return;
    }

    tmpdentry = (struct FAT32_Directory*)buf;

    for (i = 0; i < fsbi->bytes_per_cluster; i += 32, tmpdentry++) {
        if (tmpdentry->DIR_Attr == ATTR_LONG_NAME)
            continue;
        if (!(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 ||
              tmpdentry->DIR_Name[0] == 0x05))
            continue;
        // 找到空闲的位置
        //设置短目录项各项属性
        memcpy(tmpdentry, short_entry, sizeof(struct FAT32_Directory));
        goto find_lookup_success;
    }

    cluster = DISK1_FAT32_read_FAT_Entry(fsbi, cluster);
    if (cluster < 0x0ffffff7)
        goto next_cluster;

    KFREE(buf);
    return;

find_lookup_success:
    // 写入目录项到磁盘
    fatinode->dentry_location = cluster;
    fatinode->dentry_position = tmpdentry - (struct FAT32_Directory*)buf;
    write_block(parent_inode->dev, sector * 512, fsbi->sector_per_cluster * 512, buf);
    KFREE(buf);
}
void write_dir_entries(struct index_node* parent_inode, struct FAT32_LongDirectory* long_entries,
                       int num_long_entries, struct FAT32_Directory* short_entry,
                       struct FAT32_inode_info* fatinode)
{
    // 实现具体的写入逻辑
    // 例如：将长目录项和短目录项写入磁盘
    // 这里简化处理，实际需要处理磁盘空间分配和写入

    struct FAT32_inode_info* finode = parent_inode->private_index_info;
    struct FAT32_sb_info*    fsbi   = parent_inode->sb->private_sb_info;

    unsigned int   cluster = 0;
    unsigned long  sector  = 0;
    unsigned char* buf     = NULL;
    // ofis: offset in sector
    int                         ofis       = 0;
    struct FAT32_Directory*     tmpdentry  = NULL;
    struct FAT32_LongDirectory* tmpldentry = NULL;
    struct index_node*          p          = NULL;

    buf = kmalloc(0, fsbi->bytes_per_cluster);

    cluster = finode->first_cluster;


next_cluster:
    sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
    comprintf("lookup cluster:0x%x,sector:0x%x\r\n", cluster, sector);
    if (read_block(parent_inode->dev, sector * 512, fsbi->sector_per_cluster * 512, buf) < 0) {
        comprintf("FAT32 FS(create) read disk ERROR!!!!!!!!!!\n");
        KFREE(buf);
        return;
    }

    tmpdentry                   = (struct FAT32_Directory*)buf;
    int consecutive_empty_slots = 0, start_ofis = 0;

    for (ofis = 0; ofis < fsbi->bytes_per_cluster; ofis += 32, tmpdentry++) {
        if (tmpdentry->DIR_Attr == ATTR_LONG_NAME ||
            !(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 ||
              tmpdentry->DIR_Name[0] == 0x05)) {
            consecutive_empty_slots = 0;
            start_ofis              = ofis;
            continue;
        }
        consecutive_empty_slots++;
        if (consecutive_empty_slots == num_long_entries + 1) {
            // 找到空闲的位置
            tmpldentry = tmpdentry - 1;
            for (int j = 0; j < num_long_entries; j++, tmpldentry--) {
                memcpy(tmpldentry, long_entries + j, sizeof(struct FAT32_LongDirectory));
            }

            fatinode->dentry_location = cluster;
            fatinode->dentry_position = tmpdentry - (struct FAT32_Directory*)buf;
            memcpy(tmpdentry, short_entry, sizeof(struct FAT32_Directory));
            write_block(parent_inode->dev, sector * 512, fsbi->sector_per_cluster * 512, buf);
            goto done;
        }
    }

find_lookup_success:
    // 写入目录项到磁盘
    write_block(parent_inode->dev, sector * 512, fsbi->sector_per_cluster * 512, buf);

    cluster = DISK1_FAT32_read_FAT_Entry(fsbi, cluster);
    if (cluster < 0x0ffffff7)
        goto next_cluster;
    //扩展fat
    unsigned long new_cluster = FAT32_find_available_cluster(fsbi);
    if (!new_cluster) {
        KPRINTF("No available cluster\n");
        KFREE(buf);
        return;
    }
    DISK1_FAT32_write_FAT_Entry(fsbi, cluster, new_cluster);
    DISK1_FAT32_write_FAT_Entry(fsbi, new_cluster, 0x0ffffff8);
    cluster = new_cluster;
    goto next_cluster;

done:
    KFREE(buf);
}
#define TOUPPER(c) ((c) >= 'a' && (c) <= 'z' ? (c)-32 : (c))
// 此函数用于将输入的名称处理成符合 FAT32 短文件名比较的格式
void process_fat32_short_name(const char* input, char* output)
{
    const char* dot          = strchrk(input, '.');
    size_t      filename_len = (dot != NULL) ? (dot - input) : strlenk(input);
    size_t      ext_len      = (dot != NULL) ? strlenk(dot + 1) : 0;

    // 处理文件名部分
    for (size_t i = 0; i < filename_len && i < 8; i++) {
        output[i] = (char)TOUPPER(input[i]);
    }
    // 填充文件名部分剩余位置为空格
    for (size_t i = filename_len; i < 8; i++) {
        output[i] = ' ';
    }

    // 处理扩展名部分
    if (ext_len > 0) {
        output[8] = '.';
        for (size_t i = 0; i < ext_len && i < 3; i++) {
            output[9 + i] = (char)TOUPPER(dot[1 + i]);
        }
        // 填充扩展名部分剩余位置为空格
        for (size_t i = ext_len; i < 3; i++) {
            output[9 + i] = ' ';
        }
    }
    else {
        // 没有扩展名，对应位置填充空格
        output[8]  = ' ';
        output[9]  = ' ';
        output[10] = ' ';
    }
    output[11] = '\0';
}

/**
    @brief 此函数用于比较两个 FAT32 短文件名是否相同
    @p name1
    @p name2 是要比较的两个短文件名
    @return 相同则返回 1，不同则返回 0
 */
int compare_fat32_short_names(const char* name1, const char* name2)
{
    char processed_name1[12] = {0};
    char processed_name2[12] = {0};

    // 处理两个输入名称
    process_fat32_short_name(name1, processed_name1);
    process_fat32_short_name(name2, processed_name2);

    // 比较处理后的名称
    return strcmpk(processed_name1, processed_name2) == 0;
}

/**
 * @brief 创建文件，传入的parent_inode和dentry已经填写好信息,dentry需要分配inode
 * @param parent_inode 父目录节点
 * @param dentry 待创建的文件节点
 * @param mode 文件权限
 * @return 0 成功，<0失败
 */

long FAT32_create(struct index_node* parent_inode, struct dir_entry* dentry, int mode)
{
    if (!parent_inode || !dentry) {
        comprintf("FAT32 FS(create) inode or dentry is NULL\n");
        return -EINVAL;
    }
    if (parent_inode->attribute != FS_ATTR_DIR) {
        comprintf("FAT32 FS(create) parent inode is not a directory\n");
        return -EINVAL;
    }
    char* full_name        = dentry->name;
    int   full_name_length = strlenk(full_name);

    // 创建短目录项
    struct FAT32_Directory* short_entry =
        (struct FAT32_Directory*)kmalloc(0, sizeof(struct FAT32_Directory));


    //填写private_index_info
    struct FAT32_inode_info* new_finode =
        (struct FAT32_inode_info*)kmalloc(0, sizeof(struct FAT32_inode_info));
    memset(new_finode, 0, sizeof(struct FAT32_inode_info));
    new_finode->first_cluster             = 0;
    dentry->dir_inode->private_index_info = new_finode;
    new_finode->create_date               = short_entry->DIR_CrtTime;
    new_finode->create_time               = short_entry->DIR_CrtDate;
    new_finode->write_date                = short_entry->DIR_WrtTime;
    new_finode->write_time                = short_entry->DIR_WrtDate;
    new_finode->dentry_location           = 0;
    new_finode->dentry_position           = 0;

    if (full_name_length > MAX_SHORT_NAME_LENGTH) {
        // 需要创建长目录项
        // 计算需要的长目录项数量
        int num_long_entries = (full_name_length + 12) / 13;
        if (num_long_entries > MAX_LONG_NAME_ENTRIES) {
            // 文件名太长，返回错误
            KPRINTF("File name too long\n");
            return -ENAMETOOLONG;
        }

        memset(short_entry, 0, sizeof(struct FAT32_Directory));
        short_entry->DIR_Attr = (mode == S_IFDIR) ? 0x10 : 0x00;   // 0x10 表示目录，0x00 表示文件

        // 生成短文件名（这里简化处理，实际需要实现8.3格式的短文件名生成）
        char short_name[11] = {0};
        generate_short_name(full_name, short_name);
        memcpy(short_entry->DIR_Name, short_name, 11);

        // 创建长目录项
        struct FAT32_LongDirectory* long_entries = (struct FAT32_LongDirectory*)kmalloc(
            0, sizeof(struct FAT32_LongDirectory) * num_long_entries);
        memset(long_entries, 0, sizeof(struct FAT32_LongDirectory) * num_long_entries);
        wchar_t* long_name_unicode = (wchar_t*)kmalloc(0, (num_long_entries + 1) * 13 * 2);
        memset(long_name_unicode, 0, (num_long_entries + 1) * 13 * 2);
        int long_name_unicode_len = mbstowcsk(long_name_unicode, full_name, num_long_entries * 13);
#ifdef DEBUG
        wprintf(L"long name converted to unicode: %s\n", long_name_unicode);
#endif
        // 填充长目录项
        for (int i = 0; i < num_long_entries; i++) {
            long_entries[i].LDIR_Ord    = (i == num_long_entries - 1) ? 0x40 | (i + 1) : i + 1;
            long_entries[i].LDIR_Attr   = 0x0F;   // 长目录项的属性固定为0x0F
            long_entries[i].LDIR_Chksum = calculate_alias_checksum(short_name);

            // 分配文件名
            int offset = i * 13;
            for (int j = 0; j < 5; j++) {
                long_entries[i].LDIR_Name1[j] =
                    (offset + j * 2 < full_name_length) ? long_name_unicode[offset + j] : 0;
            }
            for (int j = 0; j < 6; j++) {
                long_entries[i].LDIR_Name2[j] =
                    (offset + j * 2 + 1 < full_name_length) ? long_name_unicode[offset + j + 5] : 0;
            }
            for (int j = 0; j < 2; j++) {
                long_entries[i].LDIR_Name3[j] = (offset + j * 2 + 10 < full_name_length)
                                                    ? long_name_unicode[offset + j + 11]
                                                    : 0;
            }
        }

        // 写入长目录项和短目录项到磁盘
        // 这里假设有一个函数`write_dir_entries`来处理具体的写入
        write_dir_entries(parent_inode, long_entries, num_long_entries, short_entry, new_finode);
        KFREE(long_name_unicode);
        KFREE(long_entries);
    }
    else {
        // 创建短目录项
        memset(short_entry, 0, sizeof(struct FAT32_Directory));
        short_entry->DIR_Attr = (mode == S_IFDIR) ? 0x10 : 0x00;   // 0x10 表示目录，0x00 表示文件

        memset(short_entry->DIR_Name, ' ', 11);
        memcpy(short_entry->DIR_Name, full_name, full_name_length);

        // 写入短目录项到磁盘
        // 这里假设有一个函数`write_short_dir_entry`来处理具体的写入
        write_short_dir_entry(parent_inode, short_entry, new_finode);
        KFREE(short_entry);
    }

    return 0;
}

struct dir_entry* FAT32_lookup(struct index_node* parent_inode, struct dir_entry* dest_dentry)
{
    struct FAT32_inode_info* finode = parent_inode->private_index_info;
    struct FAT32_sb_info*    fsbi   = parent_inode->sb->private_sb_info;

    unsigned int                cluster = 0;
    unsigned long               sector  = 0;
    unsigned char*              buf     = NULL;
    int                         i = 0, j = 0, x = 0;
    struct FAT32_Directory*     tmpdentry  = NULL;
    struct FAT32_LongDirectory* tmpldentry = NULL;
    struct index_node*          p          = NULL;

    buf = kmalloc(0, fsbi->bytes_per_cluster);

    cluster = finode->first_cluster;

next_cluster:
    sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
    comprintf("lookup cluster:0x%x,sector:0x%x\r\n", cluster, sector);
    if (read_block(parent_inode->dev, sector * 512, fsbi->sector_per_cluster * 512, buf) < 0) {
        comprintf("FAT32 FS(lookup) read disk ERROR!!!!!!!!!!\n");
        KFREE(buf);
        return NULL;
    }

    tmpdentry = (struct FAT32_Directory*)buf;

    for (i = 0; i < fsbi->bytes_per_cluster; i += 32, tmpdentry++) {
        if (tmpdentry->DIR_Attr == ATTR_LONG_NAME)
            continue;
        if (tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 ||
            tmpdentry->DIR_Name[0] == 0x05)
            continue;

        tmpldentry = (struct FAT32_LongDirectory*)tmpdentry - 1;
        j          = 0;

        // long file/dir name compare
        while (tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5) {
            for (x = 0; x < 5; x++) {
                if (j > dest_dentry->name_length && tmpldentry->LDIR_Name1[x] == 0xffff)
                    continue;
                else if (j > dest_dentry->name_length ||
                         tmpldentry->LDIR_Name1[x] != (unsigned short)(dest_dentry->name[j++]))
                    goto continue_cmp_fail;
            }
            for (x = 0; x < 6; x++) {
                if (j > dest_dentry->name_length && tmpldentry->LDIR_Name2[x] == 0xffff)
                    continue;
                else if (j > dest_dentry->name_length ||
                         tmpldentry->LDIR_Name2[x] != (unsigned short)(dest_dentry->name[j++]))
                    goto continue_cmp_fail;
            }
            for (x = 0; x < 2; x++) {
                if (j > dest_dentry->name_length && tmpldentry->LDIR_Name3[x] == 0xffff)
                    continue;
                else if (j > dest_dentry->name_length ||
                         tmpldentry->LDIR_Name3[x] != (unsigned short)(dest_dentry->name[j++]))
                    goto continue_cmp_fail;
            }

            if (j >= dest_dentry->name_length) {
                goto find_lookup_success;
            }

            tmpldentry--;
        }
        /*
                // short file/dir base name compare
                j = 0;
                for (x = 0; x < 8; x++) {
                    switch (tmpdentry->DIR_Name[x]) {
                    case ' ':
                        if (!(tmpdentry->DIR_Attr & ATTR_DIRECTORY)) {
                            if (dest_dentry->name[j] == '.')
                                continue;
                            else if (tmpdentry->DIR_Name[x] == dest_dentry->name[j]) {
                                j++;
                                break;
                            }
                            else if (dest_dentry->name[j] == '\0') {
                                continue;
                            }
                            else
                                goto continue_cmp_fail;
                        }
                        else {
                            if (j < dest_dentry->name_length &&
                                tmpdentry->DIR_Name[x] == dest_dentry->name[j]) {
                                j++;
                                break;
                            }
                            else if (j == dest_dentry->name_length)
                                continue;
                            else
                                goto continue_cmp_fail;
                        }

                    case 'A' ... 'Z':
                    case 'a' ... 'z':
                        if (tmpdentry->DIR_NTRes & LOWERCASE_BASE)
                            if (j < dest_dentry->name_length &&
                                tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j]) {
                                j++;
                                break;
                            }
                            else
                                goto continue_cmp_fail;
                        else {
                            if (j < dest_dentry->name_length &&
                                tmpdentry->DIR_Name[x] == dest_dentry->name[j]) {
                                j++;
                                break;
                            }
                            else
                                goto continue_cmp_fail;
                        }

                    case '0' ... '9':
                        if (j < dest_dentry->name_length &&
                            tmpdentry->DIR_Name[x] == dest_dentry->name[j]) {
                            j++;
                            break;
                        }
                        else
                            goto continue_cmp_fail;

                    default: j++; break;
                    }
                }
                // short file ext name compare
                if (!(tmpdentry->DIR_Attr & ATTR_DIRECTORY)) {
                    j++;
                    for (x = 8; x < 11; x++) {
                        switch (tmpdentry->DIR_Name[x]) {
                        case 'A' ... 'Z':
                        case 'a' ... 'z':
                            if (tmpdentry->DIR_NTRes & LOWERCASE_EXT)
                                if (tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j]) {
                                    j++;
                                    break;
                                }
                                else
                                    goto continue_cmp_fail;
                            else {
                                if (tmpdentry->DIR_Name[x] == dest_dentry->name[j]) {
                                    j++;
                                    break;
                                }
                                else
                                    goto continue_cmp_fail;
                            }

                        case '0' ... '9':
                            if (tmpdentry->DIR_Name[x] == dest_dentry->name[j]) {
                                j++;
                                break;
                            }
                            else
                                goto continue_cmp_fail;

                        case ' ':
                            if (tmpdentry->DIR_Name[x] == dest_dentry->name[j]) {
                                j++;
                                break;
                            }
                            else if (dest_dentry->name[j] == '\0') {
                                continue;
                            }
                            else
                                goto continue_cmp_fail;

                        default: goto continue_cmp_fail;
                        }
                    }
                } */
        if (compare_fat32_short_names(tmpdentry->DIR_Name, dest_dentry->name)) {
            goto find_lookup_success;
        }

    continue_cmp_fail:;
    }

    cluster = DISK1_FAT32_read_FAT_Entry(fsbi, cluster);
    if (cluster < 0x0ffffff7)
        goto next_cluster;

    KFREE(buf);
    return NULL;

find_lookup_success:
    p = (struct index_node*)kmalloc(0, (sizeof(struct index_node)));
    memset(p, 0, sizeof(struct index_node));
    p->file_size = tmpdentry->DIR_FileSize;
    p->blocks    = (p->file_size + fsbi->bytes_per_cluster - 1) / fsbi->bytes_per_sector;
    p->attribute = (tmpdentry->DIR_Attr & ATTR_DIRECTORY) ? FS_ATTR_DIR : FS_ATTR_FILE;
    p->sb        = parent_inode->sb;
    p->f_ops     = &FAT32_file_ops;
    p->inode_ops = &FAT32_inode_ops;
    p->dev       = parent_inode->dev;

    p->private_index_info = (struct FAT32_inode_info*)kmalloc(0, (sizeof(struct FAT32_inode_info)));
    memset(p->private_index_info, 0, sizeof(struct FAT32_inode_info));
    finode = p->private_index_info;

    finode->first_cluster =
        (tmpdentry->DIR_FstClusHI << 16 | tmpdentry->DIR_FstClusLO) & 0x0fffffff;
    finode->dentry_location = cluster;
    finode->dentry_position = tmpdentry - (struct FAT32_Directory*)buf;
    finode->create_date     = tmpdentry->DIR_CrtTime;
    finode->create_time     = tmpdentry->DIR_CrtDate;
    finode->write_date      = tmpdentry->DIR_WrtTime;
    finode->write_time      = tmpdentry->DIR_WrtDate;

    if ((tmpdentry->DIR_FstClusHI >> 12) && (p->attribute & FS_ATTR_FILE)) {
        p->attribute |= FS_ATTR_DEVICE;
    }
    p->link                = 1;
    dest_dentry->dir_inode = p;
    dest_dentry->dir_ops   = &FAT32_dentry_ops;
    KFREE(buf);
    return dest_dentry;
}

long FAT32_mkdir(struct index_node* inode, struct dir_entry* dentry, int mode)
{
    return FAT32_create(inode, dentry, mode | S_IFDIR);
}


long FAT32_rmdir(struct index_node* parent_inode, struct dir_entry* dest_dentry)
{

    struct FAT32_inode_info* finode = parent_inode->private_index_info;
    struct FAT32_sb_info*    fsbi   = parent_inode->sb->private_sb_info;

    unsigned int                cluster = 0;
    unsigned long               sector  = 0;
    unsigned char*              buf     = NULL;
    int                         i = 0, j = 0, x = 0;
    struct FAT32_Directory*     tmpdentry  = NULL;
    struct FAT32_LongDirectory* tmpldentry = NULL;
    struct index_node*          p          = NULL;

    buf = kmalloc(0, fsbi->bytes_per_cluster);

    cluster = finode->first_cluster;

next_cluster:
    sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
    comprintf("lookup cluster:0x%x,sector:0x%x\r\n", cluster, sector);
    if (read_block(parent_inode->dev, sector * 512, fsbi->sector_per_cluster * 512, buf) < 0) {
        comprintf("FAT32 FS(lookup) read disk ERROR!!!!!!!!!!\n");
        KFREE(buf);
        return -EIO;
    }

    tmpdentry = (struct FAT32_Directory*)buf;

    for (i = 0; i < fsbi->bytes_per_cluster; i += 32, tmpdentry++) {
        if (tmpdentry->DIR_Attr == ATTR_LONG_NAME)
            continue;
        if (tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 ||
            tmpdentry->DIR_Name[0] == 0x05)
            continue;

        tmpldentry = (struct FAT32_LongDirectory*)tmpdentry - 1;
        j          = 0;

        // long file/dir name compare
        while (tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5) {
            for (x = 0; x < 5; x++) {
                if (j > dest_dentry->name_length && tmpldentry->LDIR_Name1[x] == 0xffff)
                    continue;
                else if (j > dest_dentry->name_length ||
                         tmpldentry->LDIR_Name1[x] != (unsigned short)(dest_dentry->name[j++]))
                    goto continue_cmp_fail;
            }
            for (x = 0; x < 6; x++) {
                if (j > dest_dentry->name_length && tmpldentry->LDIR_Name2[x] == 0xffff)
                    continue;
                else if (j > dest_dentry->name_length ||
                         tmpldentry->LDIR_Name2[x] != (unsigned short)(dest_dentry->name[j++]))
                    goto continue_cmp_fail;
            }
            for (x = 0; x < 2; x++) {
                if (j > dest_dentry->name_length && tmpldentry->LDIR_Name3[x] == 0xffff)
                    continue;
                else if (j > dest_dentry->name_length ||
                         tmpldentry->LDIR_Name3[x] != (unsigned short)(dest_dentry->name[j++]))
                    goto continue_cmp_fail;
            }

            if (j >= dest_dentry->name_length) {
                goto find_lookup_success;
            }

            tmpldentry--;
        }

        // short file/dir base name compare
        if (compare_fat32_short_names(tmpdentry->DIR_Name, dest_dentry->name)) {
            goto find_lookup_success;
        }

    continue_cmp_fail:;
    }

    cluster = DISK1_FAT32_read_FAT_Entry(fsbi, cluster);
    if (cluster < 0x0ffffff7)
        goto next_cluster;

    KFREE(buf);
    return -ENOENT;

find_lookup_success:
    tmpldentry = tmpdentry - 1;
    // long file/dir name delete
    while (tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5) {
        if (tmpldentry->LDIR_Ord & 0x40) {   //末尾
            tmpldentry->LDIR_Ord = 0xe5;
            break;
        }
        else {
            tmpldentry->LDIR_Ord = 0xe5;
        }
        tmpldentry--;
    }

    // short file/dir delete
    tmpdentry->DIR_Name[0] = 0xe5;
    //回写
    // sector = fsbi->Data_firstsector + (finode->dentry_location - 2) * fsbi->sector_per_cluster;
    comprintf("delete cluster:0x%x,sector:0x%x\r\n", cluster, sector);
    //释放占用的fat表项
    unsigned int pcluster =
        tmpdentry->DIR_FstClusLO | ((unsigned int)tmpdentry->DIR_FstClusHI << 16);
    while (pcluster < 0x0ffffff7) {
        unsigned int next_cluster = DISK1_FAT32_read_FAT_Entry(fsbi, pcluster);
        DISK1_FAT32_write_FAT_Entry(fsbi, pcluster, 0);
        pcluster = next_cluster;
    }
    if (write_block(parent_inode->dev, sector * 512, fsbi->sector_per_cluster * 512, buf) < 0) {
        comprintf("FAT32 FS(rmdir) write disk ERROR!!!!!!!!!!\n");
    }
    KFREE(buf);
    return 0;
}

/**
    @brief  重命名文件或目录，注意新文件不应该已经被创建。
*/
long FAT32_rename(struct index_node* old_inode, struct dir_entry* old_dentry,
                  struct index_node* new_inode, struct dir_entry* new_dentry)
{
    struct FAT32_Directory*  fdentry = NULL;
    struct FAT32_Directory*  buf     = NULL;
    struct FAT32_inode_info* finode  = old_inode->private_index_info;
    struct FAT32_sb_info*    fsbi    = old_inode->sb->private_sb_info;
    unsigned long            sector  = 0;

    if (finode->dentry_location == 0) {
        comprintf("FS ERROR:write root inode!\n");
        return -EIO;
    }

    sector = fsbi->Data_firstsector + (finode->dentry_location - 2) * fsbi->sector_per_cluster;
    buf    = (struct FAT32_Directory*)kmalloc(0, (fsbi->bytes_per_cluster));
    memset(buf, 0, fsbi->bytes_per_cluster);
    read_block(old_inode->dev, sector * 512, fsbi->sector_per_cluster * 512, buf);
    fdentry = buf + finode->dentry_position;

    ////alert fat32 dentry data
    char processed_name[13];
    if (strlenk(new_dentry->name) <= MAX_SHORT_NAME_LENGTH) {
        //短文件名
        //删除可能存在的长目录项
        struct FAT32_LongDirectory* tmpldentry = (struct FAT32_LongDirectory*)fdentry - 1;
        while (tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5 &&
               tmpldentry >= buf) {
            if (tmpldentry->LDIR_Ord & 0x40) {   //末尾
                tmpldentry->LDIR_Ord = 0xe5;
                break;
            }
            else {
                tmpldentry->LDIR_Ord = 0xe5;
            }
            tmpldentry--;
        }
        process_fat32_short_name(new_dentry->name, processed_name);
        memcpy(fdentry->DIR_Name, processed_name, 11);
        //回写
        write_block(old_inode->dev, sector * 512, fsbi->sector_per_cluster * 512, buf);
        KFREE(buf);
        return 0;
    }
    //长文件名得创一个新文件目录项
    generate_short_name(new_dentry->name, processed_name);
    int mode = (old_dentry->dir_inode->attribute == FS_ATTR_DIR) ? S_IFDIR : S_IFREG;
    //复制名字之外的信息
    char* newname    = new_dentry->name;
    int   newnamelen = new_dentry->name_length;
    memcpy(new_inode, old_inode, sizeof(struct index_node));
    memcpy(new_dentry, old_dentry, sizeof(struct dir_entry));
    new_dentry->dir_inode   = new_inode;
    new_dentry->name        = newname;
    new_dentry->name_length = newnamelen;
    //把旧文件目录项删除，但是不释放fat
    //删除可能存在的长目录项
    struct FAT32_LongDirectory* tmpldentry = (struct FAT32_LongDirectory*)fdentry - 1;
    while (tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5 &&
           tmpldentry >= buf) {
        if (tmpldentry->LDIR_Ord & 0x40) {   //末尾
            tmpldentry->LDIR_Ord = 0xe5;
            break;
        }
        else {
            tmpldentry->LDIR_Ord = 0xe5;
        }
        tmpldentry--;
    }
    //删除旧文件目录项
    fdentry->DIR_Name[0] = 0xe5;
    //回写
    write_block(old_inode->dev, sector * 512, fsbi->sector_per_cluster * 512, buf);
    struct FAT32_inode_info* old_finode = new_inode->private_index_info;
    //创建新文件目录项
    if (FAT32_create(old_dentry->parent->dir_inode, new_dentry, mode) < 0) {
        comprintf("FS ERROR:rename failed!\n");
        return -EIO;
    }
    // create函数会新申请一个finode，这里需要设置
    memcpy(new_dentry->dir_inode->private_index_info, old_finode, sizeof(struct FAT32_inode_info));
    KFREE(old_finode);
    KFREE(buf);
    return 0;
}

long FAT32_getattr(struct dir_entry* dentry, unsigned long* attr)
{
    *attr = dentry->dir_inode->attribute;
    return 0;
}

long FAT32_setattr(struct dir_entry* dentry, unsigned long* attr)
{
    struct index_node*       inode  = dentry->dir_inode;
    struct FAT32_inode_info* finode = inode->private_index_info;
    struct FAT32_sb_info*    fsbi   = inode->sb->private_sb_info;
    unsigned long            sector = 0;

    if (finode->dentry_location == 0) {
        comprintf("FS ERROR:write root inode!\n");
        return -EIO;
    }

    sector = fsbi->Data_firstsector + (finode->dentry_location - 2) * fsbi->sector_per_cluster;
    struct FAT32_Directory* fdentry = NULL;
    struct FAT32_Directory* buf     = NULL;
    buf = (struct FAT32_Directory*)kmalloc(0, (fsbi->bytes_per_cluster));
    memset(buf, 0, fsbi->bytes_per_cluster);
    read_block(inode->dev, sector * 512, fsbi->sector_per_cluster * 512, buf);
    fdentry = buf + finode->dentry_position;

    ////alert fat32 dentry data
    //
    unsigned char fatattr = 0;
    switch (*attr) {
    case FS_ATTR_FILE: fatattr = ATTR_ARCHIVE; break;
    case FS_ATTR_DIR: fatattr = ATTR_DIRECTORY; break;
    case FS_ATTR_DEVICE: fatattr = ATTR_ARCHIVE | ATTR_SYSTEM; break;
    }
    fdentry->DIR_Attr = fatattr;

    write_block(inode->dev, sector * 512, fsbi->sector_per_cluster * 512, buf);
    KFREE(buf);
    return 0;
}

struct index_node_operations FAT32_inode_ops = {
    .create  = FAT32_create,
    .lookup  = FAT32_lookup,
    .mkdir   = FAT32_mkdir,
    .rmdir   = FAT32_rmdir,
    .rename  = FAT32_rename,
    .getattr = FAT32_getattr,
    .setattr = FAT32_setattr,
};

//// these operation need cache and list
long FAT32_compare(struct dir_entry* parent_dentry, char* source_filename,
                   char* destination_filename)
{}
long FAT32_hash(struct dir_entry* dentry, char* filename) {}
long FAT32_release(struct dir_entry* dentry) {}
long FAT32_iput(struct dir_entry* dentry, struct index_node* inode) {}

struct dir_entry_operations FAT32_dentry_ops = {
    .compare = FAT32_compare,
    .hash    = FAT32_hash,
    .release = FAT32_release,
    .iput    = FAT32_iput,
};

void fat32_write_superblock(struct super_block* sb)
{
    //回写更新superblock
    struct FAT32_sb_info* fsbi = sb->private_sb_info;

    struct FAT32_BootSector* fbs = KMALLOC(512);
    read_block(sb->dev, fsbi->start_sector * 512, 512, fbs);

    fbs->BPB_SecPerClus  = fsbi->sector_per_cluster;
    fbs->BPB_BytesPerSec = fsbi->bytes_per_cluster / fsbi->sector_per_cluster;
    fbs->BPB_BytesPerSec = fsbi->bytes_per_sector;
    fbs->BPB_FATSz32     = fsbi->sector_per_FAT;
    fbs->BPB_NumFATs     = fsbi->NumFATs;
    fbs->BPB_FSInfo      = fsbi->fsinfo_sector_infat;
    fbs->BPB_BkBootSec   = fsbi->bootsector_bk_infat;
    write_block(sb->dev, fsbi->start_sector * 512, 512, fbs);
    KFREE(fbs);
}

void fat32_put_superblock(struct super_block* sb)
{
    KFREE(sb->private_sb_info);
    KFREE(sb->root->dir_inode->private_index_info);
    KFREE(sb->root->dir_inode);
    KFREE(sb->root);
    KFREE(sb);
}

void fat32_write_inode(struct index_node* inode)
{
    struct FAT32_Directory*  fdentry = NULL;
    struct FAT32_Directory*  buf     = NULL;
    struct FAT32_inode_info* finode  = inode->private_index_info;
    struct FAT32_sb_info*    fsbi    = inode->sb->private_sb_info;
    unsigned long            sector  = 0;

    if (finode->dentry_location == 0) {
        comprintf("FS ERROR:write root inode!\n");
        return;
    }

    sector = fsbi->Data_firstsector + (finode->dentry_location - 2) * fsbi->sector_per_cluster;
    buf    = (struct FAT32_Directory*)kmalloc(0, (fsbi->bytes_per_cluster));
    memset(buf, 0, fsbi->bytes_per_cluster);
    read_block(inode->dev, sector * 512, fsbi->sector_per_cluster * 512, buf);
    fdentry = buf + finode->dentry_position;

    ////alert fat32 dentry data
    fdentry->DIR_FileSize  = inode->file_size;
    fdentry->DIR_FstClusLO = finode->first_cluster & 0xffff;
    fdentry->DIR_FstClusHI = (fdentry->DIR_FstClusHI & 0xf000) | (finode->first_cluster >> 16);

    write_block(inode->dev, sector * 512, fsbi->sector_per_cluster * 512, buf);
    KFREE(buf);
}

struct super_block_operations FAT32_sb_ops = {
    .write_superblock = fat32_write_superblock,
    .put_superblock   = fat32_put_superblock,

    .write_inode = fat32_write_inode,
};

struct super_block* fat32_read_superblock(volume* vol, void* buf)
{
    struct super_block*      sbp    = NULL;
    struct FAT32_inode_info* finode = NULL;
    struct FAT32_BootSector* fbs    = NULL;
    struct FAT32_sb_info*    fsbi   = NULL;

    ////super block
    sbp = (struct super_block*)kmalloc(0, (sizeof(struct super_block)));
    memset(sbp, 0, sizeof(struct super_block));

    sbp->sb_ops          = &FAT32_sb_ops;
    sbp->private_sb_info = (struct FAT32_sb_info*)kmalloc(0, (sizeof(struct FAT32_sb_info)));
    memset(sbp->private_sb_info, 0, sizeof(struct FAT32_sb_info));

    ////fat32 boot sector
    fbs                      = (struct FAT32_BootSector*)buf;
    fsbi                     = sbp->private_sb_info;
    fsbi->start_sector       = vol->start_sector;
    fsbi->sector_count       = vol->end_sector - vol->start_sector + 1;
    fsbi->sector_per_cluster = fbs->BPB_SecPerClus;
    fsbi->bytes_per_cluster  = fbs->BPB_SecPerClus * fbs->BPB_BytesPerSec;
    fsbi->bytes_per_sector   = fbs->BPB_BytesPerSec;
    fsbi->Data_firstsector =
        vol->start_sector + fbs->BPB_RsvdSecCnt + fbs->BPB_FATSz32 * fbs->BPB_NumFATs;
    fsbi->FAT1_firstsector    = vol->start_sector + fbs->BPB_RsvdSecCnt;
    fsbi->sector_per_FAT      = fbs->BPB_FATSz32;
    fsbi->NumFATs             = fbs->BPB_NumFATs;
    fsbi->fsinfo_sector_infat = fbs->BPB_FSInfo;
    fsbi->bootsector_bk_infat = fbs->BPB_BkBootSec;

    comprintf("FAT32 Boot "
              "Sector\n\tBPB_FSInfo:%x\n\tBPB_BkBootSec:%x\n\tBPB_TotSec32:%x\n",
              fbs->BPB_FSInfo,
              fbs->BPB_BkBootSec,
              fbs->BPB_TotSec32);

    ////fat32 fsinfo sector
    fsbi->fat_fsinfo = (struct FAT32_FSInfo*)kmalloc(0, (sizeof(struct FAT32_FSInfo)));
    memset(fsbi->fat_fsinfo, 0, 512);
    read_block(ROOT_DEV,
               (vol->start_sector + fbs->BPB_FSInfo) * 512,
               512,
               (unsigned char*)fsbi->fat_fsinfo);
    comprintf("FAT32 "
              "FSInfo\n\tFSI_LeadSig:%x\n\tFSI_StrucSig:%x\n\tFSI_Free_Count:%x\n",
              fsbi->fat_fsinfo->FSI_LeadSig,
              fsbi->fat_fsinfo->FSI_StrucSig,
              fsbi->fat_fsinfo->FSI_Free_Count);

    ////directory entry
    sbp->root = (struct dir_entry*)kmalloc(0, (sizeof(struct dir_entry)));
    memset(sbp->root, 0, sizeof(struct dir_entry));

    list_init(&sbp->root->child_node);
    list_init(&sbp->root->subdirs_list);
    sbp->root->parent      = sbp->root;
    sbp->root->dir_ops     = &FAT32_dentry_ops;
    sbp->root->name        = (char*)kmalloc(0, (2));
    sbp->root->name[0]     = '/';
    sbp->root->name_length = 1;

    ////index node
    sbp->root->dir_inode = (struct index_node*)kmalloc(0, (sizeof(struct index_node)));
    memset(sbp->root->dir_inode, 0, sizeof(struct index_node));
    sbp->root->dir_inode->inode_ops = &FAT32_inode_ops;
    sbp->root->dir_inode->f_ops     = &FAT32_file_ops;
    sbp->root->dir_inode->file_size = 0;
    sbp->root->dir_inode->blocks =
        (sbp->root->dir_inode->file_size + fsbi->bytes_per_cluster - 1) / fsbi->bytes_per_sector;
    sbp->root->dir_inode->attribute = FS_ATTR_DIR;
    sbp->root->dir_inode->sb        = sbp;

    ////fat32 root inode
    sbp->root->dir_inode->private_index_info =
        (struct FAT32_inode_info*)kmalloc(0, (sizeof(struct FAT32_inode_info)));
    sbp->root->dir_inode->dev = ROOT_DEV;
    memset(sbp->root->dir_inode->private_index_info, 0, sizeof(struct FAT32_inode_info));
    finode                  = (struct FAT32_inode_info*)sbp->root->dir_inode->private_index_info;
    finode->first_cluster   = fbs->BPB_RootClus;
    finode->dentry_location = 0;
    finode->dentry_position = 0;
    finode->create_date     = 0;
    finode->create_time     = 0;
    finode->write_date      = 0;
    finode->write_time      = 0;

    return sbp;
}

struct file_system_type FAT32_fs_type = {
    .name            = "FAT32",
    .fs_flags        = 0,
    .read_superblock = fat32_read_superblock,
    .next            = NULL,
};
int init_fat32_fs(volume* vol)
{
    register_filesystem(&FAT32_fs_type);
    char* buf = kmalloc(0, 512);
    read_block(ROOT_DEV, vol->start_sector * 512, 512, buf);
    //挂载新文件系统到/
    struct super_block* fat32_sb = mount_fs("FAT32", vol, buf);   // not dev node

    root_sb      = fat32_sb;
    root_sb->dev = ROOT_DEV;
    // root_sb->p_dev = NULL;
    mount_fs_on(droot, fat32_sb);   //挂载到/上
    KFREE(buf);
}
//这个函数临时作为挂载根文件系统的函数。等硬盘驱动完成分区识别并注册分区设备之后会更改。
void DISK1_FAT32_FS_init()
{
    int                         i;
    unsigned char               buf[512];
    struct dir_entry*           dentry = NULL;
    struct Disk_Partition_Table DPT    = {0};

    register_filesystem(&FAT32_fs_type);

    memset(buf, 0, 512);

    read_block(ROOT_DEV, 0, 512, buf);
    // read_disk(DISK_MAJOR_MAJOR, 0, 1, buf);/*rint r=
    // equest(DISK_MAJOR_MAJOR,DISKREQ_READ,0x0,1,(unsigned char *)buf);
    // chk_result(r);
    DPT = *(struct Disk_Partition_Table*)buf;
    comprintf("DPTE[0] start_LBA:%x\ttype:%x\n", DPT.DPTE[0].start_LBA, DPT.DPTE[0].type);

    memset(buf, 0, 512);
    read_block(ROOT_DEV, DPT.DPTE[0].start_LBA * 512, 512, buf);

    //挂载新文件系统到/
    struct super_block* fat32_sb = mount_fs("FAT32", &DPT.DPTE[0], buf);   // not dev node

    root_sb      = fat32_sb;
    root_sb->dev = ROOT_DEV;
    // root_sb->p_dev = NULL;
    mount_fs_on(droot, fat32_sb);   //挂载到/上
}
