
# 静态库
LIBMATH := libmath/libmath.a
LIBPRINT := libprint/libprint.a

# 源文件
CALC_LIST := calc/calc.c
LIBPRINT_LIST := libprint/banner.c libprint/center.c libprint/normal.c
LIBMATH_LIST := libmath/clock.c libmath/letter.c libmath/numbers.c

# 目标文件
CALC_OBJS := $(CALC_LIST:.c=.o)
LIBMATH_OBJS := $(LIBMATH_LIST:.c=.o)
LIBPRINT_OBJS := $(LIBPRINT_LIST:.c=.o)

# 可执行程序
PROG := calculator
CC := gcc
C_FLAGS := -g
LIB_COMMAND := ar -rs

$(PROG):$(CALC_OBJS) $(LIBMATH) $(LIBPRINT)
	$(CC) $(CFLAGS) -o $@ $^
$(LIBMATH):$(LIBMATH_OBJS)
	$(LIB_COMMAND) $@ $^
$(LIBPRINT):$(LIBPRINT_OBJS)
	$(LIB_COMMAND) $@ $^

%.o:%.c
	$(CC) -c -o $@ $^
clean:
	rm $(CALC_OBJS) $(LIBMATH_OBJS) $(LIBPRINT_OBJS) $(PROG)


