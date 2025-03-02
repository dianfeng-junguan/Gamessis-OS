#include <multiboot2.h>
#include <log.h>
#include <int.h>
#include <memory.h>
#include <devman.h>
#include <proc.h>
#include <gdt.h>
#include <framebuffer.h>
#include <mem.h>
#include <vfs.h>

#include <disk.h>
#include <fat32.h>
#include <kb.h>
#include "com.h"
#include "scanner.h"
#include "syscall.h"
#include "fcntl.h"
#include "exe.h"
#include "ramdisk.h"
#include "ramfs.h"
#include "tty.h"
#include "driverman.h"
#include "drvload.h"
#include "elfbin.h"
#include "float.h"
#include "wndman.h"

int  manage_proc_lock = 1;
void main(unsigned int magic, void* addr)
{

    struct multiboot_header* mbi = 0ul;
    mbi                          = (struct multiboot_header*)addr;
    init_logging();
    if (magic != MULTIBOOT2_HEADER_MAGIC)   // 0x1e000
    {
        // printf("warning:multiboot2 magic does not match.\n");
    }
    //获取tags
    struct multiboot_tag* tag;

    //先初始化串口，保证输出最基本的调试信息
    init_com(PORT_COM1);
    comprintf("\rgamessis os loaded.\r\n");
    unsigned size;
    size = *(unsigned long*)addr;
    //    //printf("Announced mbi size 0x%x\n", size);
    for (tag = (struct multiboot_tag*)(addr + 8); tag->type != MULTIBOOT_TAG_TYPE_END;
         tag = (struct multiboot_tag*)((u8*)tag + ((tag->size + 7) & ~7))) {
        // printf("Tag 0x%x, Size 0x%x\n", tag->type, tag->size);
        switch (tag->type) {
        case MULTIBOOT_TAG_TYPE_CMDLINE:
            // printf("Command line = %s\n", ((struct multiboot_tag_string *)tag)->string);
            break;
        case MULTIBOOT_TAG_TYPE_BOOT_LOADER_NAME:
            // printf("Boot loader name = %s\n", ((struct multiboot_tag_string *)tag)->string);
            break;
        case MULTIBOOT_TAG_TYPE_MODULE:
            // printf("Module at 0x%x-0x%x. Command line %s\n",
            //				   ((struct multiboot_tag_module *)tag)->mod_start,
            //				   ((struct multiboot_tag_module *)tag)->mod_end,
            //				   ((struct multiboot_tag_module *)tag)->cmdline);
            break;
        case MULTIBOOT_TAG_TYPE_BASIC_MEMINFO:
            // printf("mem_lower = %uKB, mem_upper = %uKB\n",
            //				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_lower,
            //				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_upper);
            set_high_mem_base(((struct multiboot_tag_basic_meminfo*)tag)->mem_lower);
            break;
        case MULTIBOOT_TAG_TYPE_BOOTDEV:
            // printf("Boot device 0x%x,%u,%u\n",
            //				   ((struct multiboot_tag_bootdev *)tag)->biosdev,
            //				   ((struct multiboot_tag_bootdev *)tag)->slice,
            //				   ((struct multiboot_tag_bootdev *)tag)->part);
            //
            //此处应该注册设备

            break;
        case MULTIBOOT_TAG_TYPE_MMAP:
        {
            // printf("mmap\n");
            for (multiboot_memory_map_t* mmap = ((struct multiboot_tag_mmap*)tag)->entries;
                 (multiboot_uint8_t*)mmap < (multiboot_uint8_t*)tag + tag->size;
                 mmap = (multiboot_memory_map_t*)((unsigned long)mmap +
                                                  ((struct multiboot_tag_mmap*)tag)->entry_size)) {
                set_mem_area(mmap->addr, mmap->len, mmap->type);
            }

        } break;
        case MULTIBOOT_TAG_TYPE_FRAMEBUFFER:
        {
            multiboot_uint32_t                color;
            unsigned                          i;
            struct multiboot_tag_framebuffer* tagfb = (struct multiboot_tag_framebuffer*)tag;
            void*                             fb    = (void*)FRAMEBUFFER_ADDR;
            set_framebuffer(*tagfb);

            switch (tagfb->common.framebuffer_type) {
            case MULTIBOOT_FRAMEBUFFER_TYPE_INDEXED:
            {
                unsigned                best_distance, distance;
                struct multiboot_color* palette;

                palette = tagfb->framebuffer_palette;

                color         = 0;
                best_distance = 4 * 256 * 256;

                for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++) {
                    distance = (0xff - palette[i].blue) * (0xff - palette[i].blue) +
                               palette[i].red * palette[i].red +
                               palette[i].green * palette[i].green;
                    if (distance < best_distance) {
                        color         = i;
                        best_distance = distance;
                    }
                }
            } break;

            case MULTIBOOT_FRAMEBUFFER_TYPE_RGB:
                color = ((1 << tagfb->framebuffer_blue_mask_size) - 1)
                        << tagfb->framebuffer_blue_field_position;
                break;

            case MULTIBOOT_FRAMEBUFFER_TYPE_EGA_TEXT: color = '\\' | 0x0100; break;

            default: color = 0xffffffff; break;
            }

            break;
        }
        }
    }
    tag = (struct multiboot_tag*)((multiboot_uint8_t*)tag + ((tag->size + 7) & ~7));
    init_int();
    //初始化区域
    init_paging();
    init_gdt();
    init_memory();
    if (is_sse_supported())
        init_sse();
    init_driver_man();
    init_devman();
    init_console();
    init_framebuffer();

    init_font();

    init_disk();
    init_scanner();
    init_ramdisk();
    init_rootfs();
    init_proc();

    init_drvload();
    init_binload();
    elf_binload_init();
    //===============创建0号进程======================
    init_proc0();
    reg_default_devices();
    init_volumeman();
    volume_list* vlist = scan_disk(ROOT_DEV);
    if (vlist && vlist->head && vlist->head->vol) {
        comprintf("volume scan succeeded\n");
        register_volume_list(vlist);
        init_fat32_fs(vlist->head->vol);
    }
    else {
        //备用
        DISK1_FAT32_FS_init();
    }
    init_devfs();
    make_default_devfiles();
    further_init_proc0();

    init_wndman();

    windowptr_t wnd = create_window("gamessis os", WNDTYPE_WINDOW);
    show_window(wnd);

    // init_ramfs();

    //自带驱动comprintfk(fmt, ##__VA_ARGS__)
    // init_tty();
    // init_kb();
    //    init_disk();
    sti();
    manage_proc_lock = 0;

    move_to_user_mode();

    //扫描硬盘
    extern int drv_scanner, drv_hd;
    do_syscall(SYSCALL_DRV_IOCTL, drv_scanner, 1, 1, 1, 0, 0);
    int shell = 0, stat_loc = 0;
    if ((shell = do_syscall(SYSCALL_FORK, 0, 0, 0, 0, 0, 0)) == 0) {
        char* argv[]    = {"/test.elf", "gamessis os", 0};
        char* environ[] = {"os=gms", 0};
        do_syscall(SYSCALL_EXECVE, (long)"/test.elf", (long)&argv[0], environ, 0, 0, 0);
    }
    do_syscall(SYSCALL_WAIT, 2, &stat_loc, 0, 0, 0, 0);
    //    if(sys_fork()==0){
    //    }

    //	init_vfs();
    //    init_fat16();

    //    extern device *dev_tree[];
    //    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
    //    mount_fs("fat16",p->par,vmalloc());
    while (1) {
        /*char c=-1;
        sys_read(0,&c,1);
        putchar(c);*/
        //        char c= sys_analyse_key();
        //        if(c!=-1){
        //            putchar(c);
        //        }
    }
}