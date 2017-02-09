# 使用 define 定义一个 shell 命令的封装序列 start-banner
define start-banner
	@echo ==============
	@echo Starting build
	@echo ==============
endif

.PHONY: all
all:
	# 调用 start-banner
	$(start-banner)
	$(MAKE) -C lib1