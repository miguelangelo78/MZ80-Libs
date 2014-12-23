#ifndef __SDC51_LIMITS_H
#define __SDC51_LIMITS_H 1

#define CHAR_BIT      8    /* bits in a char */
#define SCHAR_MAX   127
#define SCHAR_MIN  -128
#define UCHAR_MAX   0xff
#ifdef __SDCC_CHAR_UNSIGNED
#define CHAR_MAX    UCHAR_MAX
#define CHAR_MIN    0
#else
#define CHAR_MAX    SCHAR_MAX
#define CHAR_MIN    SCHAR_MIN
#endif
#define MB_LEN_MAX  1
#define INT_MIN    -32768
#define INT_MAX     32767
#define SHRT_MAX    INT_MAX
#define SHRT_MIN    INT_MIN
#define UINT_MAX    0xffff
#define UINT_MIN    0
#define USHRT_MAX   UINT_MAX
#define USHRT_MIN   UINT_MIN
#define LONG_MIN    (-2147483647L-1)
#define LONG_MAX    2147483647L
#define ULONG_MAX   0xffffffff
#define ULONG_MIN   0
#define LLONG_MIN   (-9223372036854775807LL-1)
#define LLONG_MAX   9223372036854775807LL
#define ULLONG_MAX  18446744073709551615ULL

#endif






