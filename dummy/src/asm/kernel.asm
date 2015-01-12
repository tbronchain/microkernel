;;;
;;; kernel.asm
;;; ASM bootstrap file for micro-kernel
;;; @author: Thibault BRONCHAIN
;;;

bits 32                         ;NASM instruction 32bits CPU

section .text                   ;Code starts here
        align 4                 ;32bits values
        dd 0x1BADB002           ;Bootloader Magic number
        dd 0x00                 ;Bootloader Flags
        dd -(0x1BADB002+0x00)   ;Bootloader Checksum (Opposite of M+F => M+F+C=0)

global kentry                   ;Define being as entry point
extern kmain                    ;`main` function definition, in external file

kentry:                         ;Entry point section
        cli                     ;Blocks interrupts to avoid awaking from hlt
        call kmain              ;Call `main` function
        hlt                     ;Halt CPU
