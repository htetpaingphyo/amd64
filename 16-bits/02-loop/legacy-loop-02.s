; in this program, we use the legacy loop to print 0~9 to the screen
[org 0x7c00]
[bits 16]

mov cx, 10				; set counter for 10
mov bl, 0x30			; 0x30 stands for 0 in ASCII
mov ah, 0x0e            ; call teletype function

loop_start:
    mov al, bl          ; cannot increment al directly, so we use bl instead
	int 0x10            ; print al to the screen
	inc bl              ; increment bl to get the next ASCII character
	loop loop_start     ; loop until cx is 0

end:
	hlt                 ; halt the cpu to low power sleep
   	jmp end             ; prevent infinite loop and right back to sleep

times 510 - ($ - $$) db 0
dw 0xaa55
