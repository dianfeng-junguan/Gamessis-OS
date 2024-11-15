global outb
global inb
global inw
global eoi
global turn_on_int
global io_delay
global report_back_trace_of_err
extern print
extern printn
extern print_hex
extern new_line
[bits 64]
outb:
	mov dx,di
	mov ax,si
	out dx,al
	call io_delay
	ret
global outw
outw:
	mov dx,di
	mov ax,si
	out dx,ax
	nop
	nop
	nop
	ret
inb:
	xor eax,eax
	mov dx,di
	in al,dx
	nop
	nop
	nop
	ret
inw:
	xor eax,eax
	mov dx,di
	in ax,dx
	nop
	nop
	nop
	ret
eoi:
	mov al,0x20
	out 0xa0,al
	out 0x20,al
	ret
io_delay:
	nop
	nop
	nop
	nop
	ret
turn_on_int:
	;set_mute
	;clock and keyboard
	mov al, 11111000b
	out 021h, al
	call io_delay
	mov al, 10101111b ;disk int 10111111
	out 0A1h, al
	call io_delay

	;mov si,idtptr
	;mov eax,[IDT_ADDR]
	;mov dword [si+4],eax
	mov rax,0xffff800000107000
	lidt [rax]
	nop
	nop
	nop
	nop
	ret
extern printf
report_back_trace_of_err:
	;assume happening under a int called
	;in the stack:
	;top:
	;ret addr of this func
	;eip
	;cs
	;eflags
	mov eax,[esp+4]
	push rax
	;push bt_msg
	;call printf
	add esp,8

	ret
bt_msg:
	db "error occurs at:%x",'\n',0
section .idt align=4096
idt:
    resq 512
idt_end:
section .idtptr
idtptr:
	dw idt_end-idt
	dq 0x106000
