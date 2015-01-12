/*
**
** kernel.ld
** ld linking script for micro-kernel
** @author: Thibault BRONCHAIN
**
*/

OUTPUT_FORMAT(elf32-i386)       /* Output binary format */
OUTPUT_ARCH("i386")             /* Output architecture */
ENTRY(kentry)                   /* Entry point name */

/*
PHDRS {
      default PT_LOAD;
}
*/

SECTIONS {
    . = 0x100000;               /* Kernel start address */
    .text : {
          _stext = .;           /* Address variable */
          *(.multiboot)
                *(.text)        /* aggregate .text section from object files */
                *(.gnu.linkonce.t*)
          _etext = .;
    } :default
/*    .data : { *(.data) }
    .bss  : { *(.bss)  } */
}
