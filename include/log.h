/* 与显示相关的设置。 */
#include <stdarg.h>

#define COLUMNS 80
#define LINES 24
#define ATTRIBUTE 7
#define VIDEO 0xB8000

int init_logging();

void itoa(char* buf, int base, int d);

void putchar(char c);

void printfk(const char* format, ...);
void comprintf(char* fmt, ...);

#ifdef DEBUG
#    define debug_log(s, ...)             \
        do {                              \
            printf("[%s]", __FUNCTION__); \
            printf(s, ##__VA_ARGS__);     \
        } while (0);
#else
#    define debug_log(s, ...)
#endif