//
// Created by Oniar_Pie on 2024/11/3.
//

#ifndef GMS_WAIT_H
#define GMS_WAIT_H
#include "sys/types.h"
pid_t wait(int *stat_loc);
pid_t waitpid(pid_t pid, int *stat_loc, int options);
#endif //GMS_WAIT_H
