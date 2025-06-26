; ft_strcpy.s
global ft_strcpy

section .text
ft_strcpy:
    ; Copies the null-terminated string from src (rsi) to dest (rdi),
    ; up to and including the first null terminator ('\0') found in src.
    ;
    ; The copy proceeds byte by byte until the null terminator is encountered.
    ;
    ; Returns:
    ;   - a pointer to dest (rdi), stored in rax.

    mov rax, rdi        ; saves original address of dest

.loop
    mov al, [rsi]       ; can't move from memory to memory directly;
    mov [rdi], al       ; 'mov' needs one of the operands to be a register (al).
    cmp al, 0
    je .done
    inc rsi
    inc rdi
    jmp .loop

.done
    ret
