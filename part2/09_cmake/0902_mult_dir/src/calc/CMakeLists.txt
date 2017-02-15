# 创建可执行文件
add_executable(calculator calc.c)
# 与 Math 和 Print 链接
target_link_libraries(calculator Math Print)