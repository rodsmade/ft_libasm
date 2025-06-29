; ft_strcpy.s
global ft_strcpy

section .text

; ─────────────────────────────────────────────────────────────
; ft_strcpy - copies a null-terminated string from `src` to `dest`.
;
; Parameters:
;   rdi - pointer to destination buffer (char *)
;   rsi - pointer to source string (const char *)
;
; Returns:
;   rax - pointer to destination buffer (`dest`)
;
; Behavior:
;   - Copies bytes one by one from `src` to `dest`
;   - Includes the null terminator (`'\0'`) in the copy
;
; Notes:
;   - The caller is responsible for ensuring `dest` has enough space
;   - No bounds checking is performed
; ─────────────────────────────────────────────────────────────

ft_strcpy:
    mov rbx, rdi        ; saves original address of dest

.loop:
    mov al, [rsi]       ; can't move from memory to memory directly;
    mov [rdi], al       ; 'mov' needs one of the operands to be a register (al).
    cmp al, 0
    je .done
    inc rsi
    inc rdi
    jmp .loop

.done:
    mov rax, rbx
    ret
