global read_disk_asm
global write_disk_asm
global disk_int_handler
extern disk_int_handler_c
extern eoi
disk_int_handler:
    call eoi
    call disk_int_handler_c
    iret
read_disk_asm:
    push ebp
    mov ebp,esp
    mov dx,0x1f7
;.not_ready1:
    ;nop ;nop相当于稍息 hlt相当于睡觉
    ;in al,dx ;读0x1f7端口
    ;and al,0xc0 ;第7位为1表示硬盘忙，第6位为1表示硬盘控制器已准备好，正在等待指令。
    ;cmp al,0x40 ;当第7位为0，且第6位为1，则进入下一个步。
    ;jne .not_ready1 ;若未准备好，则继续判断。

    xor ecx,ecx
    mov eax,[esp+8];lba
    mov ecx,[esp+12];counts(actually only data in cl are valid)
    mov ebx,[esp+16];mem_addr
    mov esi,eax;start LBA
    mov dx,0x1f2;设置读取的扇区数
    mov al,cl
    out dx,al

    mov dx,0x1f3
    mov eax,esi
    out dx,al;0-7bit(LBA)

    inc dx
    shr eax,8
    out dx,al;8-15bit

    inc dx
    shr eax,8
    out dx,al;16-23bit

    inc dx
    shr ax,8
    and al,0x0f
    or al,0xe0
    out dx,al;24-27bit and set some disk args

    inc dx
    mov al,0x20
    out dx,al;read disk
.wait:
    nop
    in al,dx
    ;check errors
    ;push ebx
    ;mov bl,al
    ;and bl,0x01
    ;cmp bl,1
    ;je .err_disk_reading

    and al,0x88
    cmp al,0x08
    jne .wait
;0x88=0b10001000
;0x51=0b01010001
    ;pop ebx
    mov di,dx

    mov eax,ecx
    mov cx,256;每次读取2byte，所以要读取512/2*cl次
    mul cx
    mov ecx,eax

    mov dx,0x1f0
.read:
    in ax,dx
    mov word [ebx],ax
    add ebx,2
    loop .read
    
    leave
    mov eax,0
    ret
.err_disk_reading:
    mov dx,0x1f1
    xor eax,eax
    in ax,dx;ax=0xffff
    ;pop ebx
    mov esp,ebp
    pop ebp
    ret
write_disk_asm:
    push ebp
    mov ebp,esp

    mov eax,[esp+8];lba
    mov ecx,[esp+12];sector_num(actually only data in cl are valid)
    mov ebx,[esp+16];mem_ptr

    push eax
    ;第2步：设置要写入的扇区数
    mov dx,0x1f2
    mov al,cl
    out dx,al 
    ;第3步：将LBA地址存入0x1f3~0x1f6
    pop eax
    ;LBA地址7~0位写入端口0x1f3
    mov dx,0x1f3
    out dx,al
    ;LBA地址15~8位写入端口写入0x1f4
    shr eax,8
    mov dx,0x1f4
    out dx,al
    ;LBA地址23~16位写入端口0x1f5
    shr eax,8
    mov dx,0x1f5
    out dx,al
    ;第4步：设置device端口
    shr eax,8
    and al,0x0f ;LBA第24~27位
    or al,0xe0 ;设置7~4位为1110，表示LBA模式，主盘
    mov dx,0x1f6
    out dx,al
    ;第5步：向0x1f7端口写入写命令0x30
    mov dx,0x1f7
    mov al,0x30
    out dx,al

    
    ;第6步：检测硬盘状态
.not_ready2:
    nop ;nop相当于稍息 hlt相当于睡觉
    in al,dx ;读0x1f7端口
    and al,0x88 ;第7位为1表示硬盘忙，第3位为1表示硬盘控制器已准备好数据传输。
    cmp al,0x08 ;当第7位为0，且第3位为1，进入下一步。
    jne .not_ready2 ;若未准备好，则继续判断。
    ;第7步：向0x1f0端口写数据

    mov eax,ecx
    mov cx,256;每次读取2byte，所以要读取512/2*cl次
    mul cx
    mov ecx,eax

    mov dx,0x1f0
.go_on_write:
    mov ax,[ebx]
    out dx,ax
    add ebx,2
    loop .go_on_write

    mov esp,ebp
    pop ebp
    ret