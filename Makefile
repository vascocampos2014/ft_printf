# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vaires-m <vaires-m@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/09 13:08:01 by vaires-m          #+#    #+#              #
#    Updated: 2024/09/09 13:08:01 by vaires-m         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

SRC_DIR = src
SOURCES = $(SRC_DIR)/ft_basic.c $(SRC_DIR)/ft_printf.c $(SRC_DIR)/ft_printhex.c $(SRC_DIR)/ft_ptr.c

INCLUDE_DIR = include
OBJ_DIR = obj
OBJ = $(SOURCES:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

CC = cc
FLAGS = -Wall -Wextra -Werror -I$(INCLUDE_DIR)
AR = ar

LIBFT_DIR = ./libft
LIBFT = $(LIBFT_DIR)/libft.a

all: $(LIBFT) $(NAME)

$(NAME): $(OBJ)
	$(AR) -rcs $@ $(OBJ) 

$(LIBFT):
	$(MAKE) -C $(LIBFT_DIR)

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(OBJ_DIR)/%.o : $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(FLAGS) -c $< -o $@

clean: 
	rm -f $(OBJ)
	$(MAKE) clean -C $(LIBFT_DIR)

fclean: clean
	rm -f $(NAME)
	rm -rf $(OBJ_DIR)
	$(MAKE) fclean -C $(LIBFT_DIR)

re:	fclean all

.PHONY: all clean fclean re bonus