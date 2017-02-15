project(try-compile)
cmake_minimum_required(VERSION 2.6)

# 该模块包含 CHECK_FUNCTION_EXISTS 宏，该宏封装了 try_compile 命令，用来检测函数是否定义
include(CheckFunctionExists)

# 该模块包含 CHECK_STRUCT_HAS_MEMBER 宏，封装了 try_compile 命令，用来检测结构体是否定义了某个成员
include(CheckStructHasMember)

# 检测 vsnprintf 函数是否存在，并将测试结果记录在 VSNPRINTF_EXISTS
CHECK_FUNCTION_EXISTS(vsnprintf VSNPRINTF_EXISTS)
if(NOT VSNPRINTF_EXISTS)
	message(SEND_ERROR "vsnprintf not available on this build machine")
endif()

# 检测头文件 wait.h 中定义的结构体 rusage 是否存在成员 ru_time，并将检查结果存放在 HAS_STIME 变量
CHECK_STRUCT_HAS_MEMBER("struct rusage" ru_stime wait.h HAS_STIME)
if(NOT HAS_STIME)
	message(SEND_ERROR "ru_stime field not available in struct rusage")
endif()
