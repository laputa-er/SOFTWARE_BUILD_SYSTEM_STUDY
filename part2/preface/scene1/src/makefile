SRCS := add.c calc.c mult.c sub.c
PROG := calculator
CC := gcc
CFLAGS := -g
OBJS := $(SRCS:.c = .o)

$(PROG):$(OBJS)
	$(CC) $(CFLAGS) -o $@ $^
$(OBJS): numbers.h
# 内置规则 --- 通配符规则，所有目标文件的生成都匹配到这条规则
$(OBJS): %.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<
