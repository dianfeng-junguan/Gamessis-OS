global outb
global inb
global inw
global eoi
global turn_on_int
global io_delay
global common_int_handler
extern print
extern printn
extern print_hex
extern new_line
extern int_table
extern do_signals
[bits 64]
;common_int_handler(long int_no,long long rbp),应当被各个中断第一级handler调用
;会将中断堆栈指针作为第一个参数传入
common_int_handler:
	push rdx
	lea rdx,[rel int_table]
	shl rdi,3;rdi是第一个参数,*8
	add rdx,rdi
	mov rdx,[rdx]
	mov rdi,rsi;rsi第二个参数
	mov rdi,rbp;fix:rbp作为第一个参数传入
	call rdx
	pop rdx

	call do_signals
	
	call eoi
	;恢复上下文
    pop r15
    pop r14
    pop r13
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8

    pop rsi
    pop rdi
    pop rdx
    pop rcx
    pop rbx
	pop rax
	;去除错误码
	add rsp,8
	iretq
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
_report_back_trace_of_err:
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