/**
    @file kwchar.h
    @author Oniar Pie
    @date 2021-11-15
    @brief 内核用宽字符处理
*/
typedef unsigned short wchar_t ;
#define MB_CUR_MAX 4
#include "sys/types.h"
size_t mbstowcsk(wchar_t* wcstr, const char* mbstr, size_t count);
int mbtowck(wchar_t* pwc, const char* s, size_t n);