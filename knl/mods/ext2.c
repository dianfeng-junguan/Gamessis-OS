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

int ext2_load(driver_args* args)
{
	
}

int ext2_touch(driver_args *args);
int ext2_mkdir(driver_args *args);
int ext2_find(driver_args* args);
int ext2_rm(driver_args *args);
int ext2_read(driver_args *args);
int ext2_write(driver_args* args);


int sys_read(int fd,char *buf,int len)
{
	struct file *file;
	struct m_inode *inode;

// 如果文件句柄值大于程序最多打开文件数NR_OPEN，或者需要读取的字节计数值小于0，或者该句柄
// 的文件结构指针为空，则返回出错码并退出。
	if (fd >= NR_OPEN || len < 0)
		return -1;
// 若需读取的字节数len 等于0，则返回0，退出
	if (!len)
		return 0;
// 验证存放数据的缓冲区内存限制。
	//verify_area (buf, len);
// 取文件对应的i 节点。若是管道文件，并且是读管道文件模式，则进行读管道操作，若成功则返回
// 读取的字节数，否则返回出错码，退出。
	inode = file->f_inode;
	// if (inode->i_pipe)
	// 	return (file->f_mode & 1) ? read_pipe (inode, buf, len) : -EIO;
// 如果是字符型文件，则进行读字符设备操作，返回读取的字符数。
	if (S_ISCHR (inode->i_mode))
		return rw_char (READ, inode->i_zone[0], buf, len, &file->f_pos);
// 如果是块设备文件，则执行块设备读操作，并返回读取的字节数。
	if (S_ISBLK (inode->i_mode))
		return block_read (inode->i_zone[0], &file->f_pos, buf, len);
// 如果是目录文件或者是常规文件，则首先验证读取数len 的有效性并进行调整（若读取字节数加上
// 文件当前读写指针值大于文件大小，则重新设置读取字节数为文件长度-当前读写指针值，若读取数
// 等于0，则返回0 退出），然后执行文件读操作，返回读取的字节数并退出。
	if (S_ISDIR (inode->i_mode) || S_ISREG (inode->i_mode))
	{
		if (len + file->f_pos > inode->i_size)
			len = inode->i_size - file->f_pos;
		if (len <= 0)
			return 0;
		return file_read (inode, file, buf, len);
	}
// 否则打印节点文件属性，并返回出错码退出。
	//printf ("(Read)inode->i_mode=%06o\n\r", inode->i_mode);
	return -1;
}

int sys_write(int fd,char *buf,int len)
{
	struct file *file;
	struct m_inode *inode;

// 如果文件句柄值大于程序最多打开文件数NR_OPEN，或者需要写入的字节计数小于0，或者该句柄
// 的文件结构指针为空，则返回出错码并退出。
	if (fd >= NR_OPEN || len < 0)
		return -1;
// 若需读取的字节数len 等于0，则返回0，退出
	if (!len)
		return 0;
// 取文件对应的i 节点。若是管道文件，并且是写管道文件模式，则进行写管道操作，若成功则返回
// 写入的字节数，否则返回出错码，退出。
	inode = file->f_inode;
	// if (inode->i_pipe)
	// 	return (file->f_mode & 2) ? write_pipe (inode, buf, len) : -1;
// 如果是字符型文件，则进行写字符设备操作，返回写入的字符数，退出。
	if (S_ISCHR (inode->i_mode))
		return rw_char (WRITE, inode->i_zone[0], buf, len, &file->f_pos);
// 如果是块设备文件，则进行块设备写操作，并返回写入的字节数，退出。
	if (S_ISBLK (inode->i_mode))
		return block_write (inode->i_zone[0], &file->f_pos, buf, len);
// 若是常规文件，则执行文件写操作，并返回写入的字节数，退出。
	if (S_ISREG (inode->i_mode))
		return file_write (inode, file, buf, len);
// 否则，显示对应节点的文件模式，返回出错码，退出。
	//printk ("(Write)inode->i_mode=%06o\n\r", inode->i_mode);
	return -1;
}

