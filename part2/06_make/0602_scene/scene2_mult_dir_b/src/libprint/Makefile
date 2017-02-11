SRCS =banner.c center.c normal.c
LIB = libprint.a
CC = gcc
CFLAGS = -g
OBJS = $(SRCS:.c=.o)

$(LIB): $(OBJS)
	$(AR) -rs $(LIB) $(OBJS)

# 将包含依赖信息的 .d 文件都包含进来
-include $(SRCS:.c=.d)

# 所有 .d 文件都会匹配到这个规则来生成
%.d: %.c
	$(CC) -MM $(CFLAGS) $< | sed 's#\(.*\)\.o: #\1.o \1\.d: #g' > $@
.PHONY: clean
clean:
	rm -f $(OBJS) $(LIB) *.d