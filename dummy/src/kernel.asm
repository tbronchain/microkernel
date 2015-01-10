;;;
;;; kernel.asm
;;; ASM bootstrap file for micro-kernel
;;; @author: Thibault BRONCHAIN
;;;

bits 32                         ;NASM instruction 32bits CPU

section .text                   ;Code starts here

global kentry                   ;Define being as entry point
extern kmain                    ;`main` function definition, in external file

kentry:                         ;Entry point section
        cli                     ;Blocks interrupts to avoid awaking from hlt
        call kmain              ;Call `main` function
        hlt                     ;Halt CPU
