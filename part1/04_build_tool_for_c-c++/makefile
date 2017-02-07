SRCS = main.c hello.c
OBJS = $(SRCS:.c=.o)
PROG = demo
CC = gcc
CFLAGS = -c


$(PROG): $(OBJS)
	$(CC) -o $@ $^
main.o: main.c hello.h
	$(CC) $(CFLAGS)  main.c
hello.o: hello.c hello.h
	$(CC) $(CFLAGS) hello.c
clean:
	rm -f $(OBJS) $(PROG)