int sys_seek(int fd,int offset,int origin)
{
	struct file *file;
	int tmp;

// 如果文件句柄值大于程序最多打开文件数NR_OPEN(20)，或者该句柄的文件结构指针为空，或者
// 对应文件结构的i 节点字段为空，或者指定设备文件指针是不可定位的，则返回出错码并退出。
	if (fd >= NR_OPEN ||  !(file->f_inode)
			|| !IS_SEEKABLE (MAJOR (file->f_inode->i_dev)))
		return -EBADF;
// 如果文件对应的i 节点是管道节点，则返回出错码，退出。管道头尾指针不可随意移动！
	if (file->f_inode->i_pipe)
		return -ESPIPE;
// 根据设置的定位标志，分别重新定位文件读写指针。
	switch (origin)
	{
// origin = SEEK_SET，要求以文件起始处作为原点设置文件读写指针。若偏移值小于零，则出错返
// 回错误码。否则设置文件读写指针等于offset。
	case 0:
		if (offset < 0)
			return -EINVAL;
		file->f_pos = offset;
		break;
// origin = SEEK_CUR，要求以文件当前读写指针处作为原点重定位读写指针。如果文件当前指针加
// 上偏移值小于0，则返回出错码退出。否则在当前读写指针上加上偏移值。
	case 1:
		if (file->f_pos + offset < 0)
			return -EINVAL;
		file->f_pos += offset;
		break;
// origin = SEEK_END，要求以文件末尾作为原点重定位读写指针。此时若文件大小加上偏移值小于零
// 则返回出错码退出。否则重定位读写指针为文件长度加上偏移值。
	case 2:
		if ((tmp = file->f_inode->i_size + offset) < 0)
			return -EINVAL;
		file->f_pos = tmp;
		break;
// origin 设置出错，返回出错码退出。
	default:
		return -EINVAL;
	}
	return file->f_pos;		// 返回重定位后的文件读写指针值。
}

int vfs_load(driver_args* args);

