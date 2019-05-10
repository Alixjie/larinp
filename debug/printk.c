#include "debug.h"
#include "console.h"
#include "string.h"
#include "vargs.h"

static int vsprintf(char *buff, const char *format, va_list args);

void printk(const char *format, ...)
{
    static char buff[1024];
    va_list args;

    va_start(args, format);
    int i = vsprintf(buff, format, args);
    va_end(args);

    buff[i] = '\0';

    console_write(buff);
}

void printk_color(real_color_t back, real_color_t fore, const char *format, ...)
{
    static char buff[1024];
    va_list args;

    va_start(args, format);
    int i = vsprintf(buff, format, args);
    va_end(args);

    buff[i] = '\0';

    console_write_color(buff, back, fore);
}

#define is_digit(c) ((c) >= '0' && (c) <= '9')

static int skip_atoi(const char **s) //把字符表述的整型数字转化成真正的整型
{
    int i = 0;

    while (is_digit(**s))
        i = i * 10 + *((*s)++) - '0';

    return i;
}

#define ZEROPAD 1  // pad with zero用0填补         ‘%04d’  4位宽度，不够前面补零
#define SIGN 2     // unsigned/signed long  ‘%d和%i  ， %u（有符号）’
#define PLUS 4     // show plus           ‘+’
#define SPACE 8    // space if plus       ‘ ’
#define LEFT 16    // left justified        ‘-’，左对齐即数据先输出，不够宽度用指定符号补齐
#define SPECIAL 32 // 0x                  ‘#’
#define SMALL 64   // use 'abcdef' instead of 'ABCDEF'
//注意此处数字设计，1 = 0000001,2 = 0000010， 4 = 0000100 ，8 = 0001000...
//6位中每一位对应一种格式，有则为1

#define do_div(n, base) ({ \
		int __res; \
		__asm__("divl %4":"=a" (n),"=d" (__res):"0" (n),"1" (0),"r" (base)); \
		__res; })
//返回商_res，divl长字4字节，刚好符合下面的int
//32位相除，商在EAX,余数在EDX，#define a ({1;2;3;})奇怪的表达调用a ，即为3，同理调用do_div，即为_res值

static char *number(char *str, int num, int base, int size /*field_width*/, int precision, int type /*flag*/)
{
    char c, sign, tmp[36];
    const char *digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int i;

    if (type & SMALL)
    { //用小写
        digits = "0123456789abcdefghijklmnopqrstuvwxyz";
    }
    if (type & LEFT)
    { //如果flag既有左对齐，又有用0来补，此处指明数位不够，则用左对齐规则（用空格补），不用0补
        type &= ~ZEROPAD;
    }
    if (base < 2 || base > 36)
    {
        return 0;
    } //base = 2， 10, 8，16

    c = (type & ZEROPAD) ? '0' : ' '; //如果flag既有左对齐，又有用0来补，上面吧ZEROPAD删去了，所以用空格

    if (type & SIGN && num < 0)
    {               //    +        输出符号(正号或负号)
        sign = '-'; //    空格        输出值为正时冠以空格，为负时冠以负号
        num = -num; //
    }
    else
    {
        sign = (type & PLUS) ? '+' : ((type & SPACE) ? ' ' : 0); //num可能为0和正数，有PLUS那么输出带+，没有PLUS有空格输出带空格，没有空格那就是为0
    }

    if (sign)
    { //有正负号，占去一位宽度
        size--;
    }
    if (type & SPECIAL)
    { //有SPECIAL
        if (base == 16)
        {
            size -= 2; //输出前缀0x占去两位
        }
        else if (base == 8)
        { //输出前缀o
            size--;
        }
    }
    i = 0;
    if (num == 0)
    {
        tmp[i++] = '0';
    }
    else
    {
        while (num != 0)
        {
            tmp[i++] = digits[do_div(num, base)]; //假如num为25，tmp从0开始存着‘5’，‘2’
        }
    }

    if (i > precision)
    { //精度限制，主要用于小数点后几位（虽然没有）
        precision = i;
    }
    size -= precision; //如果表达的是带小数的整数，size剩下为整数部分位数

    if (!(type & (ZEROPAD + LEFT)))
    { //ZEROPAD和LEFT都没有
        while (size-- > 0)
        {
            *str++ = ' ';
        }
    }
    if (sign)
    { //带符号的附上正负号
        *str++ = sign;
    }
    if (type & SPECIAL)
    {
        if (base == 8)
        { //八进制带上0
            *str++ = '0';
        }
        else if (base == 16)
        { //十六进制带上0x
            *str++ = '0';
            *str++ = digits[33];
        }
    }
    if (!(type & LEFT))
    { //没有LEFT
        while (size-- > 0)
        {
            *str++ = c;
        }
    }
    while (i < precision--)
    { //用0补齐到指定宽度
        *str++ = '0';
    }
    while (i-- > 0)
    { //反着到给str，num25,10进制，tmp中存‘5’‘2’，现在str中变成25
        *str++ = tmp[i];
    }
    while (size-- > 0)
    { //用空格补齐到指定宽度
        *str++ = ' ';
    }

    return str;
}

