/**
    @file memory.c
    @brief buddy分配器和slab分配器
*/
#pragma once

#include "int.h"
#include "memory.h"
#include "log.h"
#include "str.h"
#include "mem.h"
#ifdef _DEBUG
#    include <Windows.h>
#    include <math.h>
#    include <stdio.h>
#    define L1_CACHE_ALIGNMENT 1
#endif


#ifdef _DEBUG
#    define PRINTFK(x, ...) printf(x, ##__VA_ARGS__)
#    define SPRINTFK(x, ...) sprintf(x, ##__VA_ARGS__)
#    define LOG2(x) log2(x)
#    define POW(x, y) pow(x, y)
#    define RAND() rand()
#    define STRCPYK(x, y) strcpy(x, y)
#else
#    define PRINTFK(x, ...) comprintf(x, ##__VA_ARGS__)
#    define SPRINTFK(x, ...) sprintfk(x, ##__VA_ARGS__)
#    define LOG2(x) slab_log2(x)
#    define POW(x, y) slab_pow(x, y)
#    define RAND() slab_rand()
#    define STRCPYK(x, y) strcpyk(x, y)
#endif
static SlabManager*  slab_manager;
static BuddyManager* buddy_manager             = NULL;
const char           small_buffer_cache_name[] = "small_buffer_cache";
const char           cache_of_caches_name[]    = "cache_of_caches";
const int            bits_in_unsigned          = sizeof(unsigned) * 8;

unsigned int next_power_of_two(unsigned int n)
{
    unsigned int p = 1;
    if (n && !(n & (n - 1))) {
        return n;
    }
    while (p < n) {
        p <<= 1;
    }
    return p;
}

int previous_power_of_two(unsigned int n)
{
    if (n < 1) {
        return 0;
    }
    int res = 1;
    for (int i = 0; i < 8 * sizeof(unsigned int); i++) {
        int curr = 1 << i;
        if (curr > n) {
            break;
        }
        res = curr;
    }
    return res;
}
int slab_log2(int x)
{
    int res = 0;
    while (x > 1) {
        x >>= 1;
        res++;
    }
    return res;
}
int slab_pow(int x, int y)
{
    int res = 1;
    while (y > 0) {
        if (y & 1) {
            res *= x;
        }
        x *= x;
        y >>= 1;
    }
    return res;
}
int slab_rand()
{
    return 0;
}
BuddyManager* get_buddy_manager()
{
    return buddy_manager;
}

void print_buddy_list(Block* head)
{
    Block* iter = head;
    while (iter) {
        PRINTFK("%x -> ", iter);
        iter = iter->next;
    }
    PRINTFK("\n");
}

void print_buddy_manager()
{
    PRINTFK("\n\n\n");
    PRINTFK("~~~BUDDY MANAGER~~~\n\n");
    PRINTFK("Number of blocks: %d\n", buddy_manager->number_of_blocks);
    PRINTFK("Largest block degree: %d\n", buddy_manager->largest_block_degree2);
    PRINTFK("Starting block address: %x\n", (unsigned)buddy_manager->starting_block_adr);
    PRINTFK("Headers:\n\n");
    for (int index = 0; index <= buddy_manager->largest_block_degree2; index++) {
        PRINTFK("[%03d]: ", (int)POW(2, index));
        print_buddy_list(buddy_manager->headers[index]);
    }
}

int find_minimum_sized_buddy(int minimum_index)
{
    for (int index = minimum_index; index <= buddy_manager->largest_block_degree2; index++) {
        if (buddy_manager->headers[index]) {
            return index;
        }
    }
    return -1;
}

