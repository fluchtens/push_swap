# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fluchten <fluchten@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/16 10:39:27 by fluchten          #+#    #+#              #
#    Updated: 2023/01/23 12:42:34 by fluchten         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = push_swap

CC = gcc
CFLAGS = -Wall -Wextra -Werror
RM = rm -rf

INC_DIR = -I includes

SRCS_DIR = srcs
SRCS =	operations/push.c \
		operations/reverse_rotate.c \
		operations/rotate.c \
		operations/swap.c \
		sort/sort_big.c \
		sort/sort_little.c \
		sort/sort.c \
		stack/stack_check.c \
		stack/stack_init.c \
		stack/stack_utils.c \
		utils/ft_atoi.c \
		utils/ft_split.c \
		utils/utils.c \
		main.c

OBJS_DIR = objs
OBJS = $(addprefix ${OBJS_DIR}/, ${SRCS:%.c=%.o})

all: ${NAME}

${OBJS_DIR}/%.o: ${SRCS_DIR}/%.c
	@mkdir -p ${@D}
	${CC} ${CFLAGS} ${INC_DIR} -c $< -o $@

${NAME}: ${OBJS}
	${CC} ${CFLAGS} ${OBJS} -o ${NAME}

clean:
	${RM} ${OBJS_DIR}

fclean:	clean
	${RM} ${NAME}

re: fclean all

.PHONY: all clean fclean re