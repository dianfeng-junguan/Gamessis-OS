#pragma once
typedef unsigned int atomic_t;
/**
    @brief 这个数据结构的原理是这样的：当一个任务试图获取锁时，首先从next领取一个owner值(next随即加一)，
    每当前面持有锁的任务释放锁，就将owner加1，这样后面的任务在检测owner的时候就会
    检测到owner等于自己的owner值，然后获得锁。
*/
typedef struct{
    atomic_t lock;
    int owner;
    int next;
}spinlock_t,mutex_t;
/**
    @brief 尝试获取锁
    @param lock 锁变量
    @return 成功返回1，失败返回0
*/
int try_get_lock(atomic_t *lock);
void release_lock(atomic_t *lock);
/**
    @brief 尝试swap锁的值
    @param lock 锁变量
    @param new_value 要设置的新值
    @return lock原来的值
*/
int _swap_lock(atomic_t *lock,int new_value);
/**
    @brief 原子地自增一个整数变量，并返回自增前的值。
    @param num 整数变量的指针
    @return 自增前的值
*/
int _atomic_inc(int *num);

/**
    @brief 尝试获取自旋锁
    @param lock 锁变量
    @return 成功返回1，失败返回0
*/
int get_spinlock(spinlock_t *lock);
void init_spinlock(spinlock_t *lock);
int release_spinlock(spinlock_t* lock);


/**
    @brief 尝试获取互斥锁
    @param lock 锁变量
    @return 成功返回1，失败返回0
*/
int get_mutex(mutex_t *lock);
void init_mutex(mutex_t *lock);
int release_mutex(mutex_t* lock);