Block* get_buddy(int size)
{

    if (size == 0) {
        PRINTFK("\nSize cannot be 0!\n");

        return NULL;
    }

    int minimum_index       = (int)LOG2(next_power_of_two(size));
    int block_to_take_index = find_minimum_sized_buddy(minimum_index);

    if (block_to_take_index == -1) {
        // PRINTFK("Not enough memory to allocate buddy with size %d\n", size);

        return NULL;   // not enough memory
    }

    Block* to_take                              = buddy_manager->headers[block_to_take_index];
    buddy_manager->headers[block_to_take_index] = buddy_manager->headers[block_to_take_index]->next;
    to_take->next                               = NULL;

    int index = block_to_take_index;

    while (index > minimum_index) {
        index--;
        int offset = 1 << index;

        Block* right_half = to_take + offset;

        to_take->next                 = buddy_manager->headers[index];
        buddy_manager->headers[index] = to_take;
        to_take                       = right_half;
    }

    return to_take;
}

Block* get_potential_buddy_of(Block* block, int size_of_block)
{

    int index = LOG2(next_power_of_two(size_of_block));
    int block_offset =
        (unsigned long long)block - (unsigned long long)buddy_manager->starting_block_adr;

    unsigned long long parity_bit_mask = (1 << (block_offset_bit_cnt + index));
    int                odd             = parity_bit_mask & block_offset;

    unsigned long long buddy = buddy_manager->starting_block_adr;

    if (odd) {
        buddy += (block_offset - parity_bit_mask);
    }
    else {
        buddy += (block_offset + parity_bit_mask);
    }

    return (Block*)buddy;
}

void put_buddy(Block* blocka, int size_of_block)
{

    Block* block = blocka;
    int    index = LOG2(next_power_of_two(size_of_block));
    Block* buddy = get_potential_buddy_of(block, size_of_block);

    Block* iterator;
    Block* prev = NULL;
    iterator    = buddy_manager->headers[index];
    if (!iterator) {
        block->next                   = NULL;
        buddy_manager->headers[index] = blocka;

        return;
    }
    // 0xffff8000003ffc78

    while (iterator) {
        if (iterator == buddy) {

            if (!prev) {
                buddy_manager->headers[index] = iterator->next;
            }
            else {
                prev->next = iterator->next;
            }

            Block* to_insert;
            if ((unsigned long long)blocka < (unsigned long long)buddy) {
                to_insert = blocka;
            }
            else {
                to_insert = buddy;
            }

            put_buddy(to_insert, 2 * size_of_block);

            return;
        }
        prev     = iterator;
        iterator = iterator->next;
    }

    block->next                   = buddy_manager->headers[index];
    buddy_manager->headers[index] = block;
}

void put_buddy_ini(Block* blocka, int size_of_block)
{

    Block* block = blocka;
    int    index = LOG2(next_power_of_two(size_of_block));
    Block* buddy = get_potential_buddy_of(block, size_of_block);

    Block* iterator;
    Block* prev = NULL;
    iterator    = buddy_manager->headers[index];
    if (!iterator) {
        block->next                   = NULL;
        buddy_manager->headers[index] = blocka;

        return;
    }
    // 0xffff8000003ffc78

    while (iterator) {
        if (iterator == buddy) {

            if (!prev) {
                buddy_manager->headers[index] = iterator->next;
            }
            else {
                prev->next = iterator->next;
            }

            Block* to_insert;
            if ((unsigned long long)blocka < (unsigned long long)buddy) {
                to_insert = block;
            }
            else {
                to_insert = buddy;
            }

            put_buddy(to_insert, 2 * size_of_block);

            return;
        }
        prev     = iterator;
        iterator = iterator->next;
    }

    block->next                   = buddy_manager->headers[index];
    buddy_manager->headers[index] = block;
}
void init_buddy_manager(void* space, int block_num)
{

    if (block_num < 2) {
        PRINTFK("\nNot enough memory!\n");
        return;
    }

    Block* first_block = (Block*)space;
    buddy_manager      = (BuddyManager*)space;
    first_block++;
    block_num--;

    buddy_manager->starting_block_adr    = first_block;
    buddy_manager->number_of_blocks      = block_num;
    buddy_manager->largest_block_degree2 = (int)LOG2(previous_power_of_two(block_num));

    for (int i = 0; i <= buddy_manager->largest_block_degree2; i++) {
        buddy_manager->headers[i] = NULL;
    }
    //加入尽可能大的块
    size_t             tot_memsz = block_num * BLOCK_SIZE;
    int                deg       = LOG2(previous_power_of_two(tot_memsz));
    unsigned long long curr_mem  = (unsigned long long)buddy_manager->starting_block_adr;
    while (deg) {
        size_t once_memsz = 1 << deg;
        put_buddy_ini(curr_mem, once_memsz);
        curr_mem += once_memsz;
        tot_memsz -= once_memsz;
        while ((1 << deg) > tot_memsz) {
            deg--;
        }
    }
    /* size_t largest_block_size = (1 << (buddy_manager->largest_block_degree2 + 1)) * BLOCK_SIZE;
    put_buddy(buddy_manager->starting_block_adr, largest_block_size);
    for (int i = 0; i < buddy_manager->number_of_blocks; i++) {
        Block* block_to_add = buddy_manager->starting_block_adr + i;
        put_buddy(block_to_add, 1);
    }*/
}

