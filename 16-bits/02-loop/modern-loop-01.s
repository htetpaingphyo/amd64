; in this program, we will use the modern loop instruction to print a string
; this loop instruction is pretty fast and powerful than the legacy loop
; because in legacy, using cx cost three ops time (deduce cx, compare cx and jump)
[org 0x7c00]
[bits 16]

mov ah, 0x0e
mov bx, 0

loop_start:
    mov al, [msg + bx]  ; put message and bx address to al, in C *(msg + bx)
    cmp al, 0           ; compare al to 0 (null terminator)
    je end              ; jump to end if al is 0

    int 0x10            ; print the char
    inc bx              ; increment bx to move to the next char
    jmp loop_start      ; jump back to loop_start

end:
    hlt
    jmp end

msg db 'HELLO', 0       ; declare a null-terminated string
times 510 - ($ - $$) db 0
dw 0xaa55
