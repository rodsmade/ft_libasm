; ft_write.s
global ft_write             ; exports ft_write to the linker
extern __errno_location     ; imports function to get the pointer to errno

section .text
ft_write:
    ; takes 3 parameters, in this order: fd, buffer, n
    ;   fd      - a file descriptor to write to
    ;   buffer  - a pointer in memory to (allegedly) relevant data
    ;   n       - the number of chars from buffer that should be written to fd.

    mov rax, 1          ; syscall number 1 ( = sys_write)
    syscall

    cmp rax, 0          ; any errors on syscall return a negative error number in rax
    jl .handle_error    ; jump to .handle_error if rax < 0

    ret

.handle_error:
    neg rax                 ; turns negative error number into positive
    mov rdi, rax            ; stores number in rdi so it doesn't get overwritten

    call __errno_location   ; returns the pointer to errno in rax
    mov [rax], rdi          ; dereference errno pointer and stores syscall error code there

    mov rax, -1             ; the write function originally returns -1!!!!!!!
    ret