int vfs_touch(driver_args *args);
int vfs_mkdir(driver_args *args);
int vfs_find(driver_args* args);
int vfs_rm(driver_args *args);
int file_read(struct m_inode * inode, struct file * filp, char * buf, int len)
{
	int left,chars,nr;
	struct buffer_head * bh;

// 若需要读取的字节计数值小于等于零，则返回。
	if ((left=len)<=0)
		return 0;
// 若还需要读取的字节数不等于0，就循环执行以下操作，直到全部读出。
	while (left) {
// 根据i 节点和文件表结构信息，取数据块文件当前读写位置在设备上对应的逻辑块号nr。若nr 不
// 为0，则从i 节点指定的设备上读取该逻辑块，如果读操作失败则退出循环。若nr 为0，表示指定
// 的数据块不存在，置缓冲块指针为NULL。
		if (nr = bmap(inode,(filp->f_pos)/BLOCK_SIZE,0)) {
			if (!(bh=bread(inode->i_dev,nr)))
				break;
		} else
			bh = NULL;
// 计算文件读写指针在数据块中的偏移值nr，则该块中可读字节数为(BLOCK_SIZE-nr)，然后与还需
// 读取的字节数left 作比较，其中小值即为本次需读的字节数chars。若(BLOCK_SIZE-nr)大则说明
// 该块是需要读取的最后一块数据，反之则还需要读取一块数据。
		nr = filp->f_pos % BLOCK_SIZE;
		chars = MIN( BLOCK_SIZE-nr , left );
// 调整读写文件指针。指针前移此次将读取的字节数chars。剩余字节计数相应减去chars。
		filp->f_pos += chars;
		left -= chars;
// 若从设备上读到了数据，则将p 指向读出数据块缓冲区中开始读取的位置，并且复制chars 字节
// 到用户缓冲区buf 中。否则往用户缓冲区中填入chars 个0 值字节。
		if (bh) {
			char * p = nr + bh->b_data;
			while (chars-->0)
				*buf++=*(p++);
			brelse(bh);
		} else {
			while (chars-->0)
				*buf++=0;
		}
	}
// 修改该i 节点的访问时间为当前时间。返回读取的字节数，若读取字节数为0，则返回出错号。
	//inode->i_atime = CURRENT_TIME;
	return (len-left)?(len-left):-1;
}
int file_write(struct m_inode * inode, struct file * filp, char * buf, int len)
{
	unsigned int pos;
	int block,c;
	struct buffer_head * bh;
	char * p;
	int i=0;

/*
 * ok，当许多进程同时写时，append 操作可能不行，但那又怎样。不管怎样那样做会
 * 导致混乱一团。
 */
// 如果是要向文件后添加数据，则将文件读写指针移到文件尾部。否则就将在文件读写指针处写入。
	// if (filp->f_flags & O_APPEND)
	// 	pos = inode->i_size;
	// else
		pos = filp->f_pos;
// 若已写入字节数i 小于需要写入的字节数len，则循环执行以下操作。
	while (i<len) {
// 创建数据块号(pos/BLOCK_SIZE)在设备上对应的逻辑块，并返回在设备上的逻辑块号。如果逻辑
// 块号=0，则表示创建失败，退出循环。
		if (!(block = create_block(inode,pos/BLOCK_SIZE)))
			break;
// 根据该逻辑块号读取设备上的相应数据块，若出错则退出循环。
		if (!(bh=bread(inode->i_dev,block)))
			break;
// 求出文件读写指针在数据块中的偏移值c，将p 指向读出数据块缓冲区中开始读取的位置。置该
// 缓冲区已修改标志。
		c = pos % BLOCK_SIZE;
		p = c + bh->b_data;
		bh->b_dirt = 1;
// 从开始读写位置到块末共可写入c=(BLOCK_SIZE-c)个字节。若c 大于剩余还需写入的字节数
// (len-i)，则此次只需再写入c=(len-i)即可。
		c = BLOCK_SIZE-c;
		if (c > len-i) c = len-i;
// 文件读写指针前移此次需写入的字节数。如果当前文件读写指针位置值超过了文件的大小，则
// 修改i 节点中文件大小字段，并置i 节点已修改标志。
		pos += c;
		if (pos > inode->i_size) {
			inode->i_size = pos;
			inode->i_dirt = 1;
		}
// 已写入字节计数累加此次写入的字节数c。从用户缓冲区buf 中复制c 个字节到高速缓冲区中p
// 指向开始的位置处。然后释放该缓冲区。
		i += c;
		while (c-->0)
			*(p++) = *(buf++);
		brelse(bh);
	}
// 更改文件修改时间为当前时间。
	//inode->i_mtime = CURRENT_TIME;
// 如果此次操作不是在文件尾添加数据，则把文件读写指针调整到当前读写位置，并更改i 节点修改
// 时间为当前时间。
	//if (!(filp->f_flags & O_APPEND)) {
		filp->f_pos = pos;
		//inode->i_ctime = CURRENT_TIME;
	//}
// 返回写入的字节数，若写入字节数为0，则返回出错号-1。
	return (i?i:-1);
}
struct buffer_head * getblk(int dev,int block)
{
	struct buffer_head * tmp, * bh;

repeat:
	// 搜索hash 表，如果指定块已经在高速缓冲中，则返回对应缓冲区头指针，退出。
	if (bh = get_hash_table(dev,block))
		return bh;
// 扫描空闲数据块链表，寻找空闲缓冲区。
// 首先让tmp 指向空闲链表的第一个空闲缓冲区头。
	for(int i=0;i<NR_BUFFERHEADS;i++)
	{
		// 如果该缓冲区正被使用（引用计数不等于0），则继续扫描下一项。
		if (bhs[i].b_count)
			continue;
// 如果缓冲头指针bh 为空，或者tmp 所指缓冲头的标志(修改、锁定)权重小于bh 头标志的权重，
// 则让bh 指向该tmp 缓冲区头。如果该tmp 缓冲区头表明缓冲区既没有修改也没有锁定标志置位，
// 则说明已为指定设备上的块取得对应的高速缓冲区，则退出循环。
		if (!bh || BADNESS(&bhs[i])<BADNESS(bh)) {
			bh = &bhs[i];
			if (!BADNESS(&bhs[i]))
				break;
		}
		
	}
// 	tmp = free_list;
// 	do {

// /* 重复操作直到找到适合的缓冲区 */
// 	} while ((tmp = tmp->b_next_free) != free_list);
// 如果所有缓冲区都正被使用（所有缓冲区的头部引用计数都>0），
// 则睡眠，等待有空闲的缓冲区可用。
	if (!bh) {
		//sleep_on(&buffer_wait);
		set_proc_stat(cur_proc,SUSPENDED);
		goto repeat;
	}
	// 等待该缓冲区解锁（如果已被上锁的话）。
	wait_on_buffer(bh);
	// 如果该缓冲区又被其它任务使用的话，只好重复上述过程。
	if (bh->b_count)
		goto repeat;
// 如果该缓冲区已被修改，则将数据写盘，并再次等待缓冲区解锁。如果该缓冲区又被其它任务使用
// 的话，只好再重复上述过程。
	while (bh->b_dirt) {
		sync_dev(bh->b_dev);
		wait_on_buffer(bh);
		if (bh->b_count)
			goto repeat;
	}
/* 注意！！当进程为了等待该缓冲块而睡眠时，其它进程可能已经将该缓冲块 */
/* 加入进高速缓冲中，所以要对此进行检查。 */
// 在高速缓冲hash 表中检查指定设备和块的缓冲区是否已经被加入进去。如果是的话，就再次重复
// 上述过程。
	if (find_buffer(dev,block))
		goto repeat;
/* OK，最终我们知道该缓冲区是指定参数的唯一一块， */
/* 而且还没有被使用(b_len=0)，未被上锁(b_lock=0)，并且是干净的（未被修改的） */
// 于是让我们占用此缓冲区。置引用计数为1，复位修改标志和有效(更新)标志。
	bh->b_count=1;
	bh->b_dirt=0;
	bh->b_uptodate=0;
// 从hash 队列和空闲块链表中移出该缓冲区头，让该缓冲区用于指定设备和其上的指定块。
	//remove_from_queues(bh);
	bh->b_dev=dev;
	bh->b_blocknr=block;
// 然后根据此新的设备号和块号重新插入空闲链表和hash 队列新位置处。并最终返回缓冲头指针。
	//insert_into_queues(bh);
	return bh;
}

