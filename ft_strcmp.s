; ft_strcmp.s
global ft_strcmp

section .text
ft_strcmp:
    ; Compares two null-terminated strings, starting at pointers s1 (rdi) and s2 (rsi).
    ; The comparison proceeds byte by byte until:
    ;   - a null terminator ('\0') is encountered in either string, or
    ;   - a differing character is found.
    ;
    ; Returns:
    ;   -  0 if the strings are equal
    ;   - <0 if s1 is lexicographically less than s2
    ;   - >0 if s1 is lexicographically greater than s2

    xor rax, rax                    ; reset rax (all bits to 0)

.loop:
    mov al, [rdi]                   ; load the lowest 8 bits (byte) of rdi to al
    mov bl, [rsi]                   ; idem

    cmp al, bl                      ; subtract bl from al
    jne .return_difference

    jmp .check_for_null_terminator

.increment:
    inc rdi
    inc rsi
    jmp .loop

.return_difference:
    movzx rax, al                   ; zero-extend al into rax for subtraction
    movzx rbx, bl                   ; zero-extend bl into rbx for subtraction
    sub rax, rbx                    ; store subtraction result in rax
    jmp .done

.check_for_null_terminator:
    cmp al, 0
    je .done
    jmp .increment

.done:
    ret