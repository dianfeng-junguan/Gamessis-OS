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

#include <text_console.h>
#include <disk.h>
#include <fat32.h>
#include <kb.h>
#include "com.h"
#include "syscall.h"
#include "fcntl.h"
#include "exe.h"
#include "reloc.h"

int manage_proc_lock=1;
void main(unsigned int magic,void* addr)
{

    struct multiboot_header* mbi=0ul;
    mbi=(struct multiboot_header*)addr;
    init_logging();
    if(magic!=MULTIBOOT2_HEADER_MAGIC)//0x1e000
    {
        //printf("warning:multiboot2 magic does not match.\n");
        
    }
    //获取tags
    struct multiboot_tag *tag;

    //先初始化串口，保证输出最基本的调试信息
    init_com(PORT_COM1);
    comprintf("\rgamessis os loaded.\r\n");
	unsigned size;
    size = *(unsigned long*)addr;
//    //printf("Announced mbi size 0x%x\n", size);
	for (tag = (struct multiboot_tag *)(addr + 8);
		 tag->type != MULTIBOOT_TAG_TYPE_END;
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
	{
		//printf("Tag 0x%x, Size 0x%x\n", tag->type, tag->size);
        if(tag->type==MULTIBOOT_TAG_TYPE_BASIC_MEMINFO)
            set_high_mem_base(((struct multiboot_tag_basic_meminfo *)tag)->mem_lower);
        else if(tag->type==MULTIBOOT_TAG_TYPE_MMAP){

            for (multiboot_memory_map_t * mmap = ((struct multiboot_tag_mmap *)tag)->entries;
                 (multiboot_uint8_t *)mmap < (multiboot_uint8_t *)tag + tag->size;
                 mmap = (multiboot_memory_map_t *)((unsigned long)mmap + ((struct multiboot_tag_mmap *)tag)->entry_size))
            {
                set_mem_area(mmap->addr,mmap->len,mmap->type);
            }

        }
        else if (tag->type==MULTIBOOT_TAG_TYPE_FRAMEBUFFER){

            multiboot_uint32_t color;
            unsigned i;
            struct multiboot_tag_framebuffer *tagfb = (struct multiboot_tag_framebuffer *)tag;
            void *fb = (void *) FRAMEBUFFER_ADDR;
            set_framebuffer(*tagfb);

            switch (tagfb->common.framebuffer_type)
            {
                case MULTIBOOT_FRAMEBUFFER_TYPE_INDEXED:
                {
                    unsigned best_distance, distance;
                    struct multiboot_color *palette;

                    palette = tagfb->framebuffer_palette;

                    color = 0;
                    best_distance = 4 * 256 * 256;

                    for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
                    {
                        distance = (0xff - palette[i].blue) * (0xff - palette[i].blue) + palette[i].red * palette[i].red + palette[i].green * palette[i].green;
                        if (distance < best_distance)
                        {
                            color = i;
                            best_distance = distance;
                        }
                    }
                }
                    break;

                case MULTIBOOT_FRAMEBUFFER_TYPE_RGB:
                    color = ((1 << tagfb->framebuffer_blue_mask_size) - 1) << tagfb->framebuffer_blue_field_position;
                    break;

                case MULTIBOOT_FRAMEBUFFER_TYPE_EGA_TEXT:
                    color = '\\' | 0x0100;
                    break;

                default:
                    color = 0xffffffff;
                    break;
            }
        } else if(tag->type==MULTIBOOT_TAG_TYPE_ELF_SECTIONS){
            comprintf("found elf section tag.\n");
            struct multiboot_tag_elf_sections* sh=tag;
            do_reloc(sh);

        }
		/*switch (tag->type)
		{
		case MULTIBOOT_TAG_TYPE_CMDLINE:
			//printf("Command line = %s\n", ((struct multiboot_tag_string *)tag)->string);
			break;
		case MULTIBOOT_TAG_TYPE_BOOT_LOADER_NAME:
			//printf("Boot loader name = %s\n", ((struct multiboot_tag_string *)tag)->string);
			break;
		case MULTIBOOT_TAG_TYPE_MODULE:
			//printf("Module at 0x%x-0x%x. Command line %s\n",
//				   ((struct multiboot_tag_module *)tag)->mod_start,
//				   ((struct multiboot_tag_module *)tag)->mod_end,
//				   ((struct multiboot_tag_module *)tag)->cmdline);
			break;
		case MULTIBOOT_TAG_TYPE_BASIC_MEMINFO:
			//printf("mem_lower = %uKB, mem_upper = %uKB\n",
//				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_lower,
//				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_upper);
			set_high_mem_base(((struct multiboot_tag_basic_meminfo *)tag)->mem_lower);
			break;
		case MULTIBOOT_TAG_TYPE_BOOTDEV:
			//printf("Boot device 0x%x,%u,%u\n",
//				   ((struct multiboot_tag_bootdev *)tag)->biosdev,
//				   ((struct multiboot_tag_bootdev *)tag)->slice,
//				   ((struct multiboot_tag_bootdev *)tag)->part);
//
			//此处应该注册设备

			break;
		case MULTIBOOT_TAG_TYPE_MMAP:
		{
			//printf("mmap\n");
            for (multiboot_memory_map_t * mmap = ((struct multiboot_tag_mmap *)tag)->entries;
                    (multiboot_uint8_t *)mmap < (multiboot_uint8_t *)tag + tag->size;
                    mmap = (multiboot_memory_map_t *)((unsigned long)mmap + ((struct multiboot_tag_mmap *)tag)->entry_size))
            {
                set_mem_area(mmap->addr,mmap->len,mmap->type);
            }

		}
		break;
		case MULTIBOOT_TAG_TYPE_FRAMEBUFFER:
		{
			multiboot_uint32_t color;
			unsigned i;
			struct multiboot_tag_framebuffer *tagfb = (struct multiboot_tag_framebuffer *)tag;
			void *fb = (void *) FRAMEBUFFER_ADDR;
			set_framebuffer(*tagfb);

            init_framebuffer();
			switch (tagfb->common.framebuffer_type)
			{
			case MULTIBOOT_FRAMEBUFFER_TYPE_INDEXED:
			{
				unsigned best_distance, distance;
				struct multiboot_color *palette;

				palette = tagfb->framebuffer_palette;

				color = 0;
				best_distance = 4 * 256 * 256;

				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
				{
					distance = (0xff - palette[i].blue) * (0xff - palette[i].blue) + palette[i].red * palette[i].red + palette[i].green * palette[i].green;
					if (distance < best_distance)
					{
						color = i;
						best_distance = distance;
					}
				}
			}
			break;

			case MULTIBOOT_FRAMEBUFFER_TYPE_RGB:
				color = ((1 << tagfb->framebuffer_blue_mask_size) - 1) << tagfb->framebuffer_blue_field_position;
				break;

			case MULTIBOOT_FRAMEBUFFER_TYPE_EGA_TEXT:
				color = '\\' | 0x0100;
				break;

			default:
				color = 0xffffffff;
				break;
			}

			break;
		}
		}*/
	}
	tag = (struct multiboot_tag *)((multiboot_uint8_t *)tag + ((tag->size + 7) & ~7));
    init_memory();
    init_framebuffer();
	//printf("Total mbi size 0x%x\n", (unsigned)tag - addr);
	char disk_count=*(char*)0x475;
	//printf("disk count:%d\n",disk_count);
    init_font();
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
    init_int();
    print("int loaded.\n");
//    set_tss(0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000);
	init_paging();
 	init_gdt();
    mount_rootfs();
    init_devman();
    init_proc();
    sti();
    DISK1_FAT32_FS_init();

    //自带驱动
    //init_tty();
    init_kb();
//    init_disk();


    manage_proc_lock=0;
    if(sys_fork()==0){
        sys_execve("/mnt/test.exe",NULL);
    }

//	init_vfs();
//    init_fat16();

//    extern device *dev_tree[];
//    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
//    mount_fs("fat16",p->par,vmalloc());
    while (1)
    {
        char c=-1;
        sys_read(0,&c,1);
        putchar(c);
//        char c= sys_analyse_key();
//        if(c!=-1){
//            putchar(c);
//        }
    }
}