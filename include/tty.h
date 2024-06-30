#pragma once
#define MONITOR_BLACK 0
#define MONITOR_BLUE 1
#define MONITOR_GREEN 2
#define MONITOR_CRIMSON 4
#define MONITOR_LIGHTGRAY 7
#define MONITOR_GRAY 8
#define MONITOR_LIGHTBLUE 9
#define MONITOR_RED 12
#define MONITOR_WHITE 15
#define MONITOR_BG_BLACK 0
#define MONITOR_BG_BLUE 0x10
#define MONITOR_BG_GREEN 0x20
#define MONITOR_BG_CRIMSON 0x40
#define MONITOR_BG_LIGHTGRAY 0x70
#define MONITOR_BG_GRAY 0x80
#define MONITOR_BG_LIGHTBLUE 0x90
#define MONITOR_BG_RED 0xc0
#define MONITOR_BG_WHITE 0xf0

#define VIDEO_MONOTEXT 0
#define VIDEO_CHROMATEXT 1
#define VIDEO_GRAPHICS 2
#define SCREEN_W 80
#define SCREEN_H 25
#include "devdrv.h"
//以下是文字模式使用的函数
int read_tty(driver_args * args);
int write_tty(driver_args * args);
int seek_tty(driver_args * args);
void del_ch();
void init_tty();
void set_origin();
void scrdown();
void scrup();
void cls(driver_args *args);
void set_color(char color);
void set_cur();

int tty_do_req(driver_args *args);
//以下是VBE使用的函数
/*
#define RGB_BLACK 0
#define RGB_WHITE 1
#define RGB_GRAY 2
#define RGB_MARINE 3
#define RGB_DARKGRAY 4
#define COLOR_PALLETE_INDEX_PORT 0x3c8
#define COLOR_PALLETE_VALUE_PORT 0x3c9
#define VBE_W 800
#define VBE_H 640
void init_vbe();
void draw_pixel(int x, int y, unsigned char color);
void draw_rect(int x,int y,int w,int h,int color);
unsigned char get_color(int x,int y);
void set_pallete(int i,char r,char g,char b);
void draw_letter(int x,int y,char c);
void draw_text(int x,int y,char* str);*/
