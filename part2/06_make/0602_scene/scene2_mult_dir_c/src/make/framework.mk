#################################################
# 用来遍历构造树并从每个 Files.mk 片段收集信息的主要算法
# 注意，下面的程序通过递归调用这个框架本身，完成了对所有目
# 录下的 Files.mk 文件的处理工作。
#################################################

#
# 出于调试用途创建的变量，除了将它的信息输出来调试，这个变量没有其它任何用途。
# 赋值等号左边，变量名包含了一个变量，因此它是为所访问的每个目录分别创建一个变量。
# 赋值等号右边，取用 SRC 变量的当前值，并将目录作为前缀驾到该列表的每个元素中。
# 所以，左边这个新变量的值是当前目录下带上了路径的，所有源文件的列表。
# 举例来说，当遍历到 libraries/math 这个目录时，这行代码实际等价于
# srcs-libraries/math/ := libraries/math/add.c libraries/math/mult.c libraries/math/sub.c 
#
srcs-$(_curdir) := $(addprefix $(_curdir),$(SRC))

# 出于调试用途创建的变量，除了将它的信息输出来调试，这个变量没有其它任何用途。
# 将当前目录的 CFLAGS 定义值保存到与目录相关的 cflags-* 变量中。
#
cflags-$(_curdir) := $(CFLAGS)

#
# 将当前目录作为前缀加到 SUBDIRS 中的每个元素，并追加到 _subdirs 列表后面
#
_subdirs := $(_subdirs) $(addprefix $(_curdir), $(SUBDIRS))

# 如果存在子目录，就开始对源码目录树进行递归遍历。
ifneq ($(words $(_subdirs)), 0)
	# 取出当前子目录列表中的第一个目录
	_curdir := $(firstword $(_subdirs))/
	# 从队列中删除第一个元素，和上一步组合在一起，完成一次出队
	_subdirs := $(wordlist 2, $(words $(_subdirs)), $(_subdirs))
	# 将下面几个变量设置为空，防止他们的值漏到后序的计算中
	SUBDIRS :=
	SRC :=
	CFLAGS :=
	# 包含当前目录中 Files.mk 片段的内容
	include $(_curdir)Files.mk
	# 重复循环整个框架，存储 SRC 和 CFLAGS 的值，然后变量 SUBDIRS 中列出的任何其它目录。
	include $(FRAMEWORK)
endif


