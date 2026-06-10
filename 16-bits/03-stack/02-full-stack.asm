[org 0x7c00]
[bits 16]

; stack implementation SS:SP 0x0000:0x7C00
; stack would have space of 30KB before bootloader
; if it's on absolute hardware, add `mov ds, ax` for safety
start:
	cli					; disable interrupts (safety)
	xor ax, ax			; reset the register
	mov ss, ax			; define stack segment
	mov sp, 0x7c00		; defint stack pointer
	sti					; enable interrupts

	push 0x20			; push '0x20' into the stack
	push 'A'			; push 'A'->'0x41' into the stack
	call add_proc		; push 'ip' into the stack and jump
	add sp, 4			; clear 'sp' (2 x 2 bytes)

end:
	hlt
	jmp end

add_proc:
	push bp				; push bp into the stack (save frame)
	mov bp, sp			; put sp addr to bp

	mov al, [bp + 4]	; put 'A' to al
	add al, [bp + 6]	; add '0x20' to al
	mov ah, 0x0e
	int 0x10

	pop bp				; pop 'bp' from the stack
	ret					; pop 'ip' from the stack and back

times 510 - ($ - $$) db 0
dw 0xaa55

