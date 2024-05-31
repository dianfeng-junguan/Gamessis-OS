OUTPUT_FORMAT("elf32-i386", "elf32-i386", "elf32-i386")
OUTPUT_ARCH(i386)
ENTRY(init32)

SECTIONS {
    . = 1M;
    .entry :
    {
        init32 = .;
        *(.entry)
    }
    .multiboot2 :
    {
        *(.multiboot2)
    }
    . = 4M;
    .bss :
    {
        kstack = .;
        *(.bss)
    }
    . = 16M;
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
    .bss :
    {
        *(.bss)
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
}
