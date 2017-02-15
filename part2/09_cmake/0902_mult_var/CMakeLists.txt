project(scenario-4)

# 创建名为 PLATFORM 的新缓存变量（使用 CACHE 关键字来表明用户在生成新的原生构造系统时，可以配置该变量的值；设置 STEING 值，作为显示给用户的提示）
set(PLATFORM i386 CACHE STRING "CPU Type: i386, powerpc or alpha")

# 对用户输出进行校验
if(NOT ${PLATFORM} MATCHES "^(i386|powerpc|alpha)$")
	message(SEND_ERROR
		"Invalid PLATFORM. Must be one of i386, powerpc or alpha")
endif()

message("Compiling code for platform ${PLATFORM}")

# 根据用户的指定，设置使用哪种编译器
set(CMAKE_C_COMPILER /tools/bin/gcc-${PLATFORM})

# 生成实际的构造规则
add_executable(calculator add sub mult calc)