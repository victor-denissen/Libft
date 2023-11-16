CC = cc
AR = ar
CFLAGS = -Wall -Werror -Wextra
ARFLAGS = -rcs

NAME = libft.a
HEADERS :=	header/libft.h 

SRC :=		src/ft_atoi.c\
			src/ft_bzero.c\
			src/ft_calloc.c\
			src/ft_isalnum.c\
			src/ft_isalpha.c\
			src/ft_isascii.c\
			src/ft_isdigit.c\
			src/ft_isprint.c\
			src/ft_memchr.c\
			src/ft_memcmp.c\
			src/ft_memcpy.c\
			src/ft_memmove.c\
			src/ft_memset.c\
			src/ft_strchr.c\
			src/ft_strdup.c\
			src/ft_strjoin.c\
			src/ft_strlcat.c\
			src/ft_strlcpy.c\
			src/ft_strlen.c\
			src/ft_strncmp.c\
			src/ft_strnstr.c\
			src/ft_strrchr.c\
			src/ft_strtrim.c\
			src/ft_substr.c\
			src/ft_tolower.c\
			src/ft_toupper.c\
			src/ft_split.c\
			src/ft_itoa.c\
			src/ft_strmapi.c\
			src/ft_striteri.c\
			src/ft_putchar_fd.c\
			src/ft_putstr_fd.c\
			src/ft_putendl_fd.c\
			src/ft_putnbr_fd.c\
			src/ft_free_array.c\
			src/ft_strform.c\
			src/ft_realloc.c\
			src/ft_lalloc.c\
			src/ft_lstnew.c\
			src/ft_lstadd_front.c\
			src/ft_lstsize.c\
			src/ft_lstlast.c\
			src/ft_lstadd_back.c\
			src/ft_lstclear.c\
			src/ft_lstdelone.c\
			src/ft_lstiter.c\
			src/ft_lstmap.c\

TOTAL_TASKS:= $(words $(SRC))
CURRENT_TASK:= 0
PROGRESS_FILE:= .progress

UP = \033[A
CLEAR = \003

RED = \033[31m
GREEN = \033[32m
YELLOW = \033[33m
RESET = \033[0m

OBJDIR:=	obj
OBJ :=		$(SRC:%.c=$(OBJDIR)/%.o)
OBJB :=		$(SRCB:%.c=$(OBJDIR)/%.o)

all:		reset_progress $(NAME) .progress

$(NAME):	$(OBJ) $(OBJB) $(HEADERS) $(progress-bar)
				$(AR) $(ARFLAGS) $(NAME) $^
				printf "$(CLEAR)"
				echo -n "$(GREEN)Done$(RESET)"
				$(shell rm -rf $(PROGRESS_FILE))

test:		$(OBJ) $(OBJB) $(HEADERS)
				echo "compiling test"
				$(CC) $(CFLAGS) $(OBJ) $(OBJB) -o $@
				echo "running test"
				./$@

$(OBJDIR)/%.o: %.c $(HEADERS) .progress
				$(MAKE) update-progress
				mkdir -p $(@D) 
				$(CC) $(CFLAGS) -c $< -o $@
				echo  " compiling $@"
				printf "$(UP)$(CLEAR)"

clean:
				rm -rf $(OBJDIR)
				echo "removing objects from $(NAME)"

fclean: 	clean
				rm -f $(NAME)
				echo "removing $(NAME)"

re: fclean all

bonus: $(OBJB)
	$(AR) $(ARFLAGS) $(NAME) $^

progress-bar:
	$(eval CURRENT_TASK=$(shell cat $(PROGRESS_FILE)))
	echo -n "["
	for i in $(shell seq 1 $(CURRENT_TASK)); do \
        echo -n "="; \
    done
	for i in $(shell seq $(CURRENT_TASK) $(TOTAL_TASKS)); do \
        echo -n " "; \
    done
	echo -n "]"
	echo -n " ($(CURRENT_TASK)/$(TOTAL_TASKS))"

update-progress:
	$(eval CURRENT_TASK=$(shell cat $(PROGRESS_FILE)))
	$(eval CURRENT_TASK=$(shell echo $$(($(CURRENT_TASK)+1))))
	echo "$(CURRENT_TASK)" > $(PROGRESS_FILE)
	$(MAKE) progress-bar

reset_progress:
	echo "0" > $(PROGRESS_FILE)
	echo "$(GREEN)Compiling libft.a$(RESET)"


.SILENT:
.PHONY: all clean fclean re test progress-bar update-progress
