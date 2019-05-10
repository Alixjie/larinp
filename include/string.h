#ifndef INCLUDE_STRING_H
#define INCLUDE_STRING_H

#include "types.h"

void memcpy(uchar_t *dest, const uchar_t *src, uint_t len);

void memset(void *dest, uchar_t val, uint_t len);

void *memmove(void *dst, const void *src, uint_t n);

void bzero(void *dest, uint_t len);

int strcmp(const char *str1, const char *str2);

char *strcpy(char *dest, const char *src);

char *strcat(char *dest, const char *src);

char *safestrcpy(char *s, const char *t, int n);

int strlen(const char *src);

#endif