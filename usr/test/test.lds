OUTPUT_FORMAT("elf64-x86-64", "elf64-x86-64", "elf64-x86-64")
OUTPUT_ARCH(i386:x86-64)
ENTRY(entry)
SECTIONS {
    . = 4M ;
    .text : {
        *(.text)
    }
    .data : {
        *(.data)
        *(.rodata)
    }
    __bss_start__ = . ;
    .bss : {
        *(.bss)
    }
    __bss_end__ = . ;
}