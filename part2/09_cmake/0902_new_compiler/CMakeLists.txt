# -----------------------------------------
# 把 mathcomp 编译器加到基于 CMake 的构造系统中
# -----------------------------------------
project(scenario-3)
cmake_minimum_required(VERSION 2.6)

#
# 定义一个宏，封装对第三方编译器的调用逻辑
# {name} mathcomp
# {param} FUNC_NAME 编译方式
# {param} INPUT_FILE 输入文件（.math 文件）
# {param} OUTPUT_FILE 输出文件（.c 文件）
#
macro(mathcomp FUNC_NAME INPUT_FILE OUTPUT_FILE)
	# 在原生构造系统生成前，mathcomp 就通过 -d 选项解析出了依赖规则，并存储在了 DEPS 变量中
	execute_process(
		COMMAND /tools/bin/mathcomp -d ${INPUT_FILE} # shell 命令（编译 .math 文件）
		OUTPUT_VARIABLE DEPS # 标的依赖列表
	)
	message(DEPS)
	# DEPS 变量中记录的，将以空格分割的多个依赖规则转换为以分号分隔
	separate_arguments(DEPS)

	# 添加通过 .math 文件生成 .c 文件的规则
	add_custom_command(
		OUTPUT ${OUTPUT_FILE} # 标的（.c 文件）
		COMMAND /tools/bin/mathcomp -c -o ${OUTPUT_FILE} -f ${FUNC_NAME} ${INPUT_FILE} # shell 命令（编译生成 .c 文件）
		DEPENDS ${DEPS} # 规则的依赖列表
	)
endmacro(mathcomp)

# 调用上面定义的宏,完成设计 mathcomp 编译器的 GNU Make 规则的建立
mathcomp(equations ${PROJECT_SOURCE_DIR}/equations.math equations.c)

# 构造可执行文件 calculator
add_executable(calculator calculator.c equations.c)