//// 释放指定的缓冲区。
// 等待该缓冲区解锁。引用计数递减1。唤醒等待空闲缓冲区的进程。
void brelse(struct buffer_head * buf)
{
	if (!buf)		// 如果缓冲头指针无效则返回。
		return;
	wait_on_buffer(buf);
	if (!(buf->b_count--))
		return ;//panic("Trying to free free buffer");
	//wake_up(&buffer_wait);
}

/*
 * 从设备上读取指定的数据块并返回含有数据的缓冲区。如果指定的块不存在
 * 则返回NULL。
 */
//// 从指定设备上读取指定的数据块。
struct buffer_head * bread(int dev,int block)
{
	struct buffer_head * bh;

// 在高速缓冲中申请一块缓冲区。如果返回值是NULL 指针，表示内核出错，死机。
	if (!(bh=getblk(dev,block)))
		return NULL;//panic("bread: getblk returned NULL\n");
// 如果该缓冲区中的数据是有效的（已更新的）可以直接使用，则返回。
	if (bh->b_uptodate)
		return bh;
// 否则调用ll_rw_block()函数，产生读设备块请求。并等待缓冲区解锁。
	ll_rw_block(READ,bh);
	wait_on_buffer(bh);
// 如果该缓冲区已更新，则返回缓冲区头指针，退出。
	if (bh->b_uptodate)
		return bh;
// 否则表明读设备操作失败，释放该缓冲区，返回NULL 指针，退出。
	brelse(bh);
	return NULL;
}

