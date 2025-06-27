; ft_strdup.s
global ft_strdup
extern ft_strlen
extern ft_strcpy
extern __errno_location

section .text

; ──────────────────────────────────────────────────────────────────────────────
; Duplicates a null-terminated string by allocating memory and copying its
;   contents.
;
; Parameters:
;   rdi – pointer to the source string (const char *s)
;
; Behavior:
;   - Calculates the length of the string (using ft_strlen).
;   - Allocates memory using the mmap syscall (length + 1 bytes for the null
;       terminator).
;   - Copies the original string to the newly allocated memory using ft_strcpy.
;
; Returns:
;   - On success: pointer to the duplicated string (in rax)
;   - On failure: NULL (rax = 0) and sets errno accordingly
; ──────────────────────────────────────────────────────────────────────────────

ft_strdup:
    mov rcx, rdi            ; saves address of original str temporarily in rcx
    call ft_strlen          ; first get length of rdi
    add rax, 1              ; add 1 to account for \0

    ; prepare registers for mmap call
    mov rdi, 0
    mov rsi, rax            ; length + 1 is stored in rax
    mov rdx, 0x3
    mov r10, 0x22
    mov r8, -1
    mov r9, 0
    mov rax, 9              ; 9 is sys_mmap
    syscall                 ; make mmap call; new ptr is in rax
    cmp rax, 0              ; check for errors (copy write errno)
    jl .handle_error        ; jump to .handle_error if rax < 0

    ; prepare registers for ft_strcpy
    mov rdi, rax            ; rax holds the new ptr
    mov rsi, rcx            ; og str address was kept in rcx
    call ft_strcpy          ; returns destination buffer in rax

    ; return the pointer to new str
    ret

.handle_error:
    neg rax                 ; turns negative error number into positive
    mov rdi, rax            ; stores number in rdi so it doesn't get overwritten

    call __errno_location   ; returns the pointer to errno in rax
    mov [rax], rdi          ; dereference errno pointer and stores syscall error code there

    mov rax, 0              ; must return NULL and set errno
    ret
