#!/bin/bash


message=`pwd`
# Setting IFS (input field separator) value as ","
IFS='/'

# Reading the split string into array
read -ra arr <<< "$message"
read -p "Enter main file name: " name
printf "PROJECT = ${arr[-1]}" > Makefile
echo """
CC      = gcc
CFLAGS  = -Wall -Wextra
CFLAGS += -D_XOPEN_SOURCE=500
CFLAGS += -g
SRC=\$(wildcard  \$(DIR)*.c) \$(wildcard  \$(DIR)lib/*.c)
OBJ=\$(SRC:.c=.o)
MAIN=${name}


\$(MAIN): \$(MAIN).o \$(OBJ)
	\$(CC) \$(CFLAGS) -o \$@ \$^
""" >> Makefile
echo """
\%.o: \%.c \%.h
	\$(CC) \$(CFLAGS) -c \$<

clean:
	rm -f \$(OBJ) \$(MAIN)

""" >> Makefile