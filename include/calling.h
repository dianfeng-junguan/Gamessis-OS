/**
    @file 一些有特殊要求的函数调用
*/
/**
    @brief 在保存通用寄存器和易失性寄存器的同时调用函数
    @param func 要调用的函数指针
    @return 该函数没有返回值
*/
void call_while_saving_general_volatiles(int* (*func)());
/**
    @brief 在保存通用寄存器和易失性寄存器的同时调用函数，并返回函数的返回值
    @param func 要调用的函数指针
    @return 函数的返回值，这意味着rax原来的值不会被保存
*/
unsigned long long call_while_saving_general_volatiles_with_return(int* (*func)());