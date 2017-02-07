SRCS := add.o calc.o mult.o sub.o
PROG := calculator
CC := gcc
CFLAGS := -g
OBJS := $(SRCS:.c = .o)

$(PROG): $(OBJS)
	$(CC) $(CFLAGS) -o  $@ $^
$(OBJS): numbers.h