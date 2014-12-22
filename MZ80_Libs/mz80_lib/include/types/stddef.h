#ifndef __SDCC_STDDEF_H
#define __SDCC_STDDEF_H 1

#ifndef NULL
  #define NULL (void *)0
#endif

#ifndef __PTRDIFF_T_DEFINED
#define __PTRDIFF_T_DEFINED
#if defined (__SDCC_mcs51) || defined (__SDCC_ds390)
  typedef long int ptrdiff_t;
#else
  typedef int ptrdiff_t;
#endif
#endif

#ifndef __SIZE_T_DEFINED
#define __SIZE_T_DEFINED
  typedef unsigned int size_t;
#endif

#if __STDC_VERSION__ >= 201112L
  typedef unsigned char max_align_t;
#endif

#ifndef __WCHAR_T_DEFINED
#define __WCHAR_T_DEFINED
  typedef char wchar_t;
#endif

/* Bounds-checking interfaces from annex K of the C11 standard. */
#if defined (__STDC_WANT_LIB_EXT1__) && __STDC_WANT_LIB_EXT1__

#ifndef __RSIZE_T_DEFINED
#define __RSIZE_T_DEFINED
typedef size_t rsize_t;
#endif

#ifndef __ERRNO_T_DEFINED
#define __ERRNO_T_DEFINED
typedef int errno_t;
#endif

#endif

#define offsetof(s, m) __builtin_offsetof (s, m)

#endif

