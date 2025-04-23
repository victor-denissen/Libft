# === Config ===
NAME     = libft.a
SRC_DIRS = src/allocation \
           src/is \
           src/linked/list \
           src/mem \
           src/put \
           src/string \
           src/utils
OBJ_DIR  = obj
INC_DIR  = header

SRCS = $(foreach dir,$(SRC_DIRS),$(wildcard $(dir)/*.c))
OBJS = $(SRCS:%.c=$(OBJ_DIR)/%.o)

CC      = cc
CFLAGS  = -Wall -Wextra -Werror -I$(INC_DIR)
AR      = ar rcs

# === Default rule ===
all: $(NAME)

$(NAME): $(OBJS)
	$(AR) $@ $^

# === Compile rule, with mkdir for nested obj paths ===
$(OBJ_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

# === Debug rule ===
debug: CFLAGS += -g
debug: re

# === Cleaning ===
clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -f $(NAME)

re: fclean all
