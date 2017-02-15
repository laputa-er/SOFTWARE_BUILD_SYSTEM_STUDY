#
# 创建静态库
# add_library(<静态库名称>  STATIC <静态库源文件1> <静态库源文件2> ...)
#
add_library(math STATIC add sub mult)

#
# 创建可执行程序
# add_executable(<可执行程序名> )
#
add_executable(calculator calc)

#
# 将上一步生成的可执行程序和静态库链接在一起
#
target_link_libraries (calculator math)
