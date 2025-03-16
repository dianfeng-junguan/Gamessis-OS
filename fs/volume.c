#include "volume.h"
#include "memman.h"
#ifdef DEBUG
#    include <errno.h>
#    include <stdio.h>
#    include <stdlib.h>
#    include <string.h>
#else
#    include "errno.h"
#    include "log.h"
#endif

volume_manager* _init_volume_manager(size_t capacity);
int             _register_volume(volume_manager* manager, const volume* vol);
int             _unregister_volume(volume_manager* manager, const char* name);
void            _cleanup_volume_manager(volume_manager* manager);
volume*         _get_volume_by_name(volume_manager* manager, const char* name);

volume_manager* default_volume_manager = NULL;
int             init_volumeman()
{
    if ((default_volume_manager = _init_volume_manager(MAX_VOLUMES)) == NULL) {
        KPRINTF("Error: Failed to initialize volume manager.\n");
        return -EINVAL;
    }
    return 0;
}

void cleanup_volumeman()
{
    if (default_volume_manager) {
        _cleanup_volume_manager(default_volume_manager);
        default_volume_manager = NULL;
    }
}

int register_volume(volume* vol)
{
    if (!default_volume_manager) {
        KPRINTF("Error: Volume manager not initialized.\n");
        return -EINVAL;
    }
    return _register_volume(default_volume_manager, vol);
}

int unregister_volume(char* name)
{
    if (!default_volume_manager) {
        KPRINTF("Error: Volume manager not initialized.\n");
        return -EINVAL;
    }
    return _unregister_volume(default_volume_manager, name);
}

volume* get_volume_by_name(char* name)
{
    if (!default_volume_manager) {
        KPRINTF("Error: Volume manager not initialized.\n");
        return NULL;
    }
    return _get_volume_by_name(default_volume_manager, name);
}
//================内部函数=================

// 初始化卷管理器
volume_manager* _init_volume_manager(size_t capacity)
{
    volume_manager* manager = (volume_manager*)KMALLOC(sizeof(volume_manager));
    if (!manager) {
        KPRINTF("Error: Failed to allocate memory for volume manager.\n");
        return NULL;
    }
    manager->volumes = (volume*)KMALLOC(capacity * sizeof(volume));
    if (!manager->volumes) {
        KPRINTF("Error: Failed to allocate memory for volumes.\n");
        KFREE(manager);
        return NULL;
    }
    manager->capacity = capacity;
    manager->count    = 0;
    return manager;
}

// 注册卷
int _register_volume(volume_manager* manager, const volume* vol)
{
    if (manager->count >= manager->capacity) {
        KPRINTF("Error: Volume manager is full.\n");
        return -ENOMEM;
    }

    // 检查是否已经存在同名卷
    for (size_t i = 0; i < manager->count; i++) {
        if (STRCMP(manager->volumes[i].name, vol->name) == 0) {
            KPRINTF("Error: Volume with the same name already exists.\n");
            return -EEXIST;
        }
    }

    // 复制新的卷信息
    memcpy(&manager->volumes[manager->count], vol, sizeof(volume));
    manager->count++;
    return 0;
}

// 注销卷
int _unregister_volume(volume_manager* manager, const char* name)
{
    for (size_t i = 0; i < manager->count; i++) {
        if (STRCMP(manager->volumes[i].name, name) == 0) {
            // 移除卷信息，并将最后一个卷信息移到当前位置
            if (i < manager->count - 1) {
                manager->volumes[i] = manager->volumes[manager->count - 1];
            }
            manager->count--;
            return 0;
        }
    }
    KPRINTF("Error: Volume with the name '%s' not found.\n", name);
    return -ENOENT;
}

// 根据卷名获取卷数据结构指针
volume* _get_volume_by_name(volume_manager* manager, const char* name)
{
    for (size_t i = 0; i < manager->count; i++) {
        if (STRCMP(manager->volumes[i].name, name) == 0) {
            return &manager->volumes[i];
        }
    }
    KPRINTF("Error: Volume with the name '%s' not found.\n", name);
    return NULL;
}

// 清理卷管理器
void _cleanup_volume_manager(volume_manager* manager)
{
    if (manager) {
        KFREE(manager->volumes);
        KFREE(manager);
    }
}