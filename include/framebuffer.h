#pragma once
//专门处理页帧（显存缓冲区）的功能。
#include <multiboot2.h>
//映射页帧缓冲区
void init_framebuffer();
void set_framebuffer(struct multiboot_tag_framebuffer tag);
