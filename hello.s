; hello.s
global ft_hello
section .text

ft_hello:
    ; write(1, msg, len)
    mov     rax, 1          ; syscall number (sys_write)
    mov     rdi, 1          ; file descriptor (stdout)
    mov     rsi, msg        ; pointer to message
    mov     rdx, msg_len    ; message length
    syscall
    ret

section .data
msg:        db "Hello world in Assembly!", 10
msg_len:    equ $ - msg
