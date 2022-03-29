##
## EPITECH PROJECT, 2021
## projectname
## File description:
## Makefile
##

SRC			=	src/project.c

MAIN		= 	src/main.c

OBJ			=	$(SRC:.c=.o)

OBJ_M		=	$(MAIN:.c=.o)

NAME		=	project
INC			=	include/
LIBINC		=	lib/my/include/

TEST		=	unit_tests
TESTS		=	tests/test_project.c

CC			=	gcc
RM			=	rm -f

CFLAGS		=	-Wall -Wextra -Wpedantic
CPPFLAGS	=	-iquote $(INC)
TESTFLAGS	=	--coverage -lcriterion
LDLIBS		=	-lmy
LDFLAGS		=	-L lib/my/

all: $(NAME)

$(NAME): $(OBJ) $(OBJ_M)
	make -C lib/my/
	$(CC) -o $(NAME) $(OBJ) $(OBJ_M) $(LDLIBS) $(LDFLAGS)

clean:
	$(RM) $(OBJ)
	$(RM) *.gcda
	$(RM) *.gcno
	make clean -C lib/my/

fclean:	clean
	$(RM) $(NAME)
	$(RM) $(TEST)
	make fclean -C lib/my/

re:	fclean all
	make re -C lib/my/

tests_run: $(OBJ)
	$(RM) *.gcda
	$(RM) *.gcno
	make -C lib/my/
	$(CC) -o $(TEST) $(OBJ) $(TESTS) $(TESTFLAGS)
	./$(TEST)
