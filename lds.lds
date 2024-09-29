OUTPUT_FORMAT("elf64-x86-64", "elf64-x86-64", "elf64-x86-64")
OUTPUT_ARCH(i386:x86-64)
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
    .pgtbl ALIGN(4096) :
    {
        *(.pgtbl)
    }
    .gdt ALIGN(4096) :
    {
        *(.gdt)
    }
    .gdtptr ALIGN(4096) :
    {
        *(.gdtptr)
    }
    .idt ALIGN(4096) :
    {
        *(.idt)
    }
    .idtptr ALIGN(4096) :
    {
        *(.idtptr)
    }
    . = 4M;
    .bss :
    {
        kstack = .;
        *(.bss)
    }
    . = 8M;
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
