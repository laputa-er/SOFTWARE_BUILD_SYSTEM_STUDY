SRCS := add.c calc.c mult.c sub.c
PROG := calculator
CC := gcc

# 在变量定义中使用 $(warning) 函数，结合延迟赋值 = ，当系统调用该变量时显示适当消息
CFLAGS = $(warning Accessing CFLAGS) -g # CFLAGS := -g

# 规则下的 shell 列表是调用 $(SHELL)变量表示的 shell 程序执行的，因此任何规则下的 shell 列表的执行都会触发打印信息
SHELL = $(warning Target is $@) /bin/sh

OBJS := $(SRCS:.c=.o)

$(PROG):$(OBJS)
	$(CC) $(CFLAGS) -o $@ $^
$(OBJS): numbers.h
clean:
	rm $(PROG) $(OBJS) $(SRCS:.c=.d)