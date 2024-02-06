RED				=	\x1B[31m
GRN				=	\x1B[32m
YEL				=	\x1B[33m
BLU				=	\x1B[34m
MAG				=	\x1B[35m
CYN				=	\x1B[36m
WHT				=	\x1B[37m
RESET			=	\x1B[0m
CLE 			=	\e[1;1H\e[2J

NAME			=	Cub3D

LIBFT			=	libft.a
LIBFT_DIR		=	lib/lib_ft/

PARSE_LIB		=	parsing.a
PARSE_DIR		=	parsing/

RENDER_LIB		=	render.a
RENDER_DIR		=	render/

MLX_LIB		=	libmlx.a
MLX_DIR		=	lib/minilibx_opengl_20191021/

# Compiler and flags
CC				=	gcc
CFLAGS			=	-Wall -Werror -Wextra -g
#-fsanitize=address
RM				=	rm -f

# Sources are all .c files
SRCS	=	main.c

OBJS	=	$(SRCS:.c=.o)

%.o: %.c
	$(CC) -Wall -Wextra -Werror -I/usr/include -Imlx_linux -O3 -c $< -o $@


USER = $(shell whoami)

all: $(NAME)
	

$(NAME): $(OBJS)
	$(CC) $(OBJS) -Lmlx_linux -lmlx_Linux -L/usr/lib -Imlx_linux -lXext -lX11 -lm -lz -o $(NAME)







#https://github.com/sm222/C_tools

# Removes objects
clean:
	@$(RM) $(OBJS)
	@echo $(shell clear)
	@printf "$(GRN)clean *.o$(RESET)\n"
	@rm -fr Cub3D.dSYM

# Removes objects and executables
fclean: clean
	@$(RM) $(NAME)
	@echo $(shell clear)
	@printf "$(GRN)clean all$(RESET)\n"

run: all
	@./$(NAME)

mc: all clean

re: fclean all

cp:
	cp supp.txt /tmp

norm:
	norminette *.c parsing include lib/lib_ft

.PHONY: all libft run mc render