// -------------------------------------------------------------------------------------------------------------------------------

void initialize_cache_of_caches()
{

    kmem_cache_t* cache_of_caches = &slab_manager->cache_of_caches;
    cache_of_caches->next         = NULL;
    STRCPYK(cache_of_caches->name, cache_of_caches_name);
    cache_of_caches->object_size_in_bytes = sizeof(kmem_cache_t);

    int slab_size_in_blocks = 1;
    while (slab_size_in_blocks * BLOCK_SIZE / sizeof(kmem_cache_t) < 64) {
        slab_size_in_blocks++;
    }

    cache_of_caches->slab_size_in_blocks = next_power_of_two(slab_size_in_blocks);

    cache_of_caches->bitvector_size_in_unsigned =
        ((cache_of_caches->slab_size_in_blocks * BLOCK_SIZE - sizeof(SlabMetaData) - 2) /
         (sizeof(kmem_cache_t) + 1)) /
        bits_in_unsigned;

    cache_of_caches->num_of_objects_in_slab =
        cache_of_caches->bitvector_size_in_unsigned * bits_in_unsigned - 1;

    cache_of_caches->ctor = cache_of_caches->dtor = NULL;
    cache_of_caches->empty_slabs = cache_of_caches->full_slabs = cache_of_caches->mixed_slabs =
        NULL;

    cache_of_caches->unused_space_in_bytes =
        (cache_of_caches->slab_size_in_blocks * BLOCK_SIZE - sizeof(SlabMetaData) -
         cache_of_caches->bitvector_size_in_unsigned * sizeof(unsigned)) %
        sizeof(kmem_cache_t);
}

void initialize_small_buffer_caches()
{

    kmem_cache_t* small_buffer_caches = &slab_manager->small_buffer_caches;
    for (int i = STARTING_BUFFER_DEGREE; i <= NUMBER_OF_BUFFER_DEGREES + STARTING_BUFFER_DEGREE;
         i++) {

        kmem_cache_t* current_cache = small_buffer_caches + (i - STARTING_BUFFER_DEGREE);
        current_cache->next         = NULL;
        STRCPYK(current_cache->name, small_buffer_cache_name);
        current_cache->object_size_in_bytes = POW(2, i);

        int slab_size_in_blocks = 1;
        while (slab_size_in_blocks * BLOCK_SIZE / current_cache->object_size_in_bytes < 64) {
            slab_size_in_blocks++;
        }
        current_cache->slab_size_in_blocks = next_power_of_two(slab_size_in_blocks);

        current_cache->bitvector_size_in_unsigned =
            ((current_cache->slab_size_in_blocks * BLOCK_SIZE - sizeof(SlabMetaData) - 2) /
             (current_cache->object_size_in_bytes + 1)) /
            bits_in_unsigned;

        current_cache->num_of_objects_in_slab =
            ((current_cache->slab_size_in_blocks * BLOCK_SIZE - sizeof(SlabMetaData) -
              sizeof(unsigned) * current_cache->bitvector_size_in_unsigned) /
             current_cache->object_size_in_bytes);
        current_cache->num_of_objects_in_slab =
            current_cache->bitvector_size_in_unsigned * bits_in_unsigned - 1;

        current_cache->ctor = current_cache->dtor = NULL;
        current_cache->empty_slabs = current_cache->full_slabs = current_cache->mixed_slabs = NULL;

        current_cache->unused_space_in_bytes =
            (current_cache->slab_size_in_blocks * BLOCK_SIZE - sizeof(SlabMetaData) -
             current_cache->bitvector_size_in_unsigned * sizeof(unsigned)) %
            current_cache->object_size_in_bytes;
    }
}

