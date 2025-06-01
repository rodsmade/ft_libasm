; hello.s
global ft_hello
section .text

ft_hello:
    ; write(1, msg, len)
    mov     rax, 1          ; syscall number (1 = sys_write)
    mov     rdi, 1          ; first arg: file descriptor (1 = stdout)
    mov     rsi, msg        ; second arg: pointer to message string
    mov     rdx, msg_len    ; third arg: number of bytes to write
    syscall                 ; make the syscall
    ret                     ; return to caller (C code)

section .data
msg:        db "Hello world in Assembly!", 10
msg_len:    equ $ - msg
