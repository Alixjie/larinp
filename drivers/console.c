#include "x86.h"
#include "console.h"
#include "memlayout.h"
#include "types.h"

static ushort_t *video_memory_start = (ushort_t *)P2V_A(0xB8000);

static uchar_t cursor_x = 0;
static uchar_t cursor_y = 0;

static void move_cursor()
{
    ushort_t cursor_location = cursor_y * 80 + cursor_x;

    outb(0x3D4, 14);
    outb(0x3D5, cursor_location >> 8);

    outb(0x3D4, 15);
    outb(0x3D5, cursor_location);
}

void console_clear()
{
    uchar_t attribute_byte = ((uchar_t)rc_black << 4) | ((uchar_t)rc_white & 0x0F);
    ushort_t blank = 0x20 | (attribute_byte << 8);

    for (ushort_t i = 0; i < 80 * 25; ++i)
        video_memory_start[i] = blank;

    cursor_x = 0;
    cursor_y = 0;

    move_cursor();
}

static void scroll()
{
    uchar_t attribute_byte = ((uchar_t)rc_black << 4) | ((uchar_t)rc_white & 0x0F);
    ushort_t blank = 0x20 | (attribute_byte << 8);

    if (cursor_y >= 25)
    {
        for (ushort_t i = 0; i < 24 * 80; ++i)
            video_memory_start[i] = video_memory_start[i + 80];

        for (ushort_t i = 24 * 80; i < 25 * 80; ++i)
            video_memory_start[i] = blank;

        cursor_y = 24;
    }
}

void console_putc_color(char c, real_color_t back, real_color_t fore)
{
    uchar_t back_color = (uchar_t)back;
    uchar_t fore_color = (uchar_t)fore;

    uchar_t attribute_byte = (back_color << 4) | (fore_color & 0x0F);
    ushort_t attribute_word = attribute_byte << 8;

    if (c == '\b' && cursor_x)
    {
        --cursor_x;
    }
    else if (c == 0x09)
    {
        cursor_x = (cursor_x + 8) & ~(8 - 1);
    }
    else if (c == '\r')
    {
        cursor_x = 0;
    }
    else if (c == '\n')
    {
        cursor_x = 0;
        ++cursor_y;
    }
    else if (c >= ' ')
    {
        video_memory_start[cursor_y * 80 + cursor_x] = c | attribute_word;
        ++cursor_x;
    }

    if (cursor_x >= 80)
    {
        cursor_x = 0;
        ++cursor_y;
    }

    scroll();
    move_cursor();
}

void console_write(char *cstr)
{
    while (*cstr)
        console_putc_color(*cstr++, rc_black, rc_white);
}

void console_write_color(char *cstr, real_color_t back, real_color_t fore)
{
    while (*cstr)
        console_putc_color(*cstr++, back, fore);
}

void console_write_hex(uint_t n, real_color_t back, real_color_t fore)
{
    char head_are_zeros = 1;
    console_write_color("0x", back, fore);

    for (char_t i = 28; i >= 0; i -= 4)
    {
        uint_t temp = (n >> i) & 0x0F;
        if ((temp == 0) && head_are_zeros)
            continue;

        head_are_zeros = 0;
        if (temp >= 0x0A)
            console_putc_color((temp - 0x0A + 'a'), back, fore);
        else
            console_putc_color(temp + '0', back, fore);
    }
}

void console_write_dec(uint_t n, real_color_t back, real_color_t fore)
{
    if (n == 0) {
        console_putc_color('0', back, fore);
        return;
    }

    uint_t rec = n;
    char rigt_to_lift[32];
    int i = 0;
    
    while (rec > 0)
    {
        rigt_to_lift[i] = '0' + (rec % 10);
        rec /= 10;
        ++i;
    }
    rigt_to_lift[i] = 0;
    
    char lift_to_right[32];
    lift_to_right[i--] = 0;

    int j = 0;
    while(i >= 0)
        lift_to_right[i--] = rigt_to_lift[j++];

    console_write_color(lift_to_right, back, fore);
}
