##
## Makefile
## Makefile for micro-kernel
## @author: Thibault BRONCHAIN
##


NAME	=	mkernel

CC	=	gcc
AC	=	nasm
LD	=	ld

CDIR	=	src/c/
ADIR	=	src/asm/
SDIR	=	scripts/

CSRC	=	$(CDIR)/kernel.c
ASRC	=	$(ADIR)/kernel.asm
LDSRC	=	$(SDIR)/kernel.ld

CFLAGS	+=	-m32 -W -Wall -ansi -pedantic
AFLAGS	+=	-f elf32
LDFLAGS	+=	-m elf_i386

OBJ	=	$(ASRC:.asm=.o) \
		$(CSRC:.c=.o)

RM	=	rm -rf
CLEAN	=	rm -rf `find . \( -name '*~' -or -name '.*~' -or -name '.\#*\#' -or -name '\#*\#' \)`


$(NAME):	$(OBJ)
		$(LD) $(LDFLAGS) -T $(LDSRC) -o bin/$(NAME) $(OBJ)

all:	$(NAME)

clean:
	$(CLEAN)
	$(RM) $(OBJ)

fclean: clean
	$(RM) bin/$(NAME)

re:	fclean all

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@
$(ADIR)/kernel.o: $(ADIR)/kernel.asm
	$(AC) $(AFLAGS) $< -o $@

.PHONY:	all clean fclean re $(NAME)
