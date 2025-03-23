# Gamessis Kernel

Gamessis是一个作者处于兴趣和学习写的x86_64玩具操作系统内核，尚未开发完成。

目前实现了vfs，内存管理，进程调度，中断处理，系统调用，设备管理等。
正在完善的还有gui，shell等。

# 使用方法

**编译**

运行

```makefile
make knl
```

编译内核。生成的文件在bin目录中，名为gmsknl.img。

请使用grub+multiboot2加载。

**用虚拟机运行**

运行

```makefile
make cpknl
```

把镜像安装到hda.img中，之后就可以用虚拟机运行。注意需要OVMF。

## 文件目录介绍

### knl
内核，包括进程调度，线程，系统调用，设备/驱动管理，模块加载和程序运行。

### mm
内存管理，包括虚拟内存，slab分配器，页缓存，内存回收，内存碎片整理。

### fs
文件系统，包括VFS，fat32等。

### com
公共库，字符串处理和内存操作等

### arch
架构相关，目前只有x86，包括中断处理，loader，gdt等。

### drivers
设备驱动，包括硬盘，键盘，鼠标等。

### usr
用户空间，包括shell，dl，工具等。

### gui
图形用户界面，包括窗口管理器，桌面环境，图形库等。

### bin
生成文件目录

### include
头文件目录

### tools
编译工具

### res
非代码的资源文件

### rd.img

ramdisk，会被编译到内核镜像中，测试用。