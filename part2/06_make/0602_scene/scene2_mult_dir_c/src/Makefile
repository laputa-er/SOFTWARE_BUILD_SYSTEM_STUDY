
#
# 待遍历的子目录列表，每在一个 Files.mk 中找到一个 SUBDIRS 变量，就把其包含的子目录信息添加到 _subdirs 内容后面，从而创建一个要访问的目录队列。
# 它的最终值类似下面这样:
# application libraries/math libraries/protocols libraries/sql libraries/widgets
# 路径均相对于 src 目录
#
_subdirs :=

#
# 正在遍历的当前目录
# 随着在构造树中不断遍历，不断从 _subdirs 队列头部取出目录名，_curdir 时刻反映了当前正在遍历的位置。
#
_curdir :=

# 经常会用到这个框架，用变量会更方便
FRAMEWORK := $(CURDIR)/make/framework.mk

#
# 启动真个进程
# 从这个文件中，可以获得 SRC、SUBDIRS 和 CFLAGS 变量的最顶层定义。
# 因为使用的是 include 指令，因此系统仍然使用同一个 make 进程实例。
#
include Files.mk

#
# 这个框架是包含式 make 实现的核心，用来处理 SRC、SUBDIRS 和 CFLAGS 变量的内容，该框架随后继续遍历源树的剩余目录。
# 当这个指令执行完毕时，系统已经把所有目录下的 Files.mk 都处理了一遍。
#
include $(FRAMEWORK)

#
# 为了方便调试，将 GNU Make 所知的全套变量列表（自动保存在 $(.VARIABLES)中）进行处理，
# 并将其中变量名以 srcs- 或 cflags- 开头的变量全部过滤出来。
#
VARS := $(sort $(filter srcs-% cflags-%, $(.VARIABLES)))

# 然后显示到输出信息中。
$(foreach var, $(VARS), $(info $(VAR) = $($var))

.PHONY: all
all:
	@# do nothing

	