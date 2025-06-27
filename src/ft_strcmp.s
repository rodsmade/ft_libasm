; ft_strcmp.s
global ft_strcmp

section .text

; ─────────────────────────────────────────────────────────────
; ft_strcmp - compares two null-terminated strings lexicographically.
;
; Parameters:
;   rdi - pointer to first string (const char *s1)
;   rsi - pointer to second string (const char *s2)
;
; Returns:
;   rax - integer result of comparison:
;           0  → if the strings are equal
;          <0 → if s1 < s2
;          >0 → if s1 > s2
;
; Behavior:
;   - Compares characters one by one from s1 and s2
;   - Stops at the first differing character or at the null terminator
;   - The result is the difference: (unsigned char)s1[i] - (unsigned char)s2[i]
;
; Notes:
;   - Both strings must be properly null-terminated
;   - Mimics the behavior of the standard C `strcmp` function
; ─────────────────────────────────────────────────────────────

ft_strcmp:
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