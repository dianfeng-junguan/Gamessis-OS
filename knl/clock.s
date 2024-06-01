global clock
extern eoi
extern clock_c
extern print
extern scene_saver
extern gdt
extern manage_proc_lock
clock:
	cmp dword [manage_proc_lock],0
	jne .normal_part
	;立即保存现场
	pusha
	mov ecx,8
	mov esi,esp
	mov edi,scene_saver
	add edi,0x44
.saver_loop:
	mov ebx,[esi]
	mov dword [edi],ebx
	add esi,4
	sub edi,4
	loop .saver_loop
	popa

	;保存eip
	mov edi,scene_saver
	mov eax,[esp]
	mov dword [edi+0x20],eax
	;保存eflags
	pushf
	pop ebx
	or ebx,0x200
	mov dword [edi+0x24],ebx
	;保存段寄存器
	mov ax,es
	mov word [edi+0x48],ax
	mov ax,cs
	mov word [edi+0x4c],ax
	mov ax,ss
	mov word [edi+0x50],ax
	mov ax,ds
	mov word [edi+0x54],ax
	mov ax,fs
	mov word [edi+0x58],ax
	mov ax,gs
	mov word [edi+0x5c],ax
.normal_part:
	mov al,0x20
	out 0xa0,al
	out 0x20,al
    call clock_c
    iretd