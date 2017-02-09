PROG_NAME := my-calculator # 普通字符串
LIST_OF_SRCS := calc.c main.c math.h lib.c # 列表
COLORS := red FF000 green 00FF00 blue 0000FF purple FF00FF # 字典
ORDERS := 100 green cups 200 blue plates # 结构

# words
NUM_FILES := $(words $(LIST_OF_SRCS)) # 4

# word
SECOND_FILE := $(word 2, $(LIST_OF_SRCS)) # main.c

# filter
C_SRCS := $(filter %.c, $(LIST_OF_SRCS)) # calc.c main.c lib.c

# patsubst
OBJECTS := $(patsubst %.c,%.o, $(C_SRCS)) # calc.o main.o lib.o

# addprefix
OBJ_LIST := $(addprefix objs/, $(OBJECTS)) # objs/calc.o objs/main.o objs/lib.o

# foreach
OBJ_LIST_2 := $(foreach file, $(OBJECTS), objs/$(file)) # objs/calc.o objs/main.o objs/lib.o

# dir
DEFN_PATH := src/headers/idl/interface.idl
DEFN_DIR := $(dir $(DEFN_PATH)) # src/headers/idl/

# notdir
DEFN_BASENAME := $(notdir $(DEFN_PATH)) # interface.idl

# shell
PASSWD_OWNER := $(word 3, $(shell ls -l /etc/passwd)) # root