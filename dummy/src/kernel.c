/*
**
** kernel.c
** C Entry-point file for micro-kernel
** @author: Thibault BRONCHAIN
**
*/

// V MEM Default size
#define COL 80
#define ROW 25

// Clear video memory
void    vclear() {
  // Video memory starting point
  char  *vptr = (char*)0xb8000;
  // Incrementor
  int   i = 0;

  // Clear all
  while (i < COL*ROW*2) {
    // Bit1 (ascii char): Blank char
    vptr[i++] = ' ';
    // Bit2 (`attribute-byte`): Light grey blink crusor
    vptr[i++] = 0x07;
  }
}

// Print text
char    *printk(int color, char *str, char *vptr) {
  while (*str != '\0') {
    (*vptr)++ = (*str)++;
    (*vptr)++ = color;
  }
  return (vptr);
}

void    kmain(void) {
  // String to print
  char  *str = "Hello World!\n";
  // Video memory starting point
  char  *vptr = (char*)0xb8000;

  vclear();
  vptr = printk(0x10, str, vptr)
}
