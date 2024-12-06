# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ilevy <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/16 15:18:29 by ilevy             #+#    #+#              #
#    Updated: 2024/12/06 18:39:30 by ilevy            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#General purpose

NAME:= libftprintf.a
CC := gcc
CFLAGS := -Wall -Wextra -Werror -I
INCLUDE:= h_files/
SRC_DIR:= c_files/
OBJ_DIR:= o_files/
LIBFT:= libft

#Source_files in c_files.

SRC_FILES:= ft_printf.c ft_printhexa.c ft_printbasic.c ft_printpointer.c ft_printunsigned.c

#Source_files and Object_files relative to Makefile

SRC:= $(addprefix $(SRC_DIR), $(SRC_FILES))
OBJ:= $(addprefix $(OBJ_DIR), $(SRC_FILES:.c=.o))

#Orders

all:	$(NAME)

objdir_mk:
	@mkdir -p $(OBJ_DIR)

$(NAME):	$(OBJ)
	@make -C $(LIBFT)
	@cp $(LIBFT)/libft.a .
	@mv libft.a $(NAME)
	@ar -rcs $(NAME) $(OBJ)
	@echo "ft_printf has been compiled!"

$(OBJ_DIR)%.o:	$(SRC_DIR)%.c | objdir_mk
	@$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@
	@echo "Compiling the printf files!"

clean:
	@rm -rf $(OBJ_DIR)
	@make clean -C $(LIBFT)
	@echo "printf.o files have been cleaned!"

fclean:	clean
	@rm -rf $(NAME)
	@rm -rf $(LIBFT)/libft.a
	@echo "LibftPrintf.a and libft.a have been cleaned!"

re:	fclean all
	@echo "Let's try one more time!"

.PHONY: re fclean all clean
