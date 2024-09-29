global clock
extern eoi
extern clock_c
extern print
extern scene_saver
extern gdt
extern manage_proc_lock
clock:

.normal_part:
	mov al,0x20
	out 0xa0,al
	out 0x20,al
    call clock_c
    iretq