;%macro GDTdescriptor 3
;dw %2 & 0ffffh
;dw %1 & 0ffffh
;db (%1>>16) & 0ffh
;db (%3>>4) & 0ffh
;db (%2>>12)&0f0h | (%3)&0fh
;db (%1>>24) &0ffh
;%endmacro
%macro GDTdescriptor 3

dw %2 & 0FFFFh ; 段界限1

dw %1 & 0FFFFh ; 段基址1

db (%1 >> 16) & 0FFh ; 段基址2

dw ((%2 >> 8) & 0F00h) | (%3 & 0F0FFh) ; 属性1 + 段界限2 + 属性2

db (%1 >> 24) & 0FFh ; 段基址3

%endmacro 
DATAs equ 000010000000b
CODE equ 000110000010b
;STACK equ 001010000000b
DATA_WRITABLE equ 010000000000b
CODE_READABLE equ 010000000000b
CODE_LOWERCANUSE equ 001000000000b
EXIST equ 10000b
FOURKBASUNIT equ 1b
LEVELSECONDHIGH equ 0100000b
LEVELTHIRDHIGH equ 1000000b
LEVELLOWEST equ 1100000b
DATA_SYS equ DATA|DATA_WRITABLE|EXIST
CODE_SYS equ CODE|CODE_READABLE|CODE_LOWERCANUSE|EXIST
CODE_SYS_LARGE equ CODE_SYS|FOURKBASUNIT
;----------------------------------------------------------------------------

; 在下列类型值命名中：

;       DA_  : Descriptor Attribute

;       D    : 数据段

;       C    : 代码段

;       S    : 系统段

;       R    : 只读

;       RW   : 读写

;       A    : 已访问

;       其它 : 可按照字面意思理解

;----------------------------------------------------------------------------



; 描述符类型

DA_32 EQU 4000h ; 32 位段
DATA32 equ DA_32


DA_DPL0 EQU  00h ; DPL = 0

DA_DPL1 EQU  20h ; DPL = 1

DA_DPL2 EQU  40h ; DPL = 2

DA_DPL3 EQU  60h ; DPL = 3



; 存储段描述符类型

DA_DR EQU 90h ; 存在的只读数据段类型值

DA_DRW EQU 92h ; 存在的可读写数据段属性值
WRITABLEDATA equ DA_DRW

DA_DRWA EQU 93h ; 存在的已访问可读写数据段类型值

DA_C EQU 98h ; 存在的只执行代码段属性值

DA_CR EQU 9Ah ; 存在的可执行可读代码段属性值
CANREADANDEXE equ DA_CR

DA_CCO EQU 9Ch ; 存在的只执行一致代码段属性值

DA_CCOR EQU 9Eh ; 存在的可执行可读一致代码段属性值

DATA equ WRITABLEDATA+DATA32

; 系统段描述符类型

DA_LDT EQU  82h ; 局部描述符表段类型值

DA_TaskGate EQU  85h ; 任务门类型值

DA_386TSS EQU  89h ; 可用 386 任务状态段类型值

DA_386CGate EQU  8Ch ; 386 调用门类型值

DA_386IGate EQU  8Eh ; 386 中断门类型值

DA_386TGate EQU  8Fh ; 386 陷阱门类型值

; usage: Gate Selector, Offset, DCount, Attr
;        Selector:  dw
;        Offset:    dd
;        DCount:    db
;        Attr:      db
%macro Gate 4
	dw	(%2 & 0FFFFh)				; 偏移 1				(2 字节)
	dw	%1					; 选择子				(2 字节)
	dw	(%3 & 1Fh) | ((%4 << 8) & 0FF00h)	; 属性					(2 字节)
	dw	((%2 >> 16) & 0FFFFh)			; 偏移 2				(2 字节)
%endmacro ; 共 8 字节