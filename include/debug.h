#ifndef INCLUDE_DEBUG_H
#define INCLUDE_DUBUG_H

#include "console.h"
#include "vargs.h"

//内核打印函数
void printk(const char *format, ...);

void printk_color(real_color_t back, real_color_t fore, const char *format, ...);

#endif