#pragma once
#ifdef DEBUG
#include <stddef.h>
#endif
#include "sys/types.h"
#define MIN_BLOCK_SIZE (1 << 10) // 最小块大小为1KB
#define MAX_BLOCK_SIZE (1 << 20) // 最大块大小为1MB
#define BLOCK_SIZE 4096
#define ALIGNMENT 4096 // 4096字节对齐
#define NO_ALIGN 0
#define ALIGN_16 4
#define ALIGN_32 5
#define ALIGN_64 6
#define ALIGN_512 9
#define ALIGN_4096 12

#define DEFAULT_OBJECT_NUM 32
typedef struct Block {
    char magic[5]; // 魔数，用于校验
    struct Block* next;
    size_t size;
    int allocated;
    int alignment;
} Block;

typedef struct BuddyAllocator {
    Block* free_list;
    size_t total_size;
    char* memory;
} BuddyAllocator;
extern BuddyAllocator* allocator;


// 定义slab缓存中的对象结构
typedef struct slab_object {
    struct slab_object* next;
} slab_object_t;

// 定义slab结构
typedef struct slab {
    struct slab* next;
    slab_object_t* free_list;
    int num_objects;
    int in_use;
} slab_t;

// 定义slab缓存结构
typedef struct slab_cache {
    struct slab_cache* next;
    slab_t* slabs;
    int num_slabs;
    int object_size;
    unsigned long long align_order;// 块对齐的阶数
} slab_cache_t;

typedef struct slab_cache_manager {
    slab_cache_t slab_caches[32];
}
slab_cache_manager_t;
// 全局的slab缓存列表
// extern slab_cache_t* slab_caches;
extern slab_cache_manager_t* slab_cache_manager ;

// 函数声明
unsigned long long align_up(unsigned long long value, int alignment);
BuddyAllocator* buddy_allocator_init(void* space, size_t total_size);
Block* find_suitable_free(size_t size, int alignment);
void split_block(Block* block, size_t size);
void merge_buddies(Block* block);
void* buddy_alloc(size_t size, int align);
void buddy_free(void* ptr);
void buddy_allocator_destroy(BuddyAllocator* allocator);
size_t prev_pow2(size_t n);

// 函数声明
int destroy_slab(slab_t* slab);
slab_t* create_slab(slab_cache_t* cache);
slab_cache_t* create_slab_cache(int object_size,int align_order);
void* kmalloc(size_t size,int flags);
int destroy_slab_cache(slab_cache_t* cache);
int init_slab_caches(void* space);
int kfree(void* ptr);

#ifdef DEBUG
#define log(fmt,...) printf(fmt, ##__VA_ARGS__)
#else
#define log(fmt,...) comprintf(fmt, ##__VA_ARGS__)

#endif