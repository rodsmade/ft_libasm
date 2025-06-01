NAME = libasm.a

SRCS = hello.s ft_write.s
OBJS = $(SRCS:.s=.o)

TEST_DIR = test
TEST_SRC = $(TEST_DIR)/main.c
TEST_BIN = test_bin

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

%.o: %.s
	nasm -f elf64 $< -o $@

$(TEST_BIN): $(NAME) $(TEST_SRC)
	$(CC) $(TEST_SRC) -L. -lasm -o $@

test: $(TEST_BIN)
	./$(TEST_BIN)

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re test
