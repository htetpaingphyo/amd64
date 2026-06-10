[bits 16]
[org 0x7c00]

start:
	mov bx, 65				; decimal 65 - 'A'
	mov ax, 32				; decimal 32 - 'Space'
	call add_num
	; push next instruction into the stack, and `ip` jumps to add_num
	; to be continued when `ret`

	mov ah, 0x0e
	mov al, bl				; cast bx value to bl, now bl becomes 97
	int 0x10

end:
	hlt
	jmp end

add_num:
	add bx, ax				; 65 + 32 = 97 - 'a'
	ret						; pop return addr from the stack to `ip`

times 510 - ($ - $$) db 0
dw 0xaa55
