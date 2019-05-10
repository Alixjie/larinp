#include "string.h"

inline void memcpy(uchar_t *dest, const uchar_t *src, uint_t len)
{
    while (len-- > 0)
        *dest++ = *src++;
}

void *memmove(void *dst, const void *src, uint_t n)
{
    const char *s = src;
    char *d = dst;
    if (s < d && s + n > d)
    {
        s += n;
        d += n;
        while (n-- > 0)
            *--d = *--s;
    }
    else
        while (n-- > 0)
            *d++ = *s++;

    return dst;
}

inline void memset(void *dest, uchar_t val, uint_t len)
{
    uchar_t *dst = (uchar_t *)dest;

    while (len-- > 0)
        *dst++ = val;
}

inline void bzero(void *dest, uint_t len)
{
    memset(dest, 0, len);
}

//长度存在问题
inline int strcmp(const char *str1, const char *str2)
{
    while ((*str1 != 0) && (*str2 != 0))
    {
        if (*str1++ == *str2++)
            continue;
        else
            return FALSE;
    }
    if (*str1 == *str2)
        return TRUE;
    else
        return FALSE;
}

char *safestrcpy(char *s, const char *t, int n)
{
    char *os = s;
    if (n <= 0)
        return os;
    while (--n > 0 && (*s++ = *t++) != 0)
        ;
    *s = 0;
    return os;
}

inline char *strcat(char *dest, const char *src)
{
    char *end = dest;

    while (*end++)
        ;

    while (*src)
        *end++ = *src++;
    *end = '\0';

    return dest;
}

inline int strlen(const char *src)
{
    int i = 0;

    while (*src++)
        ++i;

    return i;
}