#include <ext2/ext2.h>
#include <disk.h>
struct super_block sb;
struct m_inode inodes[NR_INODE];
struct file files[NR_FILE];
int ext2_load(driver_args* args)
{
	int mdev=args->major_dev;
	int sdev=args->slave_dev;
	
}

int ext2_touch(driver_args *args);
int ext2_mkdir(driver_args *args);
int ext2_find(driver_args* args);
int ext2_rm(driver_args *args);
int ext2_read(driver_args *args);
int ext2_write(driver_args* args);