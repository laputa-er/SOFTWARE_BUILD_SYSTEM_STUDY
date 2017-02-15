# -----------------------------------------------
# 定义新的编译工具，让 CMake 把这些工具加到原生构造系统中.
# ----------------------------------------------
project(custom_command)
cmake_minimum_required(VERSION 2.6)

# 定义新编译工具的源文件
set(input_data_file ${PROJECT_SOURCE_DIR}/data.dat)

# 定义新编译工具的目标文件
set(output_c_file data.c)

# 添加自定义规则
add_custom_command(
	# 声明要创建的文件(标的)
	OUTPUT ${output_c_file}
	# shell 命令
	COMMAND /tools/bin/make-data-file
		< ${input_data_file}
		> ${output_c_file} 
	# 规则的依赖列表
	DEPENDS ${input_data_file}
)

# 顶层标的（创建最终的可执行程序）
add_executable(print-data ${output_c_file})