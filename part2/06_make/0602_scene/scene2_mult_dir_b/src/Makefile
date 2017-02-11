################
# 顶层的 makefile
################
.PHONY: all clean

# 必须以正确的顺序对其它 makefile 进行相应的迭代式调用
all:
	$(MAKE) -C libmath
	$(MAKE) -C libprint
	$(MAKE) -C calc

.PHONY: clean
clean:
	$(MAKE) -C libmath clean
	$(MAKE) -C libprint clean
	$(MAKE) -C calc clean
