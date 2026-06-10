; in this program, we will use the modern loop instruction to print a string
; this loop instruction is more efficient and OS ready than the previous one
; because it is using si to point the string and directly increment to the next char
[bits 16]
[org 0x7c00]

mov ah, 0x0e
mov si, msg                 ; use si to point the address of msg

loop_start:
    mov al, [si]            ; put the data of [si] into al
    cmp al, 0               ; compare al with 0
    je end                  ; if al is 0, jump to end

    int 0x10                ; print the character
    inc si                  ; increment si to point to the next character
    jmp loop_start          ; jump back to loop_start

end:
    hlt
    jmp end

msg db 'HELLO', 0
times 510 - ($ - $$) db 0
dw 0xaa55
