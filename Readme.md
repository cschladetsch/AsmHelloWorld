# AsmHelloWorld

A minimal "Hello, World!" program written in 64-bit NASM assembly and built using CMake on WSL/Ubuntu. This project serves as a simple example for learning assembly language programming and integrating it with CMake for modern build automation.

## Features
- Written in 64-bit NASM assembly
- Uses system calls to print "Hello, World!" to the console
- Cross-platform build system via CMake
- Compatible with WSL/Ubuntu

## Requirements
- **NASM**: Netwide Assembler (for assembling the `.asm` files)
- **GCC** or **LD**: GNU Linker (for linking the object files)
- **CMake**: For build system configuration
- **WSL/Ubuntu**: Tested in this environment

## Build and Run Instructions

```bash
$ mkdir -p build && cd build && cmake .. && make
```

