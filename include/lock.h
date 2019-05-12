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

// 初始化锁（ name 方便调试）
void initlock(struct lock *lk, char *name);

// 申请锁（首先屏蔽中断 主要用途 
// 对于多核情况用原子操作 xchg 保证在一个时间内只有一个 CPU 在占用 其他申请的 CPU 会陷入忙式等待）
void acquire(struct lock *lk);

// 释放锁 先还锁再开中断 避免内核死锁
void release(struct lock *lk);

// 当前该 CPU 是否已经持有了该锁
int alrdyhold(struct lock *lock);

// 提交一次中断 会有次数累加 两次 plic() 需要两次 vcli() 来释放
void pcli(void);

// 释放一次中断
void vcli(void);

#endif