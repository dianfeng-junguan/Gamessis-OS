#include "memman.h"
#include "sys/types.h"
#include "typename.h"

// 全局的slab缓存列表
// slab_cache_t* slab_cache_manager->slab_caches = NULL;
slab_cache_manager_t* slab_cache_manager = NULL;
// 创建一个新的slab
slab_t* create_slab(slab_cache_t* cache)
{
    int     align_order = cache->align_order;
    slab_t* slab        = (slab_t*)buddy_alloc(
        align_up(sizeof(slab_t), 1 << align_order) +
            align_up(cache->object_size, 1 << align_order) * DEFAULT_OBJECT_NUM,
        align_order);
    if (slab == NULL) {
        log("Failed to allocate slab\n");
        return NULL;
    }
    int num_objects =
        DEFAULT_OBJECT_NUM;   //(DEFAULT_OBJECT_NUM - sizeof(slab_t)) / cache->object_size;
    slab->free_list   = (slab_object_t*)((char*)slab + align_up(sizeof(slab_t), 1 << align_order));
    slab->num_objects = num_objects;
    slab->in_use      = 0;

    // 初始化空闲链表
    slab_object_t* prev = NULL;
    slab_object_t* curr = slab->free_list;
    for (int i = 0; i < num_objects - 1; i++) {
        curr->next = (slab_object_t*)((char*)curr + align_up(cache->object_size, 1 << align_order));
        prev       = curr;
        curr       = curr->next;
    }
    if (prev) {
        prev->next = NULL;
    }

    return slab;
}
int destroy_slab(slab_t* slab)
{
    if (slab == NULL) {
        return -1;
    }
    buddy_free(slab);
    return 0;
}
// 创建一个新的slab缓存
slab_cache_t* create_slab_cache(int object_size, int align_order)
{
    slab_cache_t* cache = slab_cache_manager->slab_caches;
    while (cache->object_size && cache - slab_cache_manager->slab_caches < 32) {
        cache++;
    }
    if (cache - slab_cache_manager->slab_caches >= 32) {
        return NULL;
    }
    if (cache == NULL) {
        comprintf("Failed to allocate slab cache");
        return NULL;
    }
    cache->object_size = object_size;
    cache->num_slabs   = 0;
    cache->slabs       = NULL;
    cache->align_order = align_order;
    return cache;
}
int destroy_slab_cache(slab_cache_t* cache)
{
    if (cache == NULL) {
        return -1;
    }
    slab_t* slab = cache->slabs;
    while (slab != NULL) {
        slab_t* next = slab->next;
        destroy_slab(slab);
        slab = next;
    }
    cache->slabs       = NULL;
    cache->num_slabs   = 0;
    cache->object_size = 0;
    return 0;
}
int init_slab_caches(void* space)
{
    slab_cache_manager = space;
    memset(slab_cache_manager->slab_caches, 0, 32 * sizeof(slab_cache_t));
    return 0;
}
size_t next_pow2(size_t size)
{
    size_t pow2 = 1;
    while (pow2 < size) {
        pow2 *= 2;
    }
    return pow2;
}
// 从slab缓存中分配内存
void* kmalloc(size_t size, int align_order)
{
    // 查找合适的slab缓存
    slab_cache_t* cache      = slab_cache_manager->slab_caches;
    slab_cache_t* best_cache = cache;
    while (cache - slab_cache_manager->slab_caches < 32) {
        if (cache->object_size == size && cache->align_order >= align_order) {
            break;
        }
        else if (cache->object_size > size && cache->object_size < best_cache->object_size &&
                 cache->align_order >= align_order) {
            best_cache = cache;
        }
        cache++;
    }
    if (best_cache->object_size < size || best_cache->align_order < align_order) {
        // 如果没有找到合适的缓存，创建一个新的
        best_cache = create_slab_cache(next_pow2(size), align_order);
        if (best_cache == NULL) {
            log("failed to create slab cache\n");
            return NULL;
        }
    }

    // 查找一个有空闲对象的slab
    slab_t* slab = best_cache->slabs;
    while (slab != NULL && slab->in_use == slab->num_objects) {
        slab = slab->next;
    }
    if (slab == NULL) {
        // 如果没有空闲的slab，创建一个新的
        slab = create_slab(best_cache);
        if (slab == NULL) {
            log("failed to create slab\n");
            return NULL;
        }
        slab->next        = best_cache->slabs;
        best_cache->slabs = slab;
    }

    // 从空闲链表中取出一个对象
    slab_object_t* obj = slab->free_list;
    if (obj != NULL) {
        slab->free_list = obj->next;
        slab->in_use++;
        return obj;
    }
    return NULL;
}

// 释放内存回slab缓存
int kfree(void* ptr)
{
    if (ptr == NULL) {
        return -1;
    }
    for (int i = 0; i < 32; i++) {
        slab_cache_t* cache = slab_cache_manager->slab_caches + i;
        if (cache->slabs == NULL) {
            continue;
        }
        for (slab_t* slab = cache->slabs; slab != NULL; slab = slab->next) {
            if ((char*)slab <= (char*)ptr &&
                (char*)slab + align_up(sizeof(slab_t), 1 << cache->align_order) +
                        slab->num_objects * align_up(cache->object_size, 1 << cache->align_order) >
                    (char*)ptr) {
                slab_object_t* obj = (slab_object_t*)(ptr);
                obj->next          = slab->free_list;
                slab->free_list    = obj;
                slab->in_use--;
                return 0;
            }
        }
    }
    // 如果没有找到对应的slab，说明是非法的指针
    return -1;
}