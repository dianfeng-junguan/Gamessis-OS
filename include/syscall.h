#define SYSCALL_REG_DEV 0
#define SYSCALL_DISPOSE_DEV 1
#define SYSCALL_REG_DRV 2
#define SYSCALL_DISPOSE_DRV 3
#define SYSCALL_CALL_DRVFUNC 4
#define SYSCALL_REQ_MEM 5
#define SYSCALL_FREE_MEM 6
#define SYSCALL_REG_PROC 7
#define SYSCALL_DEL_PROC 8
#define SYSCALL_GET_PROC_ADDR 9
#define SYSCALL_CHK_VM 10
#define SYSCAll_OPEN    11
#define SYSCAll_CLOSE    12
#define SYSCAll_READ    13
#define SYSCAll_WRITE    14
#define SYSCAll_SEEK    15
#define SYSCAll_TELL    16
#define SYSCAll_REG_VOL    17
#define SYSCAll_FREE_VOL    18
#define SYSCAll_EXEC    19
#define SYSCALL_EXIT    20
#define SYSCALL_CALL    21
#define SYSCALL_MKFIFO 22
#define SYSCALL_MALLOC 23
#define SYSCALL_FREE 24
#define SYSCALL_FIND_DEV 25
#define SYSCALL_OPERATE_DEV 26
#define SYSCALL_KB_READC 100


#define DRVF_OPEN 0
#define DRVF_CLOSE 1
#define DRVF_READ 2
#define DRVF_WRITE 3
#define DRVF_CHK 4
#define DRVF_RSVD 5
#define DRVF_INT 6
#define DRVF_FIND 7
#define DRVF_RM 8
#define DRVF_TOUCH 9
#define DRVF_MKDIR 10
#define DRVF_LS 11
#define DRVF_SEEK 12
#define DRVF_TELL 13

#define	SEEK_SET	0	/* Seek relative to start-of-file */
#define	SEEK_CUR	1	/* Seek relative to current position */
#define	SEEK_END	2	/* Seek relative to end-of-file */

#define SEEK_MAX	3

#define	SYSTEM_REBOOT	(1UL << 0)
#define	SYSTEM_POWEROFF	(1UL << 1)
int syscall(int a, int b, int c, int d, int e, int f);
int exec(char *path);

unsigned long sys_open(char *filename,int flags);
unsigned long sys_close(int fd);
unsigned long sys_read(int fd,void * buf,long count);
unsigned long sys_write(int fd,void * buf,long count);
unsigned long sys_lseek(int filds,long offset,int whence);