void kmem_init(void* space, int block_num)
{
    // init_buddy_manager(space, block_num);

    if (block_num < 2) {
        PRINTFK("\nNot enough memory!\n");
        return;
    }

    Block* first_block = (Block*)space;
    buddy_manager      = (BuddyManager*)space;
    first_block++;
    block_num--;

    buddy_manager->starting_block_adr    = first_block;
    buddy_manager->number_of_blocks      = block_num;
    buddy_manager->largest_block_degree2 = (int)LOG2(previous_power_of_two(block_num));

    for (int i = 0; i <= buddy_manager->largest_block_degree2; i++) {
        buddy_manager->headers[i] = NULL;
    }
    //加入尽可能大的块
    size_t             tot_memsz = block_num * BLOCK_SIZE;
    int                deg       = LOG2(previous_power_of_two(tot_memsz));
    unsigned long long curr_mem  = (unsigned long long)buddy_manager->starting_block_adr;
    while (deg) {
        size_t once_memsz = 1 << deg;
        // put_buddy_ini(curr_mem, once_memsz);
        int    size_of_block = once_memsz;
        Block* block         = curr_mem;
        int    index         = LOG2(next_power_of_two(size_of_block));
        Block* buddy         = get_potential_buddy_of(block, size_of_block);

        Block* iterator;
        Block* prev = NULL;
        iterator    = buddy_manager->headers[index];
        if (!iterator) {
            block->next                   = NULL;
            buddy_manager->headers[index] = block;

            return;
        }
        // 0xffff8000003ffc78

        while (iterator) {
            if (iterator == buddy) {

                if (!prev) {
                    buddy_manager->headers[index] = iterator->next;
                }
                else {
                    prev->next = iterator->next;
                }

                Block* to_insert;
                if ((unsigned long long)block < (unsigned long long)buddy) {
                    to_insert = block;
                }
                else {
                    to_insert = buddy;
                }

                put_buddy(to_insert, 2 * size_of_block);

                return;
            }
            prev     = iterator;
            iterator = iterator->next;
        }

        block->next                   = buddy_manager->headers[index];
        buddy_manager->headers[index] = block;
        //---------------------------
        curr_mem += once_memsz;
        tot_memsz -= once_memsz;
        while ((1 << deg) > tot_memsz) {
            deg--;
        }
    }

    buddy_manager = get_buddy_manager();

    BuddyManager* slab_manager_adr = buddy_manager + 1;
    slab_manager                   = (SlabManager*)slab_manager_adr;


    initialize_cache_of_caches();
    initialize_small_buffer_caches();
}

