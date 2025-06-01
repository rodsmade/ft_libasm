; ft_write.s
global ft_write

section .text
ft_write:
    ; takes 3 parameters, in this order: fd, buffer, n
    ;   fd      - a file descriptor to write to
    ;   buffer  - a pointer in memory to (allegedly) relevant data
    ;   n       - the number of chars from buffer that should be written to fd.
    mov rax, 1  ; syscall number 1 ( = sys_write)
    syscall
    ret
