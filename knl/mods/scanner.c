#include "scanner.h"
#include "driverman.h"
#include "volume.h"
#include "disk.h"
#include "errno.h"
#ifdef DEBUG
#    include <stdio.h>
#    include <stdlib.h>
#    include <string.h>

int drv_ioctl(int dev, int cmd, void* arg);
#    define DRIVER_CMD_READ 0x01
#endif

// 定义一个二维数组来存储多个 GPT 分区类型的 GUID
unsigned char type_guids[MAX_TYPE_GUIDS][16] = {
    // 0. 空分区
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    // 1. EFI 系统分区（ESP）
    {0xC1,
     0x2A,
     0x73,
     0x28,
     0xF8,
     0x1F,
     0x11,
     0xD2,
     0xBA,
     0x4B,
     0x00,
     0xA0,
     0xC9,
     0x3E,
     0xC9,
     0x3B},
    // 2. Microsoft 基本数据分区
    {0xEF,
     0x32,
     0xA9,
     0xA0,
     0x93,
     0x0A,
     0x4F,
     0x30,
     0x84,
     0x05,
     0x29,
     0x23,
     0x6D,
     0x16,
     0x01,
     0x27},
    // 3. Linux 交换分区
    {0x06,
     0x57,
     0xFD,
     0x6D,
     0xA4,
     0xAB,
     0x43,
     0xC4,
     0x84,
     0xE5,
     0x09,
     0x33,
     0xC8,
     0x4B,
     0x4F,
     0x4F},
    // 4. Linux x86 - 64 根分区（/）
    {0x4F,
     0x68,
     0xBC,
     0xE3,
     0xE8,
     0xCD,
     0x4D,
     0xB1,
     0x96,
     0xE7,
     0xFB,
     0xC9,
     0x84,
     0xB7,
     0x0B,
     0x91},
    // 5. Linux 家用分区（/home）
    {0x93,
     0x3A,
     0x8D,
     0x3C,
     0xEF,
     0x8D,
     0x42,
     0xA4,
     0x87,
     0xC0,
     0x6D,
     0x28,
     0x1E,
     0x68,
     0xB7,
     0x23},
    // 6. Linux LVM 分区
    {0xE6,
     0xD6,
     0xD3,
     0x3B,
     0x5C,
     0x1A,
     0x4C,
     0x86,
     0x8D,
     0xA1,
     0x07,
     0xF3,
     0xEC,
     0x13,
     0x9E,
     0x53},
    // 7. Apple HFS+ 分区
    {0x48,
     0x46,
     0x53,
     0x00,
     0x00,
     0x00,
     0x11,
     0xAA,
     0xAA,
     0x11,
     0x00,
     0x30,
     0x65,
     0x43,
     0xEC,
     0xAC},
    // 8. macOS 日志式 APFS 容器
    {0x7C,
     0x34,
     0x57,
     0xEF,
     0x00,
     0x00,
     0x11,
     0xAA,
     0xAA,
     0x11,
     0x00,
     0x30,
     0x65,
     0x43,
     0xEC,
     0xAC},
    // 9. Windows 恢复环境分区
    {0xDE,
     0x94,
     0xBB,
     0xA4,
     0x06,
     0xD1,
     0x4D,
     0x40,
     0xA1,
     0x9B,
     0x84,
     0x06,
     0xF4,
     0x49,
     0x5A,
     0x29},
    // 10. BIOS 启动分区
    {0x21,
     0x68,
     0x61,
     0x48,
     0x64,
     0x49,
     0x6E,
     0x6F,
     0x74,
     0x4E,
     0x65,
     0x65,
     0x64,
     0x45,
     0x46,
     0x49}};