kmem_cache_t* kmem_cache_create(const char* name, size_t size, void (*ctor)(void*),
                                void (*dtor)(void*))
{

    kmem_cache_t* created_cache = (kmem_cache_t*)kmem_cache_alloc(&(slab_manager->cache_of_caches));

    STRCPYK(created_cache->name, name);
    created_cache->empty_slabs = created_cache->full_slabs = created_cache->mixed_slabs = NULL;
    created_cache->ctor                                                                 = ctor;
    created_cache->dtor                                                                 = dtor;
    created_cache->next                                                                 = NULL;

    kmem_cache_t *iterator = &slab_manager->cache_of_caches, *prev = NULL;
    while (iterator) {
        prev     = iterator;
        iterator = iterator->next;
    }
    if (prev) {
        prev->next = created_cache;
    }

    created_cache->object_size_in_bytes = size;
    int slab_size_in_blocks             = 1;
    while (slab_size_in_blocks * BLOCK_SIZE / size < 32) {
        slab_size_in_blocks++;
    }

    created_cache->slab_size_in_blocks = next_power_of_two(slab_size_in_blocks);

    created_cache->bitvector_size_in_unsigned =
        (created_cache->slab_size_in_blocks * BLOCK_SIZE - sizeof(SlabMetaData) - 2) /
        (created_cache->object_size_in_bytes + 1) / bits_in_unsigned;

    created_cache->num_of_objects_in_slab =
        (created_cache->slab_size_in_blocks * BLOCK_SIZE - sizeof(SlabMetaData) -
         sizeof(unsigned) * created_cache->bitvector_size_in_unsigned) /
        created_cache->object_size_in_bytes;
    created_cache->num_of_objects_in_slab =
        created_cache->bitvector_size_in_unsigned * bits_in_unsigned - 1;

    created_cache->unused_space_in_bytes =
        (created_cache->slab_size_in_blocks * BLOCK_SIZE - sizeof(SlabMetaData) -
         created_cache->bitvector_size_in_unsigned * sizeof(unsigned)) %
        created_cache->object_size_in_bytes;


    return created_cache;
}

void* kmem_cache_alloc(kmem_cache_t* cachep)
{

    if (!cachep->empty_slabs && !cachep->mixed_slabs) {
        get_slab(cachep);
    }

    SlabMetaData* slab = NULL;

    if (cachep->mixed_slabs) {
        slab                = cachep->mixed_slabs;
        cachep->mixed_slabs = slab->next;
        slab->next          = NULL;
    }
    else if (cachep->empty_slabs) {
        slab                = cachep->empty_slabs;
        cachep->empty_slabs = slab->next;
        slab->next          = NULL;
    }
    else {
        PRINTFK("\n\nSLAB_SLOT_ALLOCATION_ERROR\n\n");
        cachep->err = SLAB_SLOT_ALLOCATION_ERROR;

        return NULL;
    }

    int free_index = get_free_index_bitvector(cachep, slab);
    if (free_index == -1) {
        PRINTFK("\n\nSLAB_SLOT_ALLOCATION_ERROR\n\n");
        cachep->err = SLAB_SLOT_ALLOCATION_ERROR;

        return NULL;
    }

    int      index = free_index / bits_in_unsigned;
    int      deg   = free_index % bits_in_unsigned;
    unsigned mask  = 1 << deg;
    slab->bitvector_start[index] |= mask;

    slab->free_slot_cnt--;

    if (!slab->free_slot_cnt) {
        slab->next         = cachep->full_slabs;
        cachep->full_slabs = slab;
    }
    else {
        slab->next          = cachep->mixed_slabs;
        cachep->mixed_slabs = slab;
    }

    void* obj = (void*)((unsigned)slab->starting_slot + free_index * cachep->object_size_in_bytes);
    if (cachep->ctor) {
        cachep->ctor(obj);
    }

    return obj;
}

void get_slab(kmem_cache_t* cachep)
{
    Block* block = get_buddy(cachep->slab_size_in_blocks);
    if (!block) {
        PRINTFK("\n\nBUDDY_ALLOCATION_ERROR\n\n");
        cachep->err = BUDDY_ALLOCATION_ERROR;

        return;
    }

    SlabMetaData* slab = (SlabMetaData*)block;
    slab->my_cache     = cachep;

    SlabMetaData* bitvector_start = slab + 1;
    slab->bitvector_start         = (unsigned*)bitvector_start;
    for (int i = 0; i < cachep->bitvector_size_in_unsigned; i++) {
        *(slab->bitvector_start + i) = 0;
    }

    unsigned* starting_slot = slab->bitvector_start + cachep->bitvector_size_in_unsigned + 1;

    if (0 && (cachep->unused_space_in_bytes / CACHE_L1_LINE_SIZE)) {
        unsigned cache_offset = RAND() % (cachep->unused_space_in_bytes / CACHE_L1_LINE_SIZE);
        unsigned starting_slot_with_l1_offset =
            ((unsigned)starting_slot + cache_offset * CACHE_L1_LINE_SIZE);
        slab->starting_slot = (void*)starting_slot_with_l1_offset;
    }
    else {
        slab->starting_slot = (void*)starting_slot;
    }

    slab->next          = cachep->empty_slabs;
    cachep->empty_slabs = slab;

    slab->free_slot_cnt = cachep->num_of_objects_in_slab;
}

