############################################################
# 1. 一份源文件清单，以 .math 文本格式保存，由 mathcomp 编译器读取。
# 2. 一套 GNU Make 规则，其中描述了如何把 .math 文件编译成 .c 文件。
# 3. 一种新的依赖关系文件（后缀名为 .dl），其中记录了 .math 文件与其所依赖的 .mathinc 文件之间的关系。
############################################################

# mathcomp 的绝对路径（不依赖 $PATH 变量是否正确设置）
MATHCOMP := /tools/bin/mathcomp
CC := gcc

# .math 源文件清单
MATHSRC := equtions.math

CSRC := calculator.c
PROG := calculator
OBJS := $(CSRC:.c=.o) $(MATHSRC:.math=.o)
$(PROG): $(OBJS)
	$(CC) -o $@ $^

# 生成 .c 文件的依赖关系规则
%.c: %.math
	$(MATHCOMP) -c $<

-include $(CSRC:.c=.d)

# 引入.math 对 .mathinc 的依赖
-include $(MATHSRC:.math=.dl)

%.d: %c
	@$(CC) -MM $(CPPFLAGS) $< | sed 's#\(.*\)\.o: #\1.o \1.d: #g' > $@

# 通过生成所包含的其它片段的情况，实现自动依赖检测
%.dl: %.math
	echo -n "$@ $(*F).c: " > $@; \
	$(MATHCOMP) -d $< >> $@