//把块设备的存储块映射到内存中。
int bmap(struct m_inode *inode,int block,int create)
{
	struct buffer_head * bh;
	int i;

// 如果块号小于0，则死机。
	if (block<0)
		return -1;//panic("_bmap: block<0");
// 如果块号大于直接块数+ 间接块数+ 二次间接块数，超出文件系统表示范围，则死机。
	if (block >= 7+512+512*512)
		return -1;//panic("_bmap: block>big");
// 如果该块号小于7，则使用直接块表示。
	if (block<7) {
// 如果创建标志置位，并且i 节点中对应该块的逻辑块（区段）字段为0，则向相应设备申请一磁盘
// 块（逻辑块，区块），并将盘上逻辑块号（盘块号）填入逻辑块字段中。然后设置i 节点修改时间，
// 置i 节点已修改标志。最后返回逻辑块号。
		if (create && !inode->i_zone[block])
			if (inode->i_zone[block]=new_block(inode->i_dev)) {
				//inode->i_ctime=CURRENT_TIME;
				inode->i_dirt=1;
			}
		return inode->i_zone[block];
	}
// 如果该块号>=7，并且小于7+512，则说明是一次间接块。下面对一次间接块进行处理。
	block -= 7;
	if (block<512) {
// 如果是创建，并且该i 节点中对应间接块字段为0，表明文件是首次使用间接块，则需申请
// 一磁盘块用于存放间接块信息，并将此实际磁盘块号填入间接块字段中。然后设置i 节点
// 已修改标志和修改时间。
		if (create && !inode->i_zone[7])
			if (inode->i_zone[7]=new_block(inode->i_dev)) {
				inode->i_dirt=1;
				//inode->i_ctime=CURRENT_TIME;
			}
// 若此时i 节点间接块字段中为0，表明申请磁盘块失败，返回0 退出。
		if (!inode->i_zone[7])
			return 0;
// 读取设备上的一次间接块。
		if (!(bh = bread(inode->i_dev,inode->i_zone[7])))
			return 0;
// 取该间接块上第block 项中的逻辑块号（盘块号）。
		i = ((unsigned short *) (bh->b_data))[block];
// 如果是创建并且间接块的第block 项中的逻辑块号为0 的话，则申请一磁盘块（逻辑块），并让
// 间接块中的第block 项等于该新逻辑块块号。然后置位间接块的已修改标志。
		if (create && !i)
			if (i=new_block(inode->i_dev)) {
				((unsigned short *) (bh->b_data))[block]=i;
				bh->b_dirt=1;
			}
// 最后释放该间接块，返回磁盘上新申请的对应block 的逻辑块的块号。
		brelse(bh);
		return i;
	}
// 程序运行到此，表明数据块是二次间接块，处理过程与一次间接块类似。下面是对二次间接块的处理。
// 将block 再减去间接块所容纳的块数(512)。
	block -= 512;
// 如果是新创建并且i 节点的二次间接块字段为0，则需申请一磁盘块用于存放二次间接块的一级块
// 信息，并将此实际磁盘块号填入二次间接块字段中。之后，置i 节点已修改编制和修改时间。
	if (create && !inode->i_zone[8])
		if (inode->i_zone[8]=new_block(inode->i_dev)) {
			inode->i_dirt=1;
			//inode->i_ctime=CURRENT_TIME;
		}
// 若此时i 节点二次间接块字段为0，表明申请磁盘块失败，返回0 退出。
	if (!inode->i_zone[8])
		return 0;
// 读取该二次间接块的一级块。
	if (!(bh=bread(inode->i_dev,inode->i_zone[8])))
		return 0;
// 取该二次间接块的一级块上第(block/512)项中的逻辑块号。
	i = ((unsigned short *)bh->b_data)[block>>9];
// 如果是创建并且二次间接块的一级块上第(block/512)项中的逻辑块号为0 的话，则需申请一磁盘
// 块（逻辑块）作为二次间接块的二级块，并让二次间接块的一级块中第(block/512)项等于该二级
// 块的块号。然后置位二次间接块的一级块已修改标志。并释放二次间接块的一级块。
	if (create && !i)
		if (i=new_block(inode->i_dev)) {
			((unsigned short *) (bh->b_data))[block>>9]=i;
			bh->b_dirt=1;
		}
	brelse(bh);
// 如果二次间接块的二级块块号为0，表示申请磁盘块失败，返回0 退出。
	if (!i)
		return 0;
// 读取二次间接块的二级块。
	if (!(bh=bread(inode->i_dev,i)))
		return 0;
// 取该二级块上第block 项中的逻辑块号。(与上511 是为了限定block 值不超过511)
	i = ((unsigned short *)bh->b_data)[block&511];
// 如果是创建并且二级块的第block 项中的逻辑块号为0 的话，则申请一磁盘块（逻辑块），作为
// 最终存放数据信息的块。并让二级块中的第block 项等于该新逻辑块块号(i)。然后置位二级块的
// 已修改标志。
	if (create && !i)
		if (i=new_block(inode->i_dev)) {
			((unsigned short *) (bh->b_data))[block&511]=i;
			bh->b_dirt=1;
		}
// 最后释放该二次间接块的二级块，返回磁盘上新申请的对应block 的逻辑块的块号。
	brelse(bh);
	return i;
}

struct buffer_head * get_hash_table(int dev, int block)
{
	struct buffer_head * bh;