SlabMetaData* get_slab_by_object_from_cache(kmem_cache_t* cachep, void* obj, int* type)
{

    SlabMetaData* iterator = cachep->full_slabs;
    while (iterator) {
        void* starting_slot = iterator->starting_slot;
        if ((unsigned)obj >= (unsigned)iterator->starting_slot &&
            (unsigned)obj < ((unsigned)iterator + BLOCK_SIZE * cachep->slab_size_in_blocks)) {
            *type = 1;

            return iterator;
        }
        iterator = iterator->next;
    }

    iterator = cachep->mixed_slabs;
    while (iterator) {
        if ((unsigned)obj >= (unsigned)iterator->starting_slot &&
            (unsigned)obj < ((unsigned)iterator + BLOCK_SIZE * cachep->slab_size_in_blocks)) {
            *type = 2;

            return iterator;
        }
        iterator = iterator->next;
    }

    iterator = cachep->empty_slabs;
    while (iterator) {
        if ((unsigned)obj >= (unsigned)iterator->starting_slot &&
            (unsigned)obj < ((unsigned)iterator + BLOCK_SIZE * cachep->slab_size_in_blocks)) {
            *type = 3;

            return iterator;
        }
        iterator = iterator->next;
    }

    return NULL;
}

void kmem_cache_free(kmem_cache_t* cachep, void* objp)
{

    int           type = -1;   // 1 full, 2 mixed, 3 empty
    SlabMetaData* slab = get_slab_by_object_from_cache(cachep, objp, &type);

    if (!slab) {

        return;
    }

    int      slot = ((unsigned)objp - (unsigned)slab->starting_slot) / cachep->object_size_in_bytes;
    int      index = slot / bits_in_unsigned;
    int      deg   = slot % bits_in_unsigned;
    unsigned mask  = ~(int)(1 << deg);
    slab->bitvector_start[index] &= mask;

    SlabMetaData *iterator = NULL, *prev = NULL;
    ;
    if (type == 1) {
        iterator = cachep->full_slabs;
    }
    else if (type == 2) {
        iterator = cachep->mixed_slabs;
    }
    else {
        iterator = cachep->empty_slabs;
    }

    while (iterator != slab) {
        prev     = iterator;
        iterator = iterator->next;
    }

    if (prev) {
        prev->next = iterator->next;
    }
    else {
        if (type == 1) {
            cachep->full_slabs = cachep->full_slabs->next;
        }
        else if (type == 2) {
            cachep->mixed_slabs = cachep->mixed_slabs->next;
        }
        else if (type == 3) {
            cachep->empty_slabs = cachep->empty_slabs->next;
        }
    }

    slab->next = NULL;
    slab->free_slot_cnt++;

    if (slab->free_slot_cnt == cachep->num_of_objects_in_slab) {
        slab->next          = cachep->empty_slabs;
        cachep->empty_slabs = slab;
    }
    else {
        slab->next          = cachep->mixed_slabs;
        cachep->mixed_slabs = slab;
    }
}

// Alloacate one small memory buffer
void* kmalloc(size_t size)
{
    //
    int deg = LOG2(next_power_of_two(size));
    deg     = 0;
    int cnt = 1;
    while (cnt < size) {
        cnt <<= 1;
        deg++;
    }
    if (deg >= 13 + STARTING_BUFFER_DEGREE) {
        comprintf("error: kmalloc size too large\n");
        die();
    }
    else if (deg < STARTING_BUFFER_DEGREE) {
        deg = STARTING_BUFFER_DEGREE;
    }
    kmem_cache_t* cachep = &slab_manager->small_buffer_caches[deg - STARTING_BUFFER_DEGREE];
    unsigned      ptr    = (unsigned)kmem_cache_alloc(cachep);
    //
    return (void*)ptr;
}

