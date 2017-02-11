SRCS := add.c calc.c mult.c sub.c
PROG := calculator
CFLAGS := -g

# 提供了 PLATFORM 默认值，用户不在命令行指定的话，默认 i386(其实也可以用 = ，因为在命令行定义的任何变量都会自动覆盖 make file中的值)
PLATFORM ?= i386

# 有效平台列表
VALID_PLATFORMS := i386 powerpc alpha

# 对 $(PLATFORM) 的值的有效性进行检验，如果不在有效平台列表中，则显示相应的错误提示
ifeq ($(filter $(PLATFORM), $(VALID_PLATFORMS)),)
	$(error Invalid PLATFORM: $(PLATFORM))
endif

# 将不同架构平台的目标文件放在与架构关联的目录中
OBJDIR := obj/$(PLATFORM)
# 确保对应架构的目标文件的存放目录存在
$(shell mkdir -p $(OBJDIR))

# 使用合适的编译器
CC := gcc-$(PLATFORM)
# 目标文件清单
OBJS := $(addprefix $(OBJDIR)/, $(SRCS:.c=.o))

$(OBJDIR)/$(PROG): $(OBJS)
	gcc $(CFLAGS) -o $@ $^

$(OBJDIR)/%o: %c
	gcc -c -o $@ $<

$(OBJS): numbers.h

.PHONY = clean
clean:
	rm -rf obj