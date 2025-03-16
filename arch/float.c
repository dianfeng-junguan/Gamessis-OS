#include "proc.h"
#include "float.h"
void save_float()
{
    __asm__ volatile("fxsave (%0)" : : "r"(current->regs.float_regs));
}
void restore_float()
{
    __asm__ volatile("fxrstor (%0)" : : "r"(current->regs.float_regs));
}