SlabMetaData* get_slab_by_object_from_buffer(void* obj, int* type)
{

    for (int i = 0; i <= NUMBER_OF_BUFFER_DEGREES; i++) {
        kmem_cache_t* cachep = &slab_manager->small_buffer_caches[i];

        SlabMetaData* iterator = cachep->full_slabs;
        while (iterator) {
            if ((unsigned)obj >= (unsigned)iterator->starting_slot &&
                (unsigned)obj < ((unsigned)iterator + BLOCK_SIZE * cachep->slab_size_in_blocks)) {
                *type = 1;

                return iterator;
            }
            iterator = iterator->next;
        }

        iterator = cachep->mixed_slabs;
        while (iterator) {
            if ((unsigned)obj >= (unsigned)iterator->starting_slot &&
                (unsigned)obj < ((unsigned)iterator + BLOCK_SIZE * cachep->slab_size_in_blocks)) {
                *type = 2;

                return iterator;
            }
            iterator = iterator->next;
        }

        iterator = cachep->empty_slabs;
        while (iterator) {
            if ((unsigned)obj >= (unsigned)iterator->starting_slot &&
                (unsigned)obj < ((unsigned)iterator + BLOCK_SIZE * cachep->slab_size_in_blocks)) {
                *type = 3;

                return iterator;
            }
            iterator = iterator->next;
        }
    }

    return NULL;
}

void kfree(const void* objp)
{

    int           type   = -1;   // 1 full, 2 mixed, 3 empty
    SlabMetaData* slab   = get_slab_by_object_from_buffer(objp, &type);
    kmem_cache_t* cachep = slab->my_cache;

    int      slot = ((unsigned)objp - (unsigned)slab->starting_slot) / cachep->object_size_in_bytes;
    int      index = slot / bits_in_unsigned;
    int      deg   = slot % bits_in_unsigned;
    unsigned mask  = ~(int)POW(2, deg);
    slab->bitvector_start[index] &= mask;

    SlabMetaData *iterator = NULL, *prev = NULL;
    ;
    if (type == 1) {
        iterator = cachep->full_slabs;
    }
    else if (type == 2) {
        iterator = cachep->mixed_slabs;
    }
    else {
        iterator = cachep->empty_slabs;
    }

    while (iterator != slab) {
        prev     = iterator;
        iterator = iterator->next;
    }

    if (prev) {
        prev->next = iterator->next;
    }
    else {
        if (type == 1) {
            cachep->full_slabs = cachep->full_slabs->next;
        }
        else if (type == 2) {
            cachep->mixed_slabs = cachep->mixed_slabs->next;
        }
        else if (type == 3) {
            cachep->empty_slabs = cachep->empty_slabs->next;
        }
    }

    slab->next = NULL;
    slab->free_slot_cnt++;

    if (slab->free_slot_cnt == cachep->num_of_objects_in_slab) {
        slab->next          = cachep->empty_slabs;
        cachep->empty_slabs = slab;
    }
    else {
        slab->next          = cachep->mixed_slabs;
        cachep->mixed_slabs = slab;
    }
}

int get_free_index_bitvector(kmem_cache_t* cachep, SlabMetaData* slab)
{

    unsigned* bitvector  = slab->bitvector_start;
    int       free_index = -1;
    for (int i = 0; i < cachep->bitvector_size_in_unsigned; i++) {
        int finished = 0;
        for (int deg = 0; deg < 32; deg++) {
            unsigned mask = 1 << deg;
            if (!(mask & *(bitvector + i))) {
                free_index = i * 32 + deg;
                finished   = 1;
                // bitvector[i] |= mask;
                break;
            }
        }
        if (finished) {
            break;
        }
    }

    return free_index;
}

