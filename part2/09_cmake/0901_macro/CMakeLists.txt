project(macro)
cmake_minimum_required(VERSION 2.6)

# 定义宏结构
macro(my_macro ARG1 ARG2 ARG3)
	message("The my_macro macro was passed the following arguments:")
	message("${ARG1}, ${ARG2} and ${ARG3}")
endmacro(my_macro)

# 调用宏结构
my_macro(1 2 3)
my_macro(France Germany Russia)
