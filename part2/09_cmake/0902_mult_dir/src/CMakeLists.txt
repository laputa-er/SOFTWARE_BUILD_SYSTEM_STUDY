# -----------------------------------
# 迭代式地包含字目录中各级构造描述文件的内容
# -----------------------------------
project(scenario-2)
cmake_minimum_required(VERSION 2.6)

add_subdirectory(libmath)
add_subdirectory(libprint)
add_subdirectory(calc)