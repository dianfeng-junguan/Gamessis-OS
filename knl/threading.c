#include "threading.h"
int try_get_lock(atomic_t* lock)
{
    return !_swap_lock(lock, 1);
}
void release_lock(atomic_t* lock)
{
    _swap_lock(lock, 0);
}
void init_spinlock(spinlock_t* lock)
{
    lock->lock  = 0;
    lock->owner = 0;
    lock->next  = 0;
}

int get_spinlock(spinlock_t* lock)
{
    int ticket = _atomic_inc(&lock->next);
    while (lock->owner != ticket)
        ;
    return 1;
}

int release_spinlock(spinlock_t* lock)
{
    _atomic_inc(&lock->owner);
    return 1;
}

int _swap_lock(atomic_t* lock, int new_value)
{
    __asm__ volatile("lock xchg %0, %1" : "=r"(new_value) : "m"(*lock), "m"(new_value));
    return new_value;
}

int _atomic_inc(int* num)
{
    __asm__ volatile("lock inc %0" : "=m"(*num));
    return *num - 1;
}

int get_mutex(mutex_t* lock)
{
    int ticket = _atomic_inc(&lock->next);
    while (lock->owner != ticket) {
        schedule();
    }
    return 1;
}
void init_mutex(mutex_t* lock)
{
    lock->owner = 0;
    lock->next  = 0;
    lock->lock  = 0;
}
int release_mutex(mutex_t* lock)
{
    _atomic_inc(&lock->owner);
    return 1;
}