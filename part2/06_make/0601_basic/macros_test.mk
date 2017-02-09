# 定义宏：查看文件的大小
file_size = $(word 5, $(shell ls -l $(1)))

# 使用宏
PASSWD_SIZE := $(call file_size,/etc/passwd) # 5925