	for (;;) {
		// 在高速缓冲中寻找给定设备和指定块的缓冲区，如果没有找到则返回NULL，退出。
		if (!(bh=find_buffer(dev,block)))
			return NULL;
		// 对该缓冲区增加引用计数，并等待该缓冲区解锁（如果已被上锁）。
		bh->b_count++;
		wait_on_buffer(bh);
		// 由于经过了睡眠状态，因此有必要再验证该缓冲区块的正确性，并返回缓冲区头指针。
		if (bh->b_dev == dev && bh->b_blocknr == block)
			return bh;
// 如果该缓冲区所属的设备号或块号在睡眠时发生了改变，则撤消对它的引用计数，重新寻找。
		bh->b_count--;
	}
}
struct buffer_head* find_buffer(int dev,int block)
{
	for(int i=0;i<NR_BUFFERHEADS;i++)
	{
		if(bhs[i].b_dev==dev&&bhs[i].b_blocknr==block)
			return &bhs[i];
	}
	return NULL;
}

int wait_on_buffer(struct buffer_head* bh)
{
	while(bh->b_lock);
	return 0;
}

//// 对指定设备进行高速缓冲数据与设备上数据的同步操作。
int sync_dev(int dev)
{
	int i;
	struct buffer_head * bh;

	bh = bhs;
	for (i=0 ; i<NR_BUFFERHEADS ; i++,bh++) {
		if (bh->b_dev != dev)
			continue;
		wait_on_buffer(bh);
		if (bh->b_dev == dev && bh->b_dirt)
			ll_rw_block(WRITE,bh);
	}
	sync_inodes();			// 将i 节点数据写入高速缓冲。
	bh = bhs;
	for (i=0 ; i<NR_BUFFERHEADS ; i++,bh++) {
		if (bh->b_dev != dev)
			continue;
		wait_on_buffer(bh);
		if (bh->b_dev == dev && bh->b_dirt)
			ll_rw_block(WRITE,bh);
	}
	return 0;
}

//// 同步所有i 节点。
// 同步内存与设备上的所有i 节点信息。
void sync_inodes(void)
{
	int i;
	struct m_inode * inode;


	inode = 0+inodes;		// 让指针首先指向i 节点表指针数组首项。
	for(i=0 ; i<NR_INODE ; i++,inode++) {	// 扫描i 节点表指针数组。
		while(inode->i_lock);
		//wait_on_inode(inode);				// 等待该i 节点可用（解锁）。
		if (inode->i_dirt && !inode->i_pipe)	// 如果该i 节点已修改且不是管道节点，
			write_inode(inode);					// 则写盘。
	}
}

//// 将指定i 节点信息写入设备（写入缓冲区相应的缓冲块中，待缓冲区刷新时会写入盘中）。
static void write_inode(struct m_inode * inode)
{
	struct super_block * sb;
	struct buffer_head * bh;
	int block;

// 首先锁定该i 节点，如果该i 节点没有被修改过或者该i 节点的设备号等于零，则解锁该i 节点，
// 并退出。
	inode->i_lock=1;
	if (!inode->i_dirt || !inode->i_dev) {
		inode->i_lock=0;
		return;
	}
// 获取该i 节点的超级块。
	if (!(sb=sget(inode->i_dev)))
		return -1;//panic("trying to write inode without device");
// 该i 节点所在的逻辑块号= (启动块+超级块) + i 节点位图占用的块数+ 逻辑块位图占用的块数+
// (i 节点号-1)/每块含有的i 节点数。
	block = 2 + sb->s_imap_blocks + sb->s_zmap_blocks +
		(inode->i_num-1)/INODES_PER_BLOCK;
// 从设备上读取该i 节点所在的逻辑块。
	if (!(bh=bread(inode->i_dev,block)))
		return -1;//panic("unable to read i-node block");
// 将该i 节点信息复制到逻辑块对应该i 节点的项中。
	((struct d_inode *)bh->b_data)
		[(inode->i_num-1)%INODES_PER_BLOCK] =
			*(struct d_inode *)inode;
// 置缓冲区已修改标志，而i 节点修改标志置零。然后释放该含有i 节点的缓冲区，并解锁该i 节点。
	bh->b_dirt=1;
	inode->i_dirt=0;
	brelse(bh);
	inode->i_lock=0;
}

//// 低层读写数据块函数。
// 该函数主要是在fs/buffer.c 中被调用。实际的读写操作是由设备的request_fn()函数完成。
// 对于硬盘操作，该函数是do_hd_request()。（kernel/blk_drv/hd.c,294）
void ll_rw_block (int rw, struct buffer_head *bh)
{
	unsigned int major;		// 主设备号（对于硬盘是3）。

// 如果设备的主设备号不存在或者该设备的读写操作函数不存在，则显示出错信息，并返回。
	if ((major = MAJOR (bh->b_dev)) >= NR_BLK_DEV ||
		!(blk_devs[major].request_fn))
	{
		printf ("Trying to read nonexistent block-device\n\r");
		return;
	}
	make_request (major, rw, bh);	// 创建请求项并插入请求队列。
}

