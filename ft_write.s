; ft_write.s
global ft_write             ; exports ft_write to the linker
extern __errno_location     ; imports function to get the pointer to errno

section .text
ft_write:
    ; takes 3 parameters, in this order: fd, buffer, n
    ;   fd      - a file descriptor to write to
    ;   buffer  - a pointer in memory to (allegedly) relevant data
    ;   n       - the number of chars from buffer that should be written to fd.

    mov rax, 1  ; syscall number 1 ( = sys_write)
    syscall

    cmp rax, 0
    jl handle_error      ; jump to handle_error if rax < 0

    ret

handle_error:
    neg rax

    call __errno_location
    mov [rax], rax

    mov rax, -1
    ret
