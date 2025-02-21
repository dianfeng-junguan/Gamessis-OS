#include "memman.h"
#include "sys/types.h"
#include "typename.h"
BuddyAllocator* allocator;

// 向上取整到对齐边界
unsigned long long align_up(unsigned long long value, int alignment)
{
    if (!alignment) {
        return value;
    }
    return (value + alignment - 1) & ~(alignment - 1);
}

// 初始化内存分配器，space请务必是4KB对齐的
BuddyAllocator* buddy_allocator_init(void* space, size_t total_size)
{
    allocator = (BuddyAllocator*)space;
    if (allocator == NULL) {
        return NULL;
    }

    allocator->total_size = total_size - BLOCK_SIZE;
    allocator->memory     = space + BLOCK_SIZE;
    if (allocator->memory == NULL) {
        return NULL;
    }

    allocator->free_list            = (Block*)allocator->memory;
    allocator->free_list->size      = total_size;
    allocator->free_list->allocated = 0;
    allocator->free_list->next      = NULL;

    return allocator;
}

// 查找合适的空闲块
Block* find_suitable_free(size_t size, int alignment)
{
    Block* current = allocator->free_list;
    while (current != NULL) {
        // 确保数据区地址对齐且大小满足申请大小
        int data_offset    = sizeof(Block);
        int aligned_offset = align_up(data_offset, alignment);
        int usable_size    = current->size - aligned_offset;
        if (usable_size >= size && !current->allocated) {
            return current;
        }
        current = current->next;
    }
    return NULL;
}

// 分割块
void split_block(Block* block, size_t size)
{
    // int min_size = align_up(size, ALIGNMENT);
    if (block->size > 2 * size) {
        char*  new_block_addr = (char*)block + block->size / 2;
        Block* new_block      = (Block*)new_block_addr;
        new_block->size       = block->size - (int)(new_block_addr - (char*)block);
        new_block->allocated  = 0;
        new_block->next       = block->next;
        block->next           = new_block;
        block->size           = (int)(new_block_addr - (char*)block);
        split_block(new_block, size);
    }
}

// 合并伙伴块
void merge_buddies(Block* block)
{
    Block* current = block->next;
    if (current != NULL && block->size == current->size && !block->allocated &&
        !current->allocated) {
        char* next_block_addr = (char*)current;
        block->size += current->size;
        block->next = current->next;
        // memmove(next_block_addr, next_block_addr + block->size,
        //     allocator->total_size - ((char*)next_block_addr - allocator->memory) - block->size);
        log("now the merged block size is %x\n", block->size);
        merge_buddies(block);
    }
}

/**
    @brief 分配内存，如果需要对齐，需要预先在初始化时传入对齐的space
*/
void* buddy_alloc(size_t size, int align)
{
    if (align) {
        align      = 1 << align;
        size_t add = align_up(sizeof(Block), align) - sizeof(Block);
        size += add;
    }
    Block* block = find_suitable_free(size, align);
    if (block == NULL) {
        return NULL;
    }
    while (block->size - sizeof(Block) > size && size * 2 < block->size - sizeof(Block)) {
        split_block(block, size);
    }
    block->alignment = align;
    block->allocated = 1;
    memcpy(block->magic, "BUDDY", 5);
    // 计算数据存储区地址，保证4096字节对齐
    unsigned long long ptr            = (unsigned long long)block + sizeof(Block);
    unsigned long long aligned_offset = align_up(ptr, align);
    return (void*)aligned_offset;
}

// 释放内存
void buddy_free(void* ptr)
{
    // 找到对应的Block结构体地址
    Block* block = ptr;
    while (memcmp(block->magic, "BUDDY", 5)) {
        block = (Block*)((char*)block - 1);
    }
    block->allocated = 0;
    merge_buddies(block);
}

// 释放内存分配器
void buddy_allocator_destroy(BuddyAllocator* allocator)
{
    Block* current = allocator->free_list;
    while (current != NULL) {
        Block* next = current->next;
        if (current->allocated) {
            buddy_free(current);
        }
        current = next;
    }
}
size_t prev_pow2(size_t n)
{
    size_t i = 1;
    while (n > i) {
        i <<= 1;
    }
    return i;
}