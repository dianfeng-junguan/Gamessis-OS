ENTRY(dlmain)

SECTIONS {
    .text :
    {
        *(.text)
    }
    .data :
    {
        *(.data)
    }
    _DYNAMIC = . ;
    .dynamic : 
    {
        *(.dynamic)
    }
}
