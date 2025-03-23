GDT equ 0x6000
fill_desc:
    mov eax,[esp+4];base
    mov ebx,[esp+8];limit
    mov ecx,[esp+12];attr
    mov edx,[esp+16];index

    mov esi,GDT
    shl edx,3;乘以8
    add esi,edx

    ;limit
    mov word [esi],bx
    ;base
    mov word [esi+2],ax
    shr eax,16
    mov byte [esi+4],al
    ;limit high 8
    shr ebx,16
    mov byte [esi+6],bl
    ;base high 8
    mov byte [esi+7],ah
    ;attr
    ;执行/读
    or dword [esi+5],ecx 
    ret