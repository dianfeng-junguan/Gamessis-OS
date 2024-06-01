#pragma once
/* 
这部分负责内存的按页分配，内存上下界的检测，和页表页目录的管理。
 */
#include "page.h"

#define PAGE_INDEX_ADDR 0x1000
#define PAGE_TABLE_ADDR 0x2000
typedef unsigned int page_item;
//内存页的分配-不是指页表
void init_memory();

//申请一页内存，返回内存地址。
int req_a_page();
int req_page_at(int base,int pgn);

int free_page(char *paddr);
int free_pages_at(int base,int pgn);

//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn);
int check_page(int num);

int get_phyaddr(int num);
//页表页目录部分
void set_page_item(page_item *item_addr,int phy_addr,int attr);

void page_err();
//vmalloc区部分
int vmalloc();
int vmfree(int ptr);
int chk_vm(int base, int pgn);
