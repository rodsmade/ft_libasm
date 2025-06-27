; ft_strlen.s
global ft_strlen

section .text

; ─────────────────────────────────────────────────────────────
; ft_strlen - computes the length of a null-terminated string.
;
; Parameters:
;   rdi - pointer to the start of the string (const char *)
;
; Returns:
;   rax - number of bytes before the first null terminator (size_t)
;
; Behavior:
;   - Increments a counter until a byte equal to 0 ('\0') is found
;   - Does not include the null terminator in the count
;
; Notes:
;   - The input string must be properly null-terminated
;   - No bounds checking is performed (undefined behavior if not)
; ─────────────────────────────────────────────────────────────

ft_strlen:
    xor rax, rax        ; set rax to 0, this is better than using mov

.loop:
    cmp byte [rdi], 0   ; check if current char is '\0'
    je .done
    add rax, 1          ; could've been inc but oh well. rax++
    inc rdi             ; pointer arithmetic to move rdi to next char
    jmp .loop

.done:
    ret