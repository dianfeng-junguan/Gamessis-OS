#include "com/mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void       memcpy(u8* dest, u8* src, u32 size)
{
    *dest =
        0xff;   //如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
    for (int i = 0; i < size; i++) {
        *(dest) = *(src);
        dest++;
        src++;
    }
}
int memcmp(u8* a, u8* b, int len)
{
    for (int i = 0; i < len; i++) {
        if (*a != *b)
            return *a - *b;
        a++;
        b++;
    }
    return 0;
}
void memset(u8* buf, u8 value, u32 size)
{
    for (u32 i = 0; i < size; i++) {
        *(buf++) = value;
    }
}

u32 get_mem_size()
{
    return mem_end;
}
