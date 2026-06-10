[org 0x7c00]		; entry point of BIOS
[bits 16]			; define bits for real mode

main:
    mov ah, 0x0e	; call the video output function
	mov al, 'O'		; add char 'A' to function
	int 0x10		; call interrupt to print out

	mov ah, 0x0e	; call the video output function
	mov bl, 'K'		; assign 'K' to the bl registrer
	mov al, bl		; add bl register (address of K) to function
	int 0x10		; call interrupt to print out

	mov ah, 0x0e    ; call the video output function
	mov bl, '.'     ; assign '.' to the bl register
	mov al, bl      ; add bl register
	int 0x10        ; call interrupt to print out

	;jmp main		; infinite loop to prevent system halt

; fill the remaining binary file with 0 to cover 512 bytes
; `$` is the current address, `$$` is the start address of the file (0x7c00)
times 510 - ($ - $$) db 0
dw 0xaa55			; declare the MBR record for BIOS
