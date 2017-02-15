project(custom_target)

cmake_minimum_required(VERSION 2.6)

# 添加自定义标的（通过 ALL 关键字声明为默认标的）
add_custom_target(print-city ALL
	COMMAND echo "Vancouver is a nice city"
	COMMAND echo "Even when it rains")

# 添加标的 print-time
add_custom_target(print-time
	COMMMAND echi "It is now 2:19pc")

# 添加标的 print-day
add_custom_target(print-day
	COMMAND echo "Today is Monday")

# 声明 print-city 标的依赖 print-time 标的 和 print-day 标的
add_dependencies(print-city print-time print-day)