volume_list* scan_disk(int dev)
{
    volume_list* list = KMALLOC(sizeof(volume_list));
    list->head        = NULL;
    list->tail        = NULL;
    struct arg_pack
    {
        int   lba;
        int   count;
        char* buf;
        int   non_async;
        int   diski;
    } ioctlarg;
    ioctlarg.diski     = DISK_MAJOR_MAJOR;
    ioctlarg.lba       = 0;
    ioctlarg.count     = 1;
    ioctlarg.buf       = KMALLOC(512);
    ioctlarg.non_async = 0;   //让硬盘中断使用同步的读写功能
    if (ioctlarg.buf == NULL) {
#ifdef DEBUG
        KPRINTF("Test failed: Failed to allocate memory for buffer.\n");
#endif
        KFREE(list);
        return NULL;
    }
    //查看分区，如果是MBR分区表，那么就按照这个分区表注册即可，如果是GPT分区表，那么就按照GPT分区表注册

    // 读取第一个扇区（MBR）
    if (drv_ioctl(dev, DRIVER_CMD_READ, 2, &ioctlarg) != 0) {
#ifdef DEBUG
        KPRINTF("Test failed: Failed to read MBR sector.\n");
#endif
        KFREE(ioctlarg.buf);
        KFREE(list);
        return NULL;
    }

    // 检查分区表类型
    if (!(ioctlarg.buf[510] == (char)0x55 && ioctlarg.buf[511] == (char)0xAA)) {
        //不是启动扇区,不是有效的MBR分区表
        //尝试扫描GPT分区表
        goto scan_gpt;
    }
    // MBR 分区表
    for (int i = 0; i < 4; i++) {
        volume* vol = KMALLOC(sizeof(volume));
        if (vol == NULL) {
#ifdef DEBUG
            KPRINTF("Test failed: Failed to allocate memory for volume.\n");
#endif
            KFREE(ioctlarg.buf);
            free_volume_list(list);
            return NULL;
        }

        //  MBR 分区表每个分区表项占用 16 字节
        int start_sector = (int)(*(int*)&ioctlarg.buf[0x1be + 8 + i * 16]);
        int sector_count = (int)(*(int*)&ioctlarg.buf[0x1be + 12 + i * 16]);

        vol->start_sector  = start_sector;
        vol->sector_size   = sector_count;
        vol->size          = sector_count * 512;
        vol->end_sector    = start_sector + sector_count - 1;
        int partition_type = ioctlarg.buf[0x1be + i * 16 + 4] & 0xFF;
        if (partition_type == 0xee) {
            // gpt
            goto scan_gpt;
        }

        // 根据文件系统类型注册分区
        if (start_sector != 0 && sector_count != 0) {
            switch (partition_type) {
            case 0x07:   // NTFS 分区
                SNPRINTF(vol->name, sizeof(vol->name), "NTFS%d", i);
                vol->flags = VOLUME_FLAG_NTFS;
                break;
            case 0x0B:   // FAT32 分区
            case 0x0C:
                SNPRINTF(vol->name, sizeof(vol->name), "FAT%d", i);
                vol->flags = VOLUME_FLAG_FAT32;
                break;
            case 0x83:   // EXT 分区
                SNPRINTF(vol->name, sizeof(vol->name), "EXT%d", i);
                vol->flags = VOLUME_FLAG_EXTENDED;
                break;
            case 0x82:   // SWAP 分区
                SNPRINTF(vol->name, sizeof(vol->name), "SWAP%d", i);
                vol->flags = VOLUME_FLAG_SWAP;
                break;
            default:   // 其他分区
                SNPRINTF(vol->name, sizeof(vol->name), "Sector%d", i);
                vol->flags = 0;
                break;
            }

            // 添加到 volume_list
            volume_node* node = KMALLOC(sizeof(volume_node));
            if (node == NULL) {
#ifdef DEBUG
                KPRINTF("Test failed: Failed to allocate memory for volume_node.\n");
#endif
                KFREE(vol);
                KFREE(ioctlarg.buf);
                free_volume_list(list);
                return NULL;
            }
            node->vol  = vol;
            node->next = NULL;

            if (list->tail == NULL) {
                list->head = list->tail = node;
            }
            else {
                list->tail->next = node;
                list->tail       = node;
            }
        }
    }
    goto end;
scan_gpt:
    // 不是 MBR 分区表，尝试读取 GPT 分区表头
    ioctlarg.lba = 1;
    if (drv_ioctl(dev, DRIVER_CMD_READ, 2, &ioctlarg) != 0) {
#ifdef DEBUG
        KPRINTF("Test failed: Failed to read GPT header sector.\n");
#endif
        KFREE(ioctlarg.buf);
        KFREE(list);
        return NULL;
    }
    gpt_header* header = (gpt_header*)ioctlarg.buf;
    if (STRCMP(header->signature, "EFI PART") != 0) {
#ifdef DEBUG
        KPRINTF("Test failed: Not a GPT partition table.\n");
#endif
        KFREE(ioctlarg.buf);
        KFREE(list);
        return NULL;
    }

    // 读取 GPT 分区表
    ioctlarg.lba      = 2;
    ioctlarg.count    = GPT_TABLE_SECTOR_COUNT;
    size_t nr_entries = header->num_part_entries;
    KFREE(ioctlarg.buf);
    ioctlarg.buf = KMALLOC(512 * GPT_TABLE_SECTOR_COUNT);
    if (drv_ioctl(dev, DRIVER_CMD_READ, 2, &ioctlarg) != 0) {
#ifdef DEBUG
        KPRINTF("Test failed: Failed to read GPT partition table.\n");
#endif
        KFREE(ioctlarg.buf);
        KFREE(list);
        return NULL;
    }

    // 注册分区
    for (int i = 0; i < nr_entries; i++) {
        volume* vol = KMALLOC(sizeof(volume));
        if (vol == NULL) {
#ifdef DEBUG
            KPRINTF("Test failed: Failed to allocate memory for volume.\n");
#endif
            KFREE(ioctlarg.buf);
            free_volume_list(list);
            return NULL;
        }
        gpt_part_entry* part_entry = (gpt_part_entry*)&ioctlarg.buf[i * 128];
        if (memcmp(part_entry->type_guid, type_guids[0], 16) == 0) {
            // 空分区，跳过
            KFREE(vol);
            continue;
        }

        // 假设 GPT 分区表每个分区表项占用 128 字节
        long long start_sector = part_entry->first_lba;
        long long sector_count = part_entry->last_lba - part_entry->first_lba + 1;

        vol->start_sector = start_sector;
        vol->sector_size  = 512;
        vol->size         = sector_count;
        vol->end_sector   = part_entry->last_lba;
        vol->flags        = VOLUME_FLAG_UNKNOWN;
        if (STRLEN(part_entry->part_name) > 0) {
            STRNCPY(vol->name, part_entry->part_name, 16);
        }
        else {
            SNPRINTF(vol->name, sizeof(vol->name), "GPT%d", i + 1);
        }

        // 根据文件系统类型注册分区
        if (start_sector == 0 || sector_count == 0) {
            //无效的分区，跳过
            KFREE(vol);
            continue;
        }
        // 这里假设分区表项的类型码在第i * 128 + 16位置
        char* partition_type = part_entry->type_guid;   // char[16]
        //根据GUID判断分区类型
        // GUID格式为：32位大端序，8-4-4-4-12位小端序
        for (int j = 1; j < MAX_TYPE_GUIDS; j++) {
            //目前还不需要这个做什么，文件系统识别让vfs来做就可以了
            if (memcmp(partition_type, type_guids[j], 16) == 0) {
                // 找到了分区类型
                break;
            }
        }
        // 添加到 volume_list
        volume_node* node = KMALLOC(sizeof(volume_node));
        if (node == NULL) {
#ifdef DEBUG
            KPRINTF("Test failed: Failed to allocate memory for volume_node.\n");
#endif
            KFREE(vol);
            KFREE(ioctlarg.buf);
            free_volume_list(list);
            return NULL;
        }
        node->vol  = vol;
        node->next = NULL;

        if (list->tail == NULL) {
            list->head = list->tail = node;
        }
        else {
            list->tail->next = node;
            list->tail       = node;
        }
    }
end:
    KFREE(ioctlarg.buf);
    return list;
}
int free_volume_list(volume_list* list)
{
    volume_node* node = list->head;
    while (node != NULL) {
        volume_node* next = node->next;
        KFREE(node);
        node = next;
    }
    KFREE(list);
    return 0;
}
int register_volume_list(volume_list* list)
{
    volume_node* node = list->head;
    while (node != NULL) {
        volume_node* next = node->next;
        if (register_volume(node->vol) != 0) {
            return -1;
        }

        node = next;
    }

    return 0;
}
int unregister_volume_list(volume_list* list)
{
    volume_node* node = list->head;
    int          ret  = 0;
    while (node != NULL) {
        if (unregister_volume(node->vol->name) != 0) {
            ret = -1;
        }
        volume_node* next = node->next;
        KFREE(node);
    }
    return ret;
}
int dev_scanner;
int scanner_mod_init(int drvid)
{
    // dev_scanner = drvid;
}
int      scanner_mod_exit() {}
drvret_t scanner_mod_ioctl(int command, unsigned long long arg)
{
    /*
    arg格式:
    command: 0x01 - 扫描硬盘，并注册
    arg: 设备号

    */
    if (command == 0x01) {
        int          dev  = (int)arg;
        volume_list* list = scan_disk(dev);
        if (list == NULL) {
            return -EFAULT;
        }
        if (register_volume_list(list) != 0) {
            free_volume_list(list);
            return -EFAULT;
        }
    }
    change_driver_stat(dev_scanner, DRIVER_STAT_DONE);
    next_request(dev_scanner);
    return 0;
}

int init_scanner()
{
    if ((dev_scanner = register_driver(scanner_mod_init, scanner_mod_exit, scanner_mod_ioctl)) <
        0) {
        return -EFAULT;
    }
}