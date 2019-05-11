#ifndef INCLUDE_LOCK_H
#define INCLUDE_LOCK_H

struct lock
{
    uint_t locked; // 是否被锁（1 占用 | 0 未占用）

    // 调试用
    char *name;      // 锁名
    struct cpu *cpu; // 持有该锁的 CPU
    //uint_t procallstack[10];  // 函数调用过程
};

void initlock(struct lock *lk, char *name);

void acquire(struct lock *lk);

void release(struct lock *lk);

int alrdyhold(struct lock *lock);

void pcli(void);

void vcli(void);

#endif