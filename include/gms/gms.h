/*
GMS 用户头文件。
 */
void* create_console();
int destroy_console(void* console);
int attach_console(void* console);
int detach_console();

//ipc: signals
// int send_signal(int pid, int signal);

