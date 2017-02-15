# 
# 使用 project 命令为构造系统命名，将 "basic-sync C" 作为这个构造系统的唯一标识。供需要项目名的原生构造系统（例如 Eclipse） 使用。
# project(<项目名> <编译的语言(C/C++/Java)>)
#
project (basic-sync C)

#
# 声明这段构造描述使用的是 CMake 2.6+ 所支持的命令集。
# param1： VERSION 关键字
# param2: 版本号 
#
cmake_minimum_required(VERSION 2.6)

#
# 创建变量
# set(<变量名> <变量值>)
#
set (wife Grace)

set (dog Stan)

# 输出一行字符串信息（使用 ${} 语法访问变量的值）
message ("${wifi}, please take $(dog) for a walk")

#
# 为指定文件设置属性
# set_property(SOURCE <文件名> PROPERTY <属性名> <属性值>)
#
set_property (SOURCE add.c PROPERTY Author Peter)
set_property (SOURCE mult c PROPERTY Author John)


#
# 获取指定文件的属性名
# get_property(<赋值给哪个变量> SOURCE <文件名> PROPERTY <属性名>)
#
get_property (author_name SOURCE add.c PROPERTY Author)

message ("The author of add.c is ${author_name}")