static int vsprintf(char *buff, const char *format, va_list args)
{
    int len;
    int i;
    char *str;
    char *s;
    int *ip;

    int flags; // flags to number()

    int field_width; // width of output field    输出结果宽度
    int precision;   // min. # of digits for integers; max number of chars for from string
                     //输出精度，确定小数点后多少位（虽然没有）和字符串长度

    for (str = buff; *format; ++format)
    {
        if (*format != '%')
        {
            *str++ = *format;
            continue;
        }

        flags = 0; //*format = '%'
    repeat:
        ++format; // this also skips first '%' ++format跳过'%'
        switch (*format)
        {
        case '-':
            flags |= LEFT; //输出宽度为4，数据为16 ，输出结果为“16  ”（补上俩空格）
            goto repeat;
        case '+':
            flags |= PLUS;
            goto repeat;
        case ' ':
            flags |= SPACE;
            goto repeat;
        case '#':
            flags |= SPECIAL;
            goto repeat;
        case '0':
            flags |= ZEROPAD;
            goto repeat;
        }
        //    -        结果左对齐，右边填空格
        //    +        输出符号(正号或负号)
        //    空格      输出值为正时冠以空格，为负时冠以负号
        //    #        对c、s、d、u类无影响；
        //             对o类，在输出时加前缀o；
        //             对x类，在输出时加前缀0x；
        //             对e、g、f 类当结果有小数时才给出小数点。
        //    0        printf("%04d", 16);输出数据0016，宽度为4

        // get field width
        field_width = -1; //
        if (is_digit(*format))
        {                                     //例如%15d，指定输出宽度为15,用空格来补
            field_width = skip_atoi(&format); //例如%010，skip_atoi返回10，定义输出数据宽度
        }
        else if (*format == '*')
        { //例如printf("%*d", 4, 16); 指定输出宽度为4，不够用空格补
            // it's the next argument
            field_width = va_arg(args, int);
            if (field_width < 0)
            { //如果printf("%*d", -7, 16);那么那个负号就相当于指定左对齐'-',然后7表示输出宽度为7，用空格补
                field_width = -field_width;
                flags |= LEFT;
            }
        }

        // get the precision
        precision = -1; //此处的precision主要是用于字符串，不用于小数点后几位，因为没有
        if (*format == '.')
        {             //%5.4lf指定输出宽度为5，精度为4，如果数据实际长度超过5（123.1234567）
            ++format; //故应该按实际位数输出，小数位数超过4位部分被截去“123.1234”
            if (is_digit(*format))
            {
                precision = skip_atoi(&format);
            }
            else if (*format == '*')
            { //根据传入实参指定精度
                // it's the next argument
                precision = va_arg(args, int);
            }
            if (precision < 0)
            {
                precision = 0;
            }
        }

        // get the conversion qualifier
        //int qualifier = -1;    // 'h', 'l', or 'L' for integer fields
        if (*format == 'h' || *format == 'l' || *format == 'L')
        { // %ld   表示输出long整数
            //qualifier = *format;                                    // %lf   表示输出double浮点数
            ++format;
        }

        switch (*format)
        {
        case 'c': //字符
            if (!(flags & LEFT))
            { //没有LEFT，最后输出数据
                while (--field_width > 0)
                {
                    *str++ = ' ';
                }
            }
            *str++ = (unsigned char)va_arg(args, int);
            while (--field_width > 0)
            { //有LEFT，无需else，因为如果有LEFT，上面已将field_width减成0
                *str++ = ' ';
            }
            break;

        case 's': //字符串
            s = va_arg(args, char *);
            len = strlen(s); //根据精度来确定输出字符串长度
            if (precision < 0)
            {
                precision = len;
            }
            else if (len > precision)
            {
                len = precision;
            }

            if (!(flags & LEFT))
            { //没有LEFT，最后输出数据
                while (len < field_width--)
                {
                    *str++ = ' ';
                }
            }
            for (i = 0; i < len; ++i)
            {
                *str++ = *s++;
            }
            while (len < field_width--)
            { //补齐到宽度
                *str++ = ' ';
            }
            break;

        case 'o': //八进制整数
            str = number(str, va_arg(args, unsigned long), 8,
                         field_width, precision, flags);
            break;

        case 'p': //%p输出指针的值
            if (field_width == -1)
            {
                field_width = 8;
                flags |= ZEROPAD;
            }
            str = number(str, (unsigned long)va_arg(args, void *), 16,
                         field_width, precision, flags);
            break;

        case 'x':           //%x, %X无符号以十六进制表示的整数，%x：16进制中为：abcdef，%x：ABCDEF
            flags |= SMALL; //没有break呦！！！
        case 'X':
            str = number(str, va_arg(args, unsigned long), 16,
                         field_width, precision, flags);
            break;

        case 'd':
        case 'i':
            flags |= SIGN; //%d，%i加上十进制符号整数
        case 'u':          // %u十进制无符号整数
            str = number(str, va_arg(args, unsigned long), 10,
                         field_width, precision, flags);
            break;
        case 'b': //实际上printf不提供输出二进制
            str = number(str, va_arg(args, unsigned long), 2,
                         field_width, precision, flags);
            break;

        case 'n':
            ip = va_arg(args, int *);
            *ip = (str - buff); //记录输出的数据长度
            break;

        default:
            if (*format != '%')
                *str++ = '%';
            if (*format)
            {
                *str++ = *format; //比如像%%，第一个if不进，进第二个加入%，其他的%w，w ！= %，str加入%，w进第二个if，str加入w
            }
            else
            { //没想到特殊情况=_=
                --format;
            }
            break;
        }
    }
    *str = '\0';

    return (str - buff); //输出结果长度
}