int kmem_cache_shrink(kmem_cache_t* cachep)
{

    int freed = 0;
    while (cachep->empty_slabs) {
        SlabMetaData* to_delete_slab = cachep->empty_slabs;
        cachep->empty_slabs          = to_delete_slab->next;

        Block* to_delete_block = (Block*)to_delete_slab;
        put_buddy(to_delete_block, cachep->slab_size_in_blocks);
        freed += cachep->slab_size_in_blocks;
    }

    return freed;
}

void kmem_cache_destroy(kmem_cache_t* cachep)
{

    if (cachep == &slab_manager->cache_of_caches) {
        return;
    }

    /*if (cachep->full_slabs || cachep->mixed_slabs) {
        PRINTFK("\n\nCACHE_CANNOT_BE_DELETED\n\n");
        cachep->err = CACHE_CANNOT_BE_DELETED;

        return;
    }*/

    while (cachep->full_slabs) {
        SlabMetaData* to_delete_slab = cachep->full_slabs;
        cachep->full_slabs           = to_delete_slab->next;

        Block* to_delete_block = (Block*)to_delete_slab;
        put_buddy(to_delete_block, cachep->slab_size_in_blocks);
    }

    while (cachep->mixed_slabs) {
        SlabMetaData* to_delete_slab = cachep->mixed_slabs;
        cachep->mixed_slabs          = to_delete_slab->next;

        Block* to_delete_block = (Block*)to_delete_slab;
        put_buddy(to_delete_block, cachep->slab_size_in_blocks);
    }

    kmem_cache_shrink(cachep);

    kmem_cache_t *iterator = &slab_manager->cache_of_caches, *prev = NULL;
    while (iterator != cachep) {
        prev     = iterator;
        iterator = iterator->next;
    }
    if (prev) {
        prev->next = iterator->next;
    }
}

void kmem_cache_info(kmem_cache_t* cachep)
{

    PRINTFK("\n\Cache name -> %s\n", cachep->name);
    PRINTFK("Object size in bytes -> %d\n", cachep->object_size_in_bytes);
    PRINTFK("Slab size in Blocks -> %d\n", cachep->slab_size_in_blocks);
    PRINTFK("Max num of objects in slab -> %d\n", cachep->num_of_objects_in_slab);

    int           empty_slabs = 0;
    int           full_slabs  = 0;
    int           mixed_slabs = 0;
    int           free_space  = 0;
    SlabMetaData* iterator    = NULL;

    iterator = cachep->empty_slabs;
    while (iterator) {
        free_space += iterator->free_slot_cnt;
        empty_slabs++;
        iterator = iterator->next;
    }

    iterator = cachep->full_slabs;
    while (iterator) {
        free_space += iterator->free_slot_cnt;
        full_slabs++;
        iterator = iterator->next;
    }

    iterator = cachep->mixed_slabs;
    while (iterator) {
        free_space += iterator->free_slot_cnt;
        mixed_slabs++;
        iterator = iterator->next;
    }

    PRINTFK("Empty slabs number -> %d\n", empty_slabs);
    PRINTFK("Full slabs number -> %d\n", full_slabs);
    PRINTFK("Mixed slabs number -> %d\n", mixed_slabs);
    PRINTFK("Free space left -> %d\n", free_space);
    int taken_space =
        (empty_slabs + full_slabs + mixed_slabs) * cachep->num_of_objects_in_slab - free_space;
    PRINTFK("Total objects created -> %d\n", taken_space);
    PRINTFK("Percentage of space used -> %lf\n",
            (double)taken_space / (double)(taken_space + free_space) * 100);
    PRINTFK("Unused space inside slab -> %d\n", cachep->unused_space_in_bytes);
    if (0) {
        PRINTFK("Different L1_Cache alignments -> %d\n",
                (cachep->unused_space_in_bytes / CACHE_L1_LINE_SIZE));
    }
    PRINTFK("\n");
}

int kmem_cache_error(kmem_cache_t* cachep)
{
    return cachep->err;
}