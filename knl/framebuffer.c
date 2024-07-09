#include <framebuffer.h>
#include <memory.h>
struct multiboot_tag_framebuffer framebuffer;
void init_framebuffer()
{
    //映射页帧内存

}
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
    framebuffer=tag;
}