section .data
    hello db "Hello, World!", 0xA ; String with newline
    len equ $ - hello             ; Length of the string

section .text
    global _start                 ; Entry point for the program

_start:
    mov rax, 1                    ; syscall: write
    mov rdi, 1                    ; file descriptor: stdout
    mov rsi, hello                ; address of the string
    mov rdx, len                  ; length of the string
    syscall                       ; invoke syscall

    mov rax, 60                   ; syscall: exit
    xor rdi, rdi                  ; status: 0
    syscall                       ; invoke syscall

