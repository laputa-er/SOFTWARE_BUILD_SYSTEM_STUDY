project(finding)
cmake_minumum_required(VERSION 2.6)

# 在标准路径中搜索 ls 工具的绝对路径，并记录在 LS_PATH 变量中
find_program(LS_PATH ls)
message("The path to the ls program is ${LS_PATH}")

# 在 PATH 环境变量列出的路径中遍历搜索 stdio.h 文件，并将找到的路径记录在 STDIO_H 变量中
find_file(STDIO_H PATH stdio.h)
message("The path to the stdio.h file is ${STDIO_H_PATH}")

# 在指定路径 /usr/local/lib 和 /usr/lib64 中，寻找 c 语言标准数学运算程序库，并将找到的路径记录在 LIB_MATH_PATH 变量中
find_library(LIB_MATH_PATH m /usr/local/lib /usr/lib64)
message("The path to the math library is ${LIB_MATH_PATH}")