int make_request(int major,int rw,struct buffer_head* bh)
{
	struct request *req;
	int rw_ahead;

/* WRITEA/READA 是特殊的情况 - 它们并不是必要的，所以如果缓冲区已经上锁，*/
/* 我们就不管它而退出，否则的话就执行一般的读/写操作。 */
// 这里'READ'和'WRITE'后面的'A'字符代表英文单词Ahead，表示提前预读/写数据块的意思。
// 当指定的缓冲区正在使用，已被上锁时，就放弃预读/写请求。
	if (rw_ahead = (rw == READA || rw == WRITEA))
	{
		if (bh->b_lock)
			return;
		if (rw == READA)
			rw = READ;
		else
			rw = WRITE;
	}
// 如果命令不是READ 或WRITE 则表示内核程序有错，显示出错信息并死机。
	if (rw != READ && rw != WRITE)
		return -1;//panic ("Bad block dev command, must be R/W/RA/WA");
// 锁定缓冲区，如果缓冲区已经上锁，则当前任务（进程）就会睡眠，直到被明确地唤醒。
	bh->b_lock=1;//lock_buffer (bh);
// 如果命令是写并且缓冲区数据不脏，或者命令是读并且缓冲区数据是更新过的，则不用添加
// 这个请求。将缓冲区解锁并退出。
	if ((rw == WRITE && !bh->b_dirt) || (rw == READ && bh->b_uptodate))
	{
		bh->b_lock=0;//unlock_buffer (bh);
		return;
	}
repeat:
/* 我们不能让队列中全都是写请求项：我们需要为读请求保留一些空间：读操作
* 是优先的。请求队列的后三分之一空间是为读准备的。
*/
// 请求项是从请求数组末尾开始搜索空项填入的。根据上述要求，对于读命令请求，可以直接
// 从队列末尾开始操作，而写请求则只能从队列的2/3 处向头上搜索空项填入。
	// if (rw == READ)
	// 	req = request + NR_REQUEST;	// 对于读请求，将队列指针指向队列尾部。
	// else
	// 	req = request + ((NR_REQUEST * 2) / 3);	// 对于写请求，队列指针指向队列2/3 处。
/* 搜索一个空请求项 */
// 从后向前搜索，当请求结构request 的dev 字段值=-1 时，表示该项未被占用。
	while (--req >= reqs)
		if (req->dev < 0)
			break;
/* 如果没有找到空闲项，则让该次新请求睡眠：需检查是否提前读/写 */
// 如果没有一项是空闲的（此时request 数组指针已经搜索越过头部），则查看此次请求是否是
// 提前读/写（READA 或WRITEA），如果是则放弃此次请求。否则让本次请求睡眠（等待请求队列
// 腾出空项），过一会再来搜索请求队列。
	if (req < reqs)
	{				// 如果请求队列中没有空项，则
		if (rw_ahead)
		{			// 如果是提前读/写请求，则解锁缓冲区，退出。
			bh->b_lock=0;//unlock_buffer (bh);
			return;
		}
		set_proc_stat(cur_proc,SUSPENDED);
		//sleep_on (&wait_for_request);	// 否则让本次请求睡眠，过会再查看请求队列。
		goto repeat;
	}
/* 向空闲请求项中填写请求信息，并将其加入队列中 */
// 请求结构参见（kernel/blk_drv/blk.h,23）。
	req->dev = bh->b_dev;		// 设备号。
	req->cmd = rw;		// 命令(READ/WRITE)。
	req->errors = 0;		// 操作时产生的错误次数。
	req->sector = bh->b_blocknr << 1;	// 起始扇区。(1 块=2 扇区)
	req->nr_sectors = 2;		// 读写扇区数。
	req->buffer = bh->b_data;	// 数据缓冲区。
	req->waiting = NULL;		// 任务等待操作执行完成的地方。
	req->bh = bh;			// 缓冲区头指针。
	req->next = NULL;		// 指向下一请求项。
	//add_request (major + blk_dev, req);	// 将请求项加入队列中(blk_dev[major],req)。
}
int do_req()
{
	struct blk_dev_struct *dev;
	for(int i=0;i<NR_REQUEST;i++)
	{
		if(reqs[i].dev>=0&&reqs[i].waiting==NULL)
		{
			dev=blk_devs+MAJOR(reqs[i].dev);
			if(!dev->current_request)
			{
				dev->current_request=&reqs[i];
				dev->request_fn();
			}
		}
	}
}

