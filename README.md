# ft_printf

*Part of the 42 Lisboa common core.*

A reimplementation of the C standard library's `printf`, built as a static library (`libftprintf.a`). It walks the format string, reads the arguments with `<stdarg.h>` variadic macros, and writes each conversion straight to stdout. It returns the number of characters printed, as the original does.

## Supported conversions

| Specifier | Prints |
| --- | --- |
| `%c` | a single character |
| `%s` | a string (`(null)` for `NULL`) |
| `%p` | a pointer address in hex (`0x...`) |
| `%d` / `%i` | a signed decimal integer |
| `%u` | an unsigned decimal integer |
| `%x` / `%X` | an unsigned hex integer, in lower or upper case |
| `%%` | a literal `%` |

## Build

```sh
make        # builds libftprintf.a (and libft)
make clean / fclean / re
```

## Usage

```c
#include "ft_printf.h"

int main(void)
{
    int n = ft_printf("%s is %d years old (%x in hex) at %p\n", "Ada", 36, 36, &n);
    ft_printf("printed %d chars\n", n);
}
```

```sh
cc main.c -Iinclude libftprintf.a -o demo
```

## Layout

| Path | Purpose |
| --- | --- |
| `src/ft_printf.c` | Format-string parser and conversion dispatcher |
| `src/ft_basic.c` | Characters, strings and decimal numbers |
| `src/ft_printhex.c` | Hexadecimal output |
| `src/ft_ptr.c` | Pointer output |
| `libft/` | My libft, which it builds on |
