NAME = libasm.a

SRC_DIR = src
OBJ_DIR = obj
TEST_DIR = test

ASM_NAMES = \
	hello \
	ft_read \
	ft_strcmp \
	ft_strcpy \
	ft_strdup \
	ft_strlen \
	ft_write

SRCS = $(addprefix $(SRC_DIR)/, $(addsuffix .s, $(ASM_NAMES)))
OBJS = $(addprefix $(OBJ_DIR)/, $(addsuffix .o, $(ASM_NAMES)))

TEST_NAMES = \
	test_helpers \
	test_read \
	test_strcmp \
	test_strcpy \
	test_strdup \
	test_strlen \
	test_write

TEST_SRCS = $(addprefix $(TEST_DIR)/, $(addsuffix .c, $(TEST_NAMES)))
TEST_OBJS = $(addprefix $(TEST_DIR)/, $(addsuffix .o, $(TEST_NAMES)))

TEST_BIN = test_bin.out

CC = cc
CFLAGS = -Wall -Wextra -Werror

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $@ $^

# Compile assembly sources into objs/*.o
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
	@mkdir -p $(OBJ_DIR)
	nasm -f elf64 $< -o $@

# Compile C test sources normally
$(TEST_DIR)/%.o: $(TEST_DIR)/%.c
	$(CC) $(CFLAGS) $< -c -o $@

# Link test binary
$(TEST_BIN): $(NAME) $(TEST_OBJS) $(TEST_DIR)/main.c
	$(CC) $(CFLAGS) $(TEST_DIR)/main.c $(TEST_OBJS) -L. -lasm -o $@

test: $(TEST_BIN)
	./$(TEST_BIN)

clean:
	rm -f $(TEST_OBJS)
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -f $(NAME) $(TEST_BIN)

re: fclean all

.PHONY: all clean fclean re test
