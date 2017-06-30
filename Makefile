##
## Makefile for MAkefile in /home/moutou_m/asm/asm_minilibc/moutou_m
## 
## Made by moutoum
## Login   <maxence.moutoussamy@epitech.eu>
## 
## Started on  Wed Mar  1 09:13:18 2017 moutoum
## Last update Tue Mar 14 12:21:04 2017 moutoum
##

NAME	=	mouli

SRC	=	main.c

OBJ	=	$(SRC:.c=.o)

RM 	=	rm -f

all: $(NAME)

test:	$(NAME) $(OBJ)
	gcc -o $(NAME) $(OBJ)	

$(NAME):
	make -C lib/
	mv lib/libasm.so .

clean:
	make clean -C lib/
	$(RM) $(OBJ)

fclean: clean
	make fclean -C lib/
	$(RM) libasm.so
	$(RM) $(NAME)

re: fclean all

.PHONY: all $(NAME) clean fclean re
