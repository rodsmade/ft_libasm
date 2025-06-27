; ft_read.s
global ft_read              ; exports ft_read to the linker
extern __errno_location     ; imports function to get the pointer to errno

section .text

; ─────────────────────────────────────────────────────────────
; ft_read - reads up to `n` bytes from a file descriptor into a buffer.
;
; Parameters:
;   rdi - file descriptor (int)
;   rsi - pointer to buffer (char *)
;   rdx - number of bytes to read (size_t)
;
; Behavior:
;   - Issues syscall number 0 (sys_read)
;   - On success:
;       - rax contains the number of bytes actually read (can be < n)
;   - On failure:
;       - rax is set to -1
;       - errno is set to the error number via __errno_location
;
; Notes:
;   - fd = 0 is stdin
;   - Buffer must be writable memory of at least `n` bytes
;   - The syscall may return fewer bytes than requested
; ─────────────────────────────────────────────────────────────

ft_read:
    mov rax, 0          ; syscall number 0 ( = sys_read)
    syscall             ; the thing is, sys_read will look at what's in
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
