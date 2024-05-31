/* 与显示相关的设置。 */
#define COLUMNS                 80
#define LINES                   24
#define ATTRIBUTE               7
#define VIDEO                   0xB8000

int init_logging();

static void itoa (char *buf, int base, int d);

static void putchar (int c);

void printf (const char *format, ...);