; in this program, we use a legacy loop to print 10 asterisks to the screen
[org 0x7c00]
[bits 16]

mov cx, 10               ; define number of iterations in cx

loop_start:
    mov ah, 0x0e        ; teletype output function
    mov al, '*'         ; character to print
    int 0x10            ; call BIOS video interrupt
    loop loop_start     ; loop until cx is zero

end:
	hlt                 ; halt the cpu to low power sleep
   	jmp end             ; prevent infinite loop and right back to sleep

times 510 - ($ - $$) db 0
dw 0xaa55
