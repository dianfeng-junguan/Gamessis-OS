#include "com/kwchar.h"
#include "typename.h"

size_t mbstowcsk(wchar_t* wcstr, const char* mbstr, size_t count)
{

    size_t  result = 0;
    wchar_t wc;
    int     len;

    if (mbstr == NULL) {
        // 如果 mbstr 为 NULL，返回所需的宽字符数
        mbstr = "";
    }

    if (wcstr == NULL) {
        // 如果 wcstr 为 NULL，只计算所需的宽字符数
        while (*mbstr) {
            len = mbtowck(&wc, mbstr, MB_CUR_MAX);
            if (len < 0) {
                // 遇到无效的多字节字符
                return (size_t)-1;
            }
            mbstr += len;
            result++;
        }
    }
    else {
        // 转换多字节字符串到宽字符字符串
        while (*mbstr && result < count) {
            len = mbtowck(&wc, mbstr, MB_CUR_MAX);
            if (len < 0) {
                // 遇到无效的多字节字符
                return (size_t)-1;
            }
            wcstr[result] = wc;
            mbstr += len;
            result++;
        }
        if (result < count) {
            // 如果还有空间，添加宽字符空字符
            wcstr[result] = L'\0';
        }
    }

    return result;
}

// 将 UTF - 8 多字节字符转换为 Unicode 宽字符
int mbtowck(wchar_t* pwc, const char* s, size_t n)
{
    // 如果传入的字符串指针为 NULL，返回 0 表示不进行转换
    if (s == NULL) {
        return 0;
    }

    // 如果没有可用字节，无法完成转换，返回 -1 表示错误
    if (n == 0) {
        return -1;
    }

    unsigned char first_byte = (unsigned char)*s;
    int           num_bytes;

    // 根据第一个字节确定 UTF - 8 字符的字节数
    if ((first_byte & 0x80) == 0) {
        // 单字节字符（ASCII 字符），范围是 0 - 127
        num_bytes = 1;
    }
    else if ((first_byte & 0xE0) == 0xC0) {
        // 双字节字符，范围是 128 - 2047
        num_bytes = 2;
    }
    else if ((first_byte & 0xF0) == 0xE0) {
        // 三字节字符，范围是 2048 - 65535
        num_bytes = 3;
    }
    else if ((first_byte & 0xF8) == 0xF0) {
        // 四字节字符，用于表示辅助平面字符
        num_bytes = 4;
    }
    else {
        // 无效的 UTF - 8 起始字节，返回 -1 表示错误
        return -1;
    }

    // 检查提供的字节数是否足够表示该多字节字符
    if (n < (size_t)num_bytes) {
        return -1;
    }

    wchar_t wc = 0;
    switch (num_bytes) {
    case 1:
        // 单字节字符直接赋值
        wc = first_byte;
        break;
    case 2:
        // 双字节字符组合转换
        wc = ((first_byte & 0x1F) << 6) | ((unsigned char)s[1] & 0x3F);
        break;
    case 3:
        // 三字节字符组合转换
        wc = ((first_byte & 0x0F) << 12) | (((unsigned char)s[1] & 0x3F) << 6) |
             ((unsigned char)s[2] & 0x3F);
        break;
    case 4:
        // 四字节字符组合转换
        wc = ((first_byte & 0x07) << 18) | (((unsigned char)s[1] & 0x3F) << 12) |
             (((unsigned char)s[2] & 0x3F) << 6) | ((unsigned char)s[3] & 0x3F);
        break;
    }

    // 如果输出指针不为 NULL，将转换后的宽字符存储到该指针指向的位置
    if (pwc != NULL) {
        *pwc = wc;
    }

    // 返回该多字节字符占用的字节数
    return num_bytes;
}