//// 打开（或创建）文件系统调用函数。
// 参数filename 是文件名，flag 是打开文件标志：只读O_RDONLY、只写O_WRONLY 或读写O_RDWR，
// 以及O_CREAT、O_EXCL、O_APPEND 等其它一些标志的组合，若本函数创建了一个新文件，则mode
// 用于指定使用文件的许可属性，这些属性有S_IRWXU(文件宿主具有读、写和执行权限)、S_IRUSR
// (用户具有读文件权限)、S_IRWXG(组成员具有读、写和执行权限)等等。对于新创建的文件，这些
// 属性只应用于将来对文件的访问，创建了只读文件的打开调用也将返回一个可读写的文件句柄。
// 若操作成功则返回文件句柄(文件描述符)，否则返回出错码。(参见sys/stat.h, fcntl.h)
int sys_open(const char * filename,int flag,int mode)
{
	struct m_inode * inode;
	struct file * f;
	int i,fd;
	extern struct process task[];
// 将用户设置的模式与进程的模式屏蔽码相与，产生许可的文件模式。
	//mode &= 0777 & ~current->umask;
// 搜索进程结构中文件结构指针数组，查找一个空闲项，若已经没有空闲项，则返回出错码。
	for(fd=0 ; fd<NR_OPEN ; fd++)
		if (!task[cur_proc].openf[fd])
			break;
	if (fd>=NR_OPEN)
		return -EINVAL;
// 设置执行时关闭文件句柄位图，复位对应比特位。
	//current->close_on_exec &= ~(1<<fd);
// 令f 指向文件表数组开始处。搜索空闲文件结构项(句柄引用计数为0 的项)，若已经没有空闲
// 文件表结构项，则返回出错码。
	f=0+files;
	for (i=0 ; i<NR_FILE ; i++,f++)
		if (!f->f_count) break;
	if (i>=NR_FILE)
		return -EINVAL;
// 让进程的对应文件句柄的文件结构指针指向搜索到的文件结构，并令句柄引用计数递增1。
	(task[cur_proc].openf[fd]=f)->f_count++;
// 调用函数执行打开操作，若返回值小于0，则说明出错，释放刚申请到的文件结构，返回出错码。
	if ((i=open_namei(filename,flag,mode,&inode))<0) {
		task[cur_proc].openf[fd]=NULL;
		f->f_count=0;
		return i;
	}
/* ttys 有些特殊（ttyxx 主号==4，tty 主号==5）*/
// 如果是字符设备文件，那么如果设备号是4 的话，则设置当前进程的tty 号为该i 节点的子设备号。
// 并设置当前进程tty 对应的tty 表项的父进程组号等于进程的父进程组号。
// 	if (S_ISCHR(inode->i_mode))
// 		if (MAJOR(inode->i_zone[0])==4) {
// 			if (task[cur_proc].openf[fd]->leader && task[cur_proc].openf[fd]->tty<0) {
// 				current->tty = MINOR(inode->i_zone[0]);
// 				tty_table[current->tty].pgrp = current->pgrp;
// 			}
// // 否则如果该字符文件设备号是5 的话，若当前进程没有tty，则说明出错，释放i 节点和申请到的
// // 文件结构，返回出错码。
// 		} else if (MAJOR(inode->i_zone[0])==5)
// 			if (current->tty<0) {
// 				iput(inode);
// 				current->filp[fd]=NULL;
// 				f->f_count=0;
// 				return -EPERM;
// 			}
/* 同样对于块设备文件：需要检查盘片是否被更换 */
// 如果打开的是块设备文件，则检查盘片是否更换，若更换则需要是高速缓冲中对应该设备的所有
// 缓冲块失效。
	if (S_ISBLK(inode->i_mode))
		check_disk_change(inode->i_zone[0]);
// 初始化文件结构。置文件结构属性和标志，置句柄引用计数为1，设置i 节点字段，文件读写指针
// 初始化为0。返回文件句柄。
	f->f_mode = inode->i_mode;
	f->f_flags = flag;
	f->f_count = 1;
	f->f_inode = inode;
	f->f_pos = 0;
	return (fd);
}
