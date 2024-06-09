#include <ext2/ext2.h>
#include <errno.h>
#include <proc.h>
#include <devdrv.h>
struct super_block sbs[NR_SUPER];
struct m_inode inodes[NR_INODE];
struct buffer_head bhs[NR_BUFFERHEADS];
struct dir_entry dentries[NR_FILE];
struct file files[NR_OPEN];
driver ext2_drv={
	.find=ext2_find,
	.read=ext2_read,
	.write=ext2_write,
	.rm=ext2_rm,
	.touch=ext2_touch,
	.mkdir=ext2_mkdir,
	.open=ext2_load
};

extern int cur_proc;
/* 
	从某一个块设备上加载ext2文件系统。
	args中的参数：
	dev:块设备设备号
 */
int ext2_load(driver_args* args)
{
	
}

int ext2_touch(driver_args *args);
int ext2_mkdir(driver_args *args);
int ext2_find(driver_args* args);
int ext2_rm(driver_args *args);
int ext2_read(driver_args *args);
int ext2_write(driver_args* args);

