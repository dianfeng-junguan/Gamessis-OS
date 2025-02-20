#pragma once
#define GET_ARG(start, n, type) (*(type*)((unsigned long long)(start) + (n)*8))
#define SET_ARG(start, n, type, value) (*(type*)((unsigned long long)(start) + (n)*8) = (value))
typedef struct{
    int dev;
    char* buf;
    union{
        unsigned long count;
        unsigned long nr_sectors;
    };
    union{
        long sector;
        long lba;
        long position;
    };
    void* additional_info;
} drvioctlarg_read,drvioctlarg_write;
typedef struct{
    int dev;
    void* additional_info;
} drvioctlarg_open,drvioctlarg_close;