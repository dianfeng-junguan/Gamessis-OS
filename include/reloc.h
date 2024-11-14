//
// Created by Oniar_Pie on 2024/11/13.
//

#ifndef GMS_RELOC_H
#define GMS_RELOC_H
#include "multiboot2.h"
void do_reloc(struct multiboot_tag_elf_sections *shtag);
#endif //GMS_RELOC_H
