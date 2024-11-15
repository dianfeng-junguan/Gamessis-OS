OUTPUT_FORMAT("elf64-x86-64", "elf64-x86-64", "elf64-x86-64")
OUTPUT_ARCH(i386:x86-64)
ENTRY(main)

SECTIONS {
    . = 1M;
    _knl_start = . ;
    KNL_BASE = 0xffff800000000000;
    . = KNL_BASE + 4M;
    .bss :
    {
        kstack = .;
        *(.bss)
    }
    . = KNL_BASE + 8M;
    .text :
    {
        kmain = .;
        *(.text)
    }
    .data :
    {
        *(.data)
    }
    .rodata :
    {
        *(.rodata)
    }
    .eh_frame :
    {
        *(.eh_frame)
    }
    .got :
    {
        *(.got)
    }
    .got.plt :
    {
        *(.got.plt)
    }
    .iplt :
    {}
    .rela.dyn :
    {}
    .igot.plt :
    {}
    .kend :
    {
        *(.kend)
    }
    _knl_end = KNL_BASE + 12M ;
}
