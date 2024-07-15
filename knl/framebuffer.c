#include <framebuffer.h>
#include <memory.h>
#include <typename.h>
struct multiboot_tag_framebuffer framebuffer;
void init_framebuffer()
{
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
    size_t h=framebuffer.common.framebuffer_height;
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
    size_t inter=framebuffer.common.framebuffer_pitch;
    size_t pc=w*h;
    size_t size=pc*bypp+(pc-1)*inter;
    int pgc=size/PAGE_SIZE;
    addr_t p=FRAMEBUFFER_ADDR;
    addr_t pp=framebuffer.common.framebuffer_addr;
    for (size_t i = 0; i < pgc; i++)
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
        pp+=PAGE_SIZE;
        p+=PAGE_SIZE;
    }
    
    
}
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
    framebuffer=tag;
}