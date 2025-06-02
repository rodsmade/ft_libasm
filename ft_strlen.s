; ft_strlen.s
global ft_strlen

section .text
ft_strlen:
    ; rdi = pointer to a string
    ; rax = counter (size_t)

    xor rax, rax        ; set rax to 0, this is better than using mov

.loop
    cmp byte [rdi], 0   ; check if current char is '\0'
    je .done
    add rax, 1          ; could've been inc but oh well. rax++
    inc rdi             ; pointer arithmetic to move rdi to next char
    jmp .loop

.done
    ret