NAME = libasm.a

SRC_DIR = src
OBJ_DIR = obj
TEST_DIR = test

SRCS = \
	$(SRC_DIR)/hello.s \
	$(SRC_DIR)/ft_read.s \
	$(SRC_DIR)/ft_strcmp.s \
	$(SRC_DIR)/ft_strcpy.s \
	$(SRC_DIR)/ft_strlen.s \
	$(SRC_DIR)/ft_write.s

OBJS = \
	$(OBJ_DIR)/hello.o \
	$(OBJ_DIR)/ft_read.o \
	$(OBJ_DIR)/ft_strcmp.o \
	$(OBJ_DIR)/ft_strcpy.o \
	$(OBJ_DIR)/ft_strlen.o \
	$(OBJ_DIR)/ft_write.o

TEST_SRCS = \
	$(TEST_DIR)/main.c \
	$(TEST_DIR)/test_read.c \
	$(TEST_DIR)/test_strcmp.c \
	$(TEST_DIR)/test_strcpy.c \
	$(TEST_DIR)/test_strlen.c \
	$(TEST_DIR)/test_write.c \
	$(TEST_DIR)/test_helpers.c

TEST_OBJS = \
	$(TEST_DIR)/main.o \
	$(TEST_DIR)/test_read.o \
	$(TEST_DIR)/test_strcmp.o \
	$(TEST_DIR)/test_strcpy.o \
	$(TEST_DIR)/test_strlen.o \
	$(TEST_DIR)/test_write.o \
	$(TEST_DIR)/test_helpers.o

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
	$(CC) $(CFLAGS) -c $< -o $@

# Link test binary
$(TEST_BIN): $(NAME) $(TEST_OBJS)
	$(CC) $(CFLAGS) -pie $(TEST_OBJS) -L. -lasm -o $@

test: $(TEST_BIN)
	./$(TEST_BIN)

clean:
	rm -f $(TEST_OBJS)
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -f $(NAME) $(TEST_BIN)

re: fclean all

.PHONY: all clean fclean re test
