#include "memman.h"
#include "sys/types.h"
#include "vfs.h"
#include "errno.h"
#include <sys/stat.h>
#include "fcntl.h"
typedef struct fifo
{
    struct index_node* i_file;
    unsigned char*     data;
    size_t             size;
    long               r_ptr;
    long               w_ptr;
    struct List        node;
} fifo_t;

static fifo_t* all_fifos;

void fifo_init(void)
{
    all_fifos = NULL;
}


long fifo_remove(struct index_node* inode, struct dir_entry* dentry)
{
    fifo_t* fifo = all_fifos;
    while (fifo != NULL) {
        if (fifo->i_file == dentry) {
            // Remove the FIFO from the list and free its resources
            list_drop(&fifo->node);
            kfree(fifo->data);
            kfree(fifo);
            return 0;
        }
        fifo = fifo->node.next;
    }
    return -ENOENT;
}

int fifo_open(struct index_node* inode, struct file* filp)
{
    for (fifo_t* p = all_fifos; p; p = list_next(p, &p->node)) {
        if (p->i_file == inode) {
            // Open the FIFO for reading or writing based on the file mode
            if (filp->mode & O_RDONLY) {
                // Open for reading
                filp->position = p->r_ptr;
            }
            else if (filp->mode & O_WRONLY) {
                // Open for writing
                filp->position = p->w_ptr;
            }
            filp->private_data = p;
            return 0;
        }
    }
    return -ENOENT;
}

int fifo_close(struct index_node* inode, struct file* filp)
{
    // Implement close logic here

    return 0;
}

long fifo_read(struct file* filp, char* buf, unsigned long count, long* position)
{
    // Implement read logic here
    fifo_t* p = filp->private_data;
    if (!p) {
        return -ENOENT;
    }
    long bytes_read = 0;
    while (p->r_ptr != p->w_ptr && bytes_read < count) {
        buf[bytes_read++] = p->data[p->r_ptr++];
        if (p->r_ptr == PAGE_SIZE) {
            p->r_ptr = 0;
        }
    }
    *position = p->r_ptr;
    return bytes_read;
}

long fifo_write(struct file* filp, char* buf, unsigned long count, long* position)
{
    // Implement write logic here
    fifo_t* p = filp->private_data;
    if (!p) {
        return -ENOENT;
    }
    long bytes_written = 0;
    while (p->w_ptr != p->r_ptr && bytes_written < count) {
        p->data[p->w_ptr++] = buf[bytes_written++];
        if (p->w_ptr == PAGE_SIZE) {
            p->w_ptr = 0;
        }
    }
    *position = p->w_ptr;
    return bytes_written;
}
long fifo_lseek(struct file* filp, long offset, long origin)
{
    return -1;
}
long fifo_ioctl(struct index_node* inode, struct file* filp, unsigned long cmd)
{
    return -1;
}
int fifo_create(const char* name, int flags)
{
    fifo_t* new_fifo = kmalloc(sizeof(fifo_t), NO_ALIGN);
    if (!new_fifo)
        return -ENOMEM;
    //创建缓冲
    new_fifo->data = kmalloc(PAGE_SIZE, NO_ALIGN);
    if (!new_fifo->data) {
        kfree(new_fifo);
        return -ENOMEM;
    }
    memset(new_fifo->data, 0, PAGE_SIZE);
    new_fifo->w_ptr = 0;   //初始化指针
    new_fifo->r_ptr = 0;

    struct dir_entry* tmp = create_node(name, S_IFIFO, -1);
    if (!tmp || (new_fifo->i_file = tmp->dir_inode) == NULL) {
        kfree(new_fifo->data);
        kfree(new_fifo);
        return -ENOMEM;
    }
    //设置该文件的读写操作为fifo的
    struct index_node* inode = new_fifo->i_file;
    inode->f_ops->open       = &fifo_open;
    inode->f_ops->read       = &fifo_read;
    inode->f_ops->write      = &fifo_write;
    inode->f_ops->close      = &fifo_close;
    inode->f_ops->lseek      = &fifo_lseek;
    inode->f_ops->ioctl      = &fifo_ioctl;

    inode->inode_ops->rmdir = &fifo_remove;
    //...

    if (!all_fifos) {
        all_fifos = new_fifo;
    }
    else {
        list_add(&new_fifo->node, &all_fifos->node);
    }
    return 0;
}

int sys_mkfifo(const char* pathname, mode_t mode)
{
    return fifo_create(pathname, mode);
}
