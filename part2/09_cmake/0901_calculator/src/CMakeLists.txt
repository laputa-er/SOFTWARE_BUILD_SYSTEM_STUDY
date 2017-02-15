project(generating)
cmake_minimum_required(VERSION 2.6)

set(prog1 calculator)
set(prog2 calc)

execute_process(
	COMMAND date
	OUTPUT_VARIABLE TIME_NOW
)

foreach(prog_name ${prog1} ${prog2})
	message("Constructing programe ${prog_name} at ${TIME_NOW}")
	add_executable(${prog_name} add sub mult calc)
endforeach()
