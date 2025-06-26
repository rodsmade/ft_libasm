NAME = libasm.a

SRCS = hello.s ft_strcmp.s ft_strcpy.s ft_strlen.s ft_write.s
OBJS = $(SRCS:.s=.o)

TEST_DIR = test
TEST_SRCS = $(wildcard $(TEST_DIR)/*.c)
TEST_OBJS = $(TEST_SRCS:.c=.o)
TEST_BIN = test_bin.out

CC = cc
CFLAGS = -Wall -Wextra -Werror

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $@ $^

%.o: %.s
	nasm -f elf64 $< -o $@

$(TEST_BIN): $(NAME) $(TEST_OBJS)
	$(CC) $(CFLAGS) -pie $(TEST_OBJS) -L. -lasm -o $@

test: $(TEST_BIN)
	./$(TEST_BIN)

clean:
	rm -f $(OBJS) $(TEST_OBJS)

fclean: clean
	rm -f $(NAME) $(TEST_BIN)

re: fclean all

.PHONY: all clean fclean re test
