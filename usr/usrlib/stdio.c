#include "sys/unistd.h"
void putchar_(char c){
    write(1, &c, 1);
}