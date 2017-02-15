# -----------------------
# 编译两个丹毒的程序：calc 和 calculator，二者使用相同的源文件
# -----------------------
project(generating)
cmake_minimum_required(VERSION 2.6)

set(prog1 calculator)
set(prog2 calc)

# 打印执行程序
execute_process(
	# 执行 date 命令，并将输出信息赋值给变量 TIME_NOW
	COMMAND date OUTPUT_VARIABLE TIME_NOW
)

# 构建两个应用程序 calculator、calc（其实是一样的）
foreach(prog_name ${prog1} ${prog2})
	message("Constructing programe ${prog_name} at ${TIME_NOW}")
	add_executable(${prog_name} add sub mult calc)
endforeach()
