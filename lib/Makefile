NAME = libasm.so

SRC = 	strlen.asm \
	strchr.asm \
	memset.asm \
	memcpy.asm \
	strcmp.asm \
	strncmp.asm \
	memmove.asm \
	index.asm \
	rindex.asm \
	strstr.asm \
	strpbrk.asm \
	strcspn.asm \
	strcasecmp.asm

CASM = nasm -f Elf64 -g

RM = rm -f

OBJ = $(SRC:.asm=.o)

all: $(NAME)

$(NAME):        $(OBJ)
	gcc -shared $(OBJ) -o $(NAME) -fPIC

clean:
	$(RM) $(OBJ)
	$(RM) *~

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re 

%.o: %.asm
	$(CASM) $<
