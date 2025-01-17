cmake_minimum_required(VERSION 3.10)

# Project name and version
project(NasmExample VERSION 1.0 LANGUAGES NONE)
set(EXE_NAME hello)

# Set the output directory for binaries
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
file(MAKE_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})

# Define the source file
set(SRC_DIR ${CMAKE_SOURCE_DIR}/src)
set(SOURCES ${SRC_DIR}/main.asm)

# Specify the NASM executable and flags
set(NASM_EXECUTABLE nasm)
set(NASM_FLAGS "-felf64")

# Create a custom command to build the assembly source
add_custom_command(
    OUTPUT ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/main.o
    COMMAND ${NASM_EXECUTABLE} ${NASM_FLAGS} -o ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/main.o ${SOURCES}
    DEPENDS ${SOURCES}
    COMMENT "Assembling ${SOURCES}"
)

# Create a custom target for linking the final executable
add_custom_target(
    hello ALL
    DEPENDS ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/main.o
    COMMAND ld -o ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${EXE_NAME} ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/main.o
    COMMENT "Linking executable"
)

# Mark the executable as an output
add_custom_command(
    OUTPUT ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${EXE_NAME}
    COMMAND true
)

