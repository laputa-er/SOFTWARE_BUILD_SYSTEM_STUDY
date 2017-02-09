################
# 顶层的 makefile
################
.PHONY: all clean

# 必须以正确的顺序对其它 makefile 进行相应的迭代式调用
all:
	$(MAKE) -C libmath
	$(MAKE) -C libprint
	$(MAKE) -C calc
clean:
	rm -rf {calc,libmath,libprint}/*{d,o,a}
