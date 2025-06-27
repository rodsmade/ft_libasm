; ft_write.s
global ft_write             ; exports ft_write to the linker
extern __errno_location     ; imports function to get the pointer to errno

section .text

; ─────────────────────────────────────────────────────────────
; ft_write - writes up to `n` bytes from a buffer to a file descriptor.
;
; Parameters:
;   rdi - file descriptor (int)
;   rsi - pointer to buffer (const char *)
;   rdx - number of bytes to write (size_t)
;
; Behavior:
;   - Issues syscall number 1 (sys_write)
;   - On success:
;       - rax contains the number of bytes actually written
;   - On failure:
;       - rax is set to -1
;       - errno is set to the corresponding error code
;
; Notes:
;   - fd = 1 is stdout, fd = 2 is stderr
;   - It's possible fewer than `n` bytes are written (e.g., to pipes or terminals)
; ─────────────────────────────────────────────────────────────

ft_write:
    mov rax, 1          ; syscall number 1 ( = sys_write)
    syscall             ; the thing is, sys_write will look at what's in
                        ; rdi, rsi and rdx - the first three args, so I don't
                        ; have to explicitly do anything other than call it.

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
