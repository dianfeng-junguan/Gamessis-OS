   URL: [1]http://www.plop.at/en/bootmanager/full.html

                               Table of Contents
     __________________________________________________________________

                                                   Last update 07/Feb/2012

    1. [2]Introduction
    2. [3]Overview of install/start modes
    3. [4]Features
    4. [5]Screenshots
    5. [6]Licence
    6. [7]Download
    7. [8]The Boot Manager
    8. [9]Install to the hard disk MBR (Master Boot Record)
    9. [10]plpbt.bin - LiveCD and other ways to start the Boot Manager
   10. [11]Create your own ISO file with your modified plpbt.bin
   11. [12]plpcfgbt - configure plpbt.bin
   12. [13]plpbt.bin parameters
   13. [14]Create a PCI boot manager option ROM (save in bios)
   14. [15]plpbt4win
   15. [16]plpgenbtldr
   16. [17]PCMCIA CardBus driver - USB PC-Card
   17. [18]USB info
   18. [19]DOS and the USB driver
   19. [20]Detect the USB driver
   20. [21]Hidden partition / Cleared partition
   21. [22]Linux Boot Managers to the boot sector
   22. [23]Examples
   23. [24]NOD32 Virus report
   24. [25]FAQ's - Frequently asked questions

                                  Introduction
     __________________________________________________________________

   The Plop Boot Manager is a small program to boot different operating
   systems. The boot manager has a built-in ide cdrom and usb driver to
   access that hardware without the help/need of a bios. You can boot the
   operating systems from hard disk, floppy, CD/DVD or from USB. You can
   start the boot manager from floppy, CD, network and there are many more
   ways to start the boot manager. You can install the boot manager on
   your hard disk. There is no extra partition required for the boot
   manager.

   Programming language: Assembler
   Software developer: Elmar Hanlhofer

   The current version is [26]plpbt-5.0.14.zip.

                        Overview of install/start modes
     __________________________________________________________________

   Hard disk installation The boot manager will be installed as primary
   boot manager to your hard disk. No extra partition and required. The
   boot manager will be in the first sectors of your hard disk before the
   first partition begins. The boot manager starts even when no operating
   system exists.
   Start from external media
   Floppy
   CDROM/DVD
   USB drive It's not required to install the boot manager to your hard
   disk. You can start it from those media and use the boot manager with
   some limitations.
   Start from other boot managers
   LiLo
   Syslinux
   Grub
   Grub4Dos
   Grub2
   Windows boot.ini
   Windows BCD
   You can still use your preferred boot manager and additionally use
   features from the Plop Boot Manager (like boot the usb drive,...).
   The boot manager can run in hidden mode, so you have for example an
   entry in your preferred boot manager to boot the usb drive and when you
   use this entry then it starts immediately without any additional menu.
   This can be useful for the usb boot function.
   Start from network With help of pxelinux it's possible to start the
   boot manager from the network.
   Start from your bios as option rom You can store the boot manager as
   option rom in your bios. There is no need for any hard disk or anything
   else to start the boot manager. It can be used as PNP part of your bios
   or the boot manager can hook the INT19 to take control as first boot
   device.

                                    Features
     __________________________________________________________________

     * USB boot without BIOS support (UHCI, OHCI and EHCI)
     * CD/DVD boot without BIOS support (IDE)
     * PCMCIA CardBus support to enable boot from USB PC-Cards
     * Floppy boot
     * Different profiles for operating systems
     * Define up to 16 partitions
     * No extra partition for the boot manager
     * Hidden boot, maybe you have a rescue system installed and the user
       should not see that there is another system installed
     * Boot countdown
     * Hide partitions
     * Password protection for the computer and the boot manager setup
     * Backup of partition table data
     * Text mode user interface 80x50
     * Graphical user interface 640x480, 800x600, 1024x786, 1280x1024
     * MBR partition table edit
     * Start of the boot manager from hard disk, floppy, USB, CD, DVD
     * Starting from Windows boot menu
     * Starting from LILO, GRUB, Syslinux, Isolinux, Pxelinux (network)
     * It can be used as PCI option ROM in your BIOS
     * Access the whole USB hard disk (up to 2TB) even when the bios has a
       128 GiB limit
     * You can run the boot manager over the network
     * Start the network card bootrom from the boot manager to boot from
       the network

                                  Screenshots
     __________________________________________________________________

                                  Main menu
                                [27]mainmenu
                                    zoom

                            Main menu (text mode)
                                [28]mainmenu
                                    zoom

                             Profile partitions
                                [29]mainmenu
                                    zoom

                             MBR partition edit
                                [30]mainmenu
                                    zoom

                                    Licence
     __________________________________________________________________

   The Plop Boot Manager licence conditions:

   This licence conditions are also used for the boot manager tools that
   are written by Elmar Hanlhofer and not released under the GPL.
     * The programs are free to use for personal and commercial use.
     * The programs may not be sold^1.
     * The origin of this software must not be misrepresented; you must
       not claim that you wrote the original software. If you use this
       software in a product, an acknowledgment in the product
       documentation would be appreciated but is not required.
     * This software is provided 'as-is', without any express or implied
       warranty. In no event will the authors be held liable for any
       damages arising from the use of this software.

   ^1 You can add the tools to non-profit products for free.
   Example: You sell a CD and charge only the price for the blank CD
   without the work to create the final CD (and so on).

                                    Download
     __________________________________________________________________

    PayPal Please donate a few Euros or Dollars to keep the software for
                 free and the development continues. PayPal

          [31]plpbt-5.0.14.zip 2012-02-11 Plop Boot Manager 5.0.14
          [32]plpbt-5.0.13.zip 2011-08-14 Plop Boot Manager 5.0.13

                                    Tools

           [33]plpbtrom-0.6.zip 2011-08-14 Create a PCI Option ROM
     [34]plpbt-createiso.zip 2010-06-08 Create custom boot manager cd's
     [35]plpcfgbt-0.11.zip 2012-02-03 Tool to configure the boot manager
                       file plpbt.bin (Windows/Linux)
     [36]plpdisd-0.2.zip 2010-10-16 Deactivate the USB driver under DOS
        [37]plpchk-0.1.zip 2010-10-14 Detect the USB driver under DOS
         [38]plpmkboot-0.1.zip 2012-02-03 plpbt.bin native FAT boot

                                The Boot Manager
     __________________________________________________________________

   [39]1. Hotkeys - Global keys

   [40]2. Main menu
   [41]2.1. Main menu hotkeys

   [42]3. Setup
   [43]3.1. Partitions
            [44]Edit label
            [45]Select Device
            [46]Partition ID
            [47]Edit MBR/Import data
            [48]Clear partition data
            [49]Reset changes

   [50]3.2. Profiles
            [51]Edit label
            [52]Show in main menu
            [53]Linked partitions
            [54]Configure partition entries
            [55]Linked partitions - hotkeys
            [56]Clear profile data
            [57]Reset changes

   [58]3.3. Boot manager
            [59]Startmode
            [60]Boot countdown
            [61]Edit boot countdown
            [62]Select at start
            [63]Default profile
            [64]Show floppy boot
            [65]Show cdrom boot
            [66]Show usb boot
            [67]Force USB 1.1
            [68]Use Mass Stor Dev
            [69]Text mode after boot
            [70]Graphicmode
            [71]Zoom animation
            [72]Font
            [73]Starfield
            [74]Master password
            [75]Setup password

  1. Hotkeys - Global keys

     Cursor up/down     Move the bar
     Enter              Choose selection
     ESC                Close window
     CTRL - ESC         Switch to text mode
     CTRL - PAGE UP     Switch to higher screen resolution
     CTRL - PAGE DOWN   Switch to lower screen resolution
     z                  Enable/Disable window zoom animation
     __________________________________________________________________

  2. Main menu

     In the main menu you see all visible profiles to boot an operating
     system. You can start an operating system from floppy, cd/dvd, usb
     or network. You can go to the setup of the boot manager, partitions
     and profiles. If your bios supports APM, you can shut down your
     computer.

  2.1. Main menu hotkeys

     1-9  Boot profile
     q    Quick boot, open a list of all possible hardcoded partitions to boot
     w    Write MBR with the profile settings, but do not boot
     f    Boot floppy
     c    Boot CD/DVD
     u    Boot USB
     n    Network boot

     Special additional keys for USB boot:
     * Press SHIFT-u to force USB 1.1
     * Press CTRL-u to wait for a key press before starting the operating
       system. When a drive was found, then you can press "s" to skip the
       device or you can boot from the drive.
     * Press ALT-u to wait for a key press before detecting the usb device
       type. When a device was found, then you can press "s" to skip the
       device or you can boot from the device when it's as mass storage
       device.

     Difference CTRL-u and ALT-u:
   When you use CTRL-u and the boot manager finds an usb device, then the
       boot manager identifies it. Because of the stripped down usb
       implementation, it's possible that the boot manager sometimes hangs
       on some computers. With ALT-u, the identification of the usb drives
       happens when you press enter. When you press "s", then the boot
       manager skips the device and it should not hang.
     __________________________________________________________________

  3. Setup

  3.1. Partitions

     You can manage your partitions here. The install program creates an
     entry for all primary partitions it finds. The names are from HDA1
     up to HDD4. HD means hard disk. HDA stands for hard disk A and is
     the first hard disk. The numbers 1-4 are the numbers of the primary
     partitions.

     Notice for linux users: HDA has nothing to do with the devices in
     linux like /dev/hda.

    Edit label

     You can change the label for the partition. This label is used in
     the boot manager. The maximum length is 16 chars.

    Select Device

     Here, you choose the hard disk of the partition.

     HDA = Hard disk 1
     HDB = Hard disk 2
     HDC = Hard disk 3
     HDD = Hard disk 4

    Partition ID

     There are 2 ways to set the ID of a partition.

    1. Enter partition ID

     You can enter the hexadecimal value for the partition.

    2. Select ID from list

     This list has the mostly used partition ID's. If the requested ID is
     not in the list, then use Enter partition ID.

    Edit MBR/Import data

     This is used to change the values of partitions in the MBR.

     BP means boot manager partition. This values are stored in the boot
     manager.

     P1-P4 this are the current values of the primary partitions in the
     MBR.

     You can edit the hexadecimal values in the partition table. You can
     select a row with s (select) and paste the values to the row where
     the cursor is with p. With this function, you can import partition
     values to the boot manager or change values in the MBR. This can be
     very useful in emergency cases.

    Clear partition data

     Clearing the data means clearing of the partition data in the boot
     manager. The data on the partition itself is unchanged.

    Reset changes

     Use it if you changed something and you want to restore the whole
     values of the partition in the boot manager. This is possible until
     you close the partition edit window.

  3.2. Profiles

     Profiles are used to start different operating systems from
     different hard disks and partitions. It's also possible to detect
     changes in the MBR made by other software and import or forget the
     changes.

     If you have an operating system installed and you install the boot
     manager, the installer creates a profile to boot the current
     operating system.

    Edit label

     You can edit the label of the profile. This label is shown in the
     main menu. It's useful to use a label to see what operating system
     is going to boot. The maximum length is 16 chars.

    Show in main menu

     With this option you select if the profile is shown in the main menu
     or not. Only visible profiles can be booted. It also has effects on
     the default profile in the boot manager setup.

    Linked partitions

     You select from which hard disk, partition and bios device number
     you want to boot with this profile. You can also select what
     partitions or cleared partitions should be used for the MBR.

    Configure partition entries

     There are 3 states for a partition entry

    1. a selected partition

     Press enter to choose a partition from a list with all partition of
     this hard disk available from Partitions.

     If another software changes this entry in the MBR, the boot manager
     detects this change at the next startup. You can choose if you want
     to import the new values or forget them.

    2. don't touch

     The partition entry in the MBR will not be changed from the boot
     manager. That is the default setting.

     If a software changes this entry in the MBR the boot manager cannot
     detect this change.

    3. cleared

     The boot manager set's this entry to 0 in the MBR. An operating
     system cannot detect that there is/was a partition.

     WARNING: if the boot manager has not stored the values of the
     partition in "Partitions" then you lose the partition values in the
     MBR and you cannot access the data on the partition. It's possible
     to restore those values, but it's better, easier and safe to store
     the values in Partitions.

     Partition programs will say this is unallocated space! Do not
     partition this space! You can lose data if you do it wrong.

    Linked partitions - hotkeys

     b set boot partition. You select, what partition you want to boot
     with this profile. The boot manager set a bios drive number
     automatically. It's possible to change it with another key.

     c clear partition. You set this entry to "cleared" and the boot
     manager clears this entry in the MBR when you boot this profile.

     d don't touch. You set the entry to don't touch and the boot manager
     does not change this entry when you boot this profile.

     e edit boot flag. The boot flag has the bios drive number used by
     the boot sector routine. In some cases it's required to change this
     value.

     r remove boot flag. Here, you remove the boot flag from the profile.

     l set logical partition. You can set to boot from a logical
     partition 1-4 of an extended partition. Change the logical number by
     pressing "l". L1 = first logical, L2 = second, ...

    Clear profile data

     You can clear the profile data in the boot manager. The data in
     Partitions are not changed.

    Reset changes

     Use it if you changed something and want to restore the whole values
     of the profile in the boot manager. This is possible until you close
     the profile edit window.

  3.3. Boot manager

    Startmode

     The boot manager has two modes to start. With the user interface
     menu and hidden.

     For the hidden mode, you have to set the boot countdown and you have
     to select a default profile. The default profile boots after the
     countdown. The user cannot see that there is a boot manager in the
     background. If you want to go into the boot manager, then press ESC.

    Boot countdown

     You can enable and disable the countdown.

     If the boot countdown is enabled, the boot manager waits the given
     time and starts after the countdown the last used profile or the
     default profile, depending on your settings.

    Edit boot countdown

     Choose between 1 and 99 seconds.

    Select at start

     At start, the boot manager set the bar to the selected option. This
     works for the hidden start mode too.

     You have the following options

    1. Last booted profile

    2. Default profile

    3. Floppy

    4. CDROM

    5. USB

    Default profile

     You can select the default profile from a list of all visible
     profiles.

    Show floppy boot

     Show the floppy boot option in the main menu.

    Show cdrom boot

     Show the cdrom boot option in the main menu.

    Show usb boot

     Show the USB boot option in the main menu.

    Force USB 1.1

     Use USB 1.1 controller even if there is a USB 2.0 controller.

     Mode 1: Ignore the EHCI Controller
     Mode 2: Setup EHCI Controller and set all ports to the companion
     host. Some controllers need this option to force usb 1.1.

    Use Mass Stor Dev

     Use Mass Storage Device. Boot the X mass storage device that was
     found. Other devices are ignored.

    Text mode after boot

     You can select the text mode during the startup of an operating
     system. Choose between "don't change" and 80x50.

    Graphicmode

     Select the screen resolution in the boot manager. Choose between
     text mode 80x50 and graphic mode 640x480, 800x600, 1024x768,
     1280x1024.

    Zoom animation

     Enable and disable the window animation.

    Font

     Select the boot manager font or the bios font.

    Starfield

     Enable and disable the starfield animation.

    Master password

     Setup the master password. Disable the boot manager password
     protection with an empty password.

    Setup password

     Setup the setup password. Disable the boot manager setup password
     protection with an empty password.

               Install to the hard disk MBR (Master Boot Record)
     __________________________________________________________________

   You can install the boot manager to the MBR of your hard disk. When you
   do that, then the boot manager is the first program that is started
   when you boot from the hard disk. That means the boot manager is
   started before any operating system has been started. This installation
   has many benefits. Some features are only available when the boot
   manager is installed to the MBR. When you don't want to install the
   boot manager to the MBR, then you can start the boot manager in many
   different ways. See [76]plpbt.bin - LiveCD and ...

   Warning Linux users: Install LILO or GRUB to the boot sector of your
   Linux instead of the Master Boot Record (MBR). The Plop Boot Manager is
   not a Linux loader and cannot start Linux without LILO, GRUB, Syslinux
   and similar! See [77]Linux Boot Managers.

   [78]1. The install program
   [79]1.1 Program functions

   [80]2. Uninstall

   [81]3. Methods to start the install program
   [82]3.1. Floppy
   [83]3.2. CD
   [84]3.3. DOS
   [85]3.4. Windows boot menu (NT, 2K, XP, VISTA, Win7)
   [86]3.5. Syslinux, Isolinux, Pxelinux (Network)
   [87]3.6. LILO
   [88]3.7. GRUB / grub4dos
   [89]3.8. GRUB2
   [90]3.9. From Network
   [91]3.10. Native from a FAT file system

  1. The install program
     __________________________________________________________________

   There are 2 versions of the install program. Basically both versions do
   the same. The only difference is that plpinst.com creates a backup file
   plpback.bin to restore hard disk sectors for a complete boot manager
   uninstall. The second version plpinstc.com skips the backup part. You
   have to use the second version for installation from write protected
   media like CD's or when you install from network or any other boot
   manager.

  1.1 Program functions
     __________________________________________________________________

    1. Full boot manager install

     With this option you install the boot manager to your hard disk. If
     you have an installed operating system, then the install program
     creates a profile for you to boot this operating system.

     With the installation from floppy, the install program makes a
     backup of the sectors where the boot manager will be installed. The
     install program writes the backup to the floppy disk. With this
     backup it's possible to remove the boot manager completely from your
     hard disk. If you use the CD installation, then it's not possible to
     restore the sectors. In this case the uninstall routine creates a
     new MBR to boot the current operating system. The partition table
     data won't be changed.

    2. Rewrite loader

     A small program (the loader) is required in the MBR to start the
     boot manager. Operating systems like Windows XP are writing during
     the installation their own small program into the MBR. If you
     install Windows XP after the boot manager, then Windows XP will
     start instead of the boot manager, because the loader is overwritten
     with the program from Windows XP. To setup that the boot manager
     starts before Windows XP you have to use Rewrite loader.

    3. Boot Manager update

     With this, you can update the boot manager. But only updates with
     boot manager v5 are working.

    4. Complete uninstall

     Warning, this option is only available with the installation from
     floppy.

     The install program takes the backup that was saved on the floppy
     disk and writes it back to the hard disk.

     Warning, if you changed anything with the partition table, then
     don't use this option!

    5. Short uninstall

     With this option, the program writes a new MBR to start the current
     operating system. The partition table will be unchanged.

    6. Set Boot Manager screen to text mode

     Configures the Boot Manager to start in text mode.

    7. Change destination hard disk

     Set destination hard disk to install the boot manager.

    8. Boot Manager hotkeys

     See [92]Hotkeys.

    9. Reboot

     The computer will be restarted.

  2. Uninstall
     __________________________________________________________________

   When you installed the boot manager to the MBR, then you can remove the
   boot manager in the same way that you used to install the boot manager,
   but you have to use the option 4 or 5 in the install program.

   When you don't want to use the install program to remove the boot
   manager, then you can use any other program that writes a new program
   to the MBR. Example FIXMBR, or "fdisk /mbr" and so on. Or you install
   another boot manager to the MBR.

  3. Methods to start the install program
     __________________________________________________________________

  3.1. Floppy
     __________________________________________________________________

   You create the install floppy with a floppy disk image. A floppy disk
   image is a file that contains every sector of the floppy disk. You
   cannot copy the image file on a floppy disk like a common file. It's
   required to use a special program that writes sector per sector of the
   image file to the floppy disk sectors. There are many programs
   available to do this.

   Download the current boot manager [93]plpbt-5.0.14.zip. Extract it to
   get the floppy disk image. You find the disk image in the install
   directory. The name of the file is plpbtin.img

   How to create the floppy:

   DOS: You can use [94]diskimg.com with diskimg -d a -w plpbtin.img

   Windows: Write the disk image with the program [95]rawwritewin to the
   floppy disk

   Linux: dd if=plpbtin.img of=/dev/fd0

  3.2. CD
     __________________________________________________________________

   Download the current boot manager [96]plpbt-5.0.14.zip. Extract it to
   get the iso file. You find the iso file in the install directory. The
   name of the file is plpbtin.iso

   Notice: The CD installer makes no backup for a complete uninstall. See
   [97]The install program.

   Windows:

     You can use [98]Nero, or the free program [99]CDBurnerXP, or any
     other program that can burn ISO images.

     Use the option like burn ISO on CD or burn ISO Image. Then choose
     the boot manager ISO and burn it.

   Linux:

     [100]cdrecord is the linux program to burn ISO images to a CD.

     Burn the ISO with cdrecord: cdrecord -v dev=<devicename> <iso image>

     Example:
     If you access your CD burner with /dev/hdd
     cdrecord -v dev=/dev/hdd plpbtin.iso

  3.3. DOS
     __________________________________________________________________

   Download the current boot manager [101]plpbt-5.0.14.zip. Extract it to
   get the install program. In the install directory there are 2 install
   programs (plpinst.com and plpinstc.com) for using under DOS.

   plpinst.com creates a backup file plpback.bin for a complete boot
   manager uninstall. plpinstc.bin makes no backup. Use plpinstc.com for
   write protected media like CD's.

  3.4. Windows boot menu (NT, 2K, XP, VISTA, Win7)
     __________________________________________________________________

   Hint: When you don't want to install the boot manager to the MBR then
   see [102]plpbt.bin - LiveCD and ....

   Download the current boot manager [103]plpbt-5.0.14.zip. Extract the
   zip file. Open the folder Windows. You will find the batch program
   InstallToMBR. Run it as administrator in VISTA/WIN7 (right mouse click
   on the file and choose "Run as administrator"). The batch creates an
   entry in your windows boot menu called "Install the Plop Boot Manager
   to the MBR". When you reboot, then use the entry to install the Plop
   Boot Manager to the mbr.
   To remove the entry from the windows boot menu run the program
   c:\plop\plpbt4win. Use "l" to list all entries. Remove the entry with
   "r ID". ID is the number you have seen with "l". See [104]here for more
   info's to plpbt4win.

   Note: plpgenbtldr and contig are no longer required.

  3.5 Syslinux, Isolinux, Extlinux
     __________________________________________________________________

   Download the current boot manager [105]plpbt-5.0.14.zip. Extract it to
   get the boot manager install program. You find the install program
   plpinstc in the install directory.

   Add plpinstc.com to the config file
     * for Syslinux it's syslinux.cfg
     * for Isolinux it's isolinux.cfg
     * for Extlinux it's extlinux.conf

   Add the following lines to the config file
label plpinst
linux plpinstc.com

   Copy plpinstc to the same directory where the config file is.

   You start the install program when you select it from the menu or you
   enter plpinst at the Syslinux command prompt.

  3.6. LILO
     __________________________________________________________________

   Download the current boot manager [106]plpbt-5.0.14.zip. Extract it to
   get the boot manager install program. You find the install program
   plpinstc.com in the install directory.

   Copy plpinstc.com to /boot.

   Add to your /etc/lilo.conf the following
image=/boot/plpinstc.com
label=plop-install

   Run lilo to update lilo.

  3.7. GRUB / grub4dos
     __________________________________________________________________

   Download the current boot manager [107]plpbt-5.0.14.zip. Extract it to
   get the boot manager install program. You find the install program
   plpinstc.com in the install directory.

   Copy plpinstc.com to /boot.

   Add to your /boot/grub/menu.lst the following
title Install Plop Boot Manager
root (hd0,0)
kernel /boot/plpinstc.com

   When you reboot, you should be able to choose the install program from
   your grub menu.

   Info: You have to choose the correct root settings in your
   configuration or you get a "Error: file not found". See also this
   [108]Forum entry.

  3.8. GRUB2
     __________________________________________________________________

   Download the current boot manager [109]plpbt-5.0.14.zip. Extract it to
   get the boot manager install program. You find the install program
   plpinstc.com in the install directory.

   Copy plpinstc.com to /boot.

   Example file /etc/grub.d/40_custom
#!/bin/sh
exec tail -n +3 $0

menuentry "Install Plop Boot Manager" {
    set root='(hd0,1)'
    linux16 /boot/plpinstc.com
}

   Then run update-grub2 or update-grub.

   When you reboot, you should be able to choose the install program from
   your grub menu.

   Info: You have to choose the correct root settings in your
   configuration or you get a "Error: file not found". See also this
   [110]Forum entry.

  3.9. From network
     __________________________________________________________________

   A better documentation comes when I have more time. Meanwhile use the
   documentation of Plop Linux.

   You need for booting over network a DHCP, TFTP server and the program
   pxelinux.

   For [111]Linux click here, for [112]Windows click here

  3.10. Native from a FAT file system
     __________________________________________________________________

   Download the current boot manager [113]plpbt-5.0.14.zip. Extract it to
   get the boot manager install program. You find the install program
   plpinstc.com in the install directory.

   Copy plpinstc.com to the FAT formatted drive and rename it to
   plpbt.bin.

   Then use the program plpmkboot to make the drive bootable to start
   plpbt.bin.
     * Linux example: plpmkboot /dev/sdb1
     * Windows example: plpmkboot F:

   Hint: Do not use the other install program plpinst.com except on FAT12
   formatted drives.

          plpbt.bin - LiveCD and other ways to start the Boot Manager
     __________________________________________________________________

   When you don't want to install the boot manager to the MBR, then you
   have to use plpbt.bin. You can start plpbt.bin in many different ways.
   You cannot save boot manager settings when you use plpbt.bin. But you
   can use [114]plpcfgbt to configure plpbt.bin.

   [115]1. Floppy
   [116]2. CD (LiveCD)
   [117]3. Windows boot menu (NT, 2K, XP, VISTA and Win7)
   [118]4. Syslinux, Isolinux, Extlinux
   [119]5. LILO
   [120]6. GRUB / grub4dos
   [121]7. GRUB2
   [122]8. From network
   [123]9. Native from a FAT file system

  1. Floppy
     __________________________________________________________________

   A floppy disk image is a file that contains every sector of the floppy
   disk. You cannot copy the image file on a floppy disk like a common
   file. It's required to use a special program that writes sector per
   sector of the image file to the floppy disk sectors. There are many
   programs available to do this.

   Download the current boot manager [124]plpbt-5.0.14.zip. Extract it to
   get the floppy disk image plpbt.img.

   How to create the floppy:

   DOS: You can use [125]diskimg.com with diskimg -d a -w plpbt.img

   Windows: Write the disk image with the program [126]rawwritewin to the
   floppy disk

   Linux: dd if=plpbt.img of=/dev/fd0

   You can configure the plpbt.bin on the floppy with [127]plpcfgbt.

  2. CD (LiveCD)
     __________________________________________________________________

   Download the current boot manager [128]plpbt-5.0.14.zip. Extract it to
   get the iso file plpbt.iso.

   Customize ISO: See [129]Create your own ISO ...

   Windows:

     You can use [130]Nero, or the free program [131]CDBurnerXP, or any
     other program that can burn ISO images.

     Use the option like burn ISO on CD or burn ISO Image. Then choose
     the boot manager ISO and burn it.

   Linux:

     [132]cdrecord is the linux program to burn ISO images to a CD.

     Burn the ISO with cdrecord: cdrecord -v dev=<devicename> <iso image>

     Example:
     If you access your CD burner with /dev/hdd
     cdrecord -v dev=/dev/hdd plpbt.iso

  3. Windows boot menu (NT, 2K, XP, VISTA and Win7)
     __________________________________________________________________

   Download the current boot manager [133]plpbt-5.0.14.zip. Extract the
   zip file. Open the folder Windows. You will find the batch program
   InstallToBootMenu. Run it as administrator in VISTA/WIN7 (right mouse
   click on the file and choose "Run as administrator"). The batch creates
   an entry in your windows boot menu called "Plop Boot Manager". When you
   reboot, then use the entry to start the Plop Boot Manager.
   To remove the entry from the windows boot menu run the program
   c:\plop\plpbt4win. Use "l" to list all entries. Remove the entry with
   "r ID". ID is the number you have seen with "l". See [134]here for more
   info's to plpbt4win.

   Note: plpgenbtldr and contig are no longer required.

  4. Syslinux, Isolinux, Extlinux
     __________________________________________________________________

   Download the current boot manager [135]plpbt-5.0.14.zip. Extract it to
   get the boot manager binary program plpbt.bin.

   Add plpbt to the config file
     * for Syslinux it's syslinux.cfg
     * for Isolinux it's isolinux.cfg
     * for Extlinux it's extlinux.conf

   Add the following lines to your config file
label plp
linux plpbt.bin

   Copy plpbt.bin to the same directory where the config file is.

   You start the boot manager when you enter plp at the Syslinux command
   prompt.

   You can configure the file plpbt.bin with [136]plpcfgbt.

  5. LILO
     __________________________________________________________________

   Download the current boot manager [137]plpbt-5.0.14.zip. Extract it to
   get the boot manager binary program plpbt.bin.

   Copy the plpbt.bin file to /boot.

   Add to your /etc/lilo.conf the following
image=/boot/plpbt.bin
label=Plop

   Run lilo to update lilo.

   You can configure the file plpbt.bin with [138]plpcfgbt.

  6. GRUB / grub4dos
     __________________________________________________________________

   Download the current boot manager [139]plpbt-5.0.14.zip. Extract it to
   get the boot manager binary program plpbt.bin.

   Copy the plpbt.bin file to /boot.

   Add to your menu.lst
title Plop Boot Manager
root (hd0,0)
kernel /boot/plpbt.bin

   Info: You have to choose the correct root settings in your
   configuration or you get a "Error: file not found". See also this
   [140]Forum entry.

   You can configure the file plpbt.bin with [141]plpcfgbt.

  7. GRUB2
     __________________________________________________________________

   Download the current boot manager [142]plpbt-5.0.14.zip. Extract it to
   get the boot manager binary program plpbt.bin.

   Copy the plpbt.bin file to /boot.

   Example file /etc/grub.d/40_custom
#!/bin/sh
exec tail -n +3 $0

menuentry "Plop Boot Manager" {
    set root=(hd0,1)
    linux16 /boot/plpbt.bin
}

   Then run update-grub2 or update-grub.

   When you reboot, you should be able to start the boot manager from your
   grub menu.

   Info: You have to choose the correct root settings in your
   configuration or you get a "Error: file not found". See also this
   [143]Forum entry.

   You can configure the file plpbt.bin with [144]plpcfgbt.

  8. From network
     __________________________________________________________________

   A better documentation comes when I have more time. Meanwhile use the
   documentation of Plop Linux.

   You need for booting over network a DHCP, TFTP server and the program
   pxelinux.

   For [145]Linux click here, for [146]Windows click here

  9. Native from a FAT file system
     __________________________________________________________________

   Download the current boot manager [147]plpbt-5.0.14.zip. Extract it to
   get the boot manager binary program plpbt.bin.

   Copy plpbt.bin to the FAT formatted drive.

   Then use the program plpmkboot to make the drive bootable to start
   plpbt.bin.
     * Linux example: plpmkboot /dev/sdb1
     * Windows example: plpmkboot F:

             Create your own ISO file with your modified plpbt.bin
     __________________________________________________________________

   [148]plpbt-createiso.zip is a simple script to create a custom plop
   boot manager iso by Elmar Hanlhofer. There is one script for Windows
   and one script for Linux in the zip file. The scripts are using mkisofs
   from cdrtools.

  How to use with Windows

       The windows binaries of cdrtools are from
       [149]http://smithii.com/cdrtools and included in the zip file.
       plpbt.bin and create-iso.bat must be in the same directory. You
       have to run create-iso.bat to create the iso file. You get a file
       called plpbtmycd.iso. That's your new boot manager iso file.

  How to use with Linux

       You must have installed mkisofs. plpbt.bin and create-iso.sh must
       be in the same directory. You have to run sh create-iso.sh to
       create the iso file. You get a file called plpbtmycd.iso. That's
       your new boot manager iso file.

                         plpcfgbt - configure plpbt.bin
     __________________________________________________________________

   [150]plpcfgbt-0.11.zip is a tool to configure plpbt.bin. This program
   is available as source code for Linux and Windows. You start the
   program from a command shell. If you run the program without parameters
   then you will see the help information.
Usage: plpcfgbt [OPTIONS] file

Options:
========

 parameter    meaning
 -----------------------------------------------------------------------------
 vm           setup video mode
              values: text, 640x480, 800x600, 1024x768, 1280x1024

 stm          start mode of the boot manager
              values: menu or hidden, hidden requires cnt=on and dbt not off

 cnt          activate countdown, values: on or off

 cntval       countdown in seconds between 1 and 99

 dbt          default boot, values: off, profile, floppy, cdrom, usb

 dprf         use default profile value between 1 and 16

 stf          starfield, values: on or off

 zan          windows zoom animation, values: on or off

 fnt          set font, values: bt or bios

 usb1         force usb 1.1
              values:   off
                        1 = Mode 1 = skip ehci
                        2 = Mode 2 = force ehci to companion

 usbmdev      use usb massdev 1-99 (obsolete)

 int19h       do not boot the os and use int19h, values: on or off

 hotkey       startup hotkey, values: yes or no

 prf          set profile, value: 1-16

 prfname      set profilename 16 chars, 'prf' must be set

 btdrv        boot drive, 80h-89h, 'prf' must be set

 btprt        boot partition 1-4, 'prf' must be set

 btlog        boot log partition, 1-4, 'prf' must be set

 skippcmcia   skip pcmcia check, values: yes or no

 fastpcmcia   skip pcmcia check after usb card was found, values: yes or no

 ignoreusbdev ignore number of usb devices 0-99

 showextended show extended partitions in the main menu, values: yes or no


 hiddenusb    automatic usb boot without showing the boot manager
 hiddencdrom  automatic cdrom boot without showing the boot manager


   Infos about int19h see [151]here.
   The hotkey option is useful with CD's or ROM's. You get the info to
   press CTRL-A to start the boot manager. If you don't press it, the
   booting continues without the boot manager.

  Examples
     __________________________________________________________________

   Print current settings:

     plpcfgbt plpbt.bin

   Configure hidden boot and boot the usb drive:

     plpcfgbt stm=hidden cnt=on cntval=1 dbt=usb plpbt.bin
     or
     plpcfgbt hiddenusb plpbt.bin

                              plpbt.bin parameters
     __________________________________________________________________

   When you use a Linux boot manager, then you can pass some parameters
   with "append" to plpbt.bin.

                        List of supported parameters

                              Parameter Meaning
   hiddenusb is the short version of "stm=hidden cnt=on cntval=1 dbt=usb"
       hiddencdrom is the short version of "stm=hidden cnt=on cntval=1
                                 dbt=cdrom"
          usb1=1 Force USB 1.1 Mode 1 (ignore the EHCI controller)
          usb1=2 Force USB 1.1 Mode 2 (force EHCI ports to usb 1.1)
                         vm=text Switch to text mode
                      fnt=bios Switch font to bios font
                 int19h=on Use INT19h instead of booting usb
         showextended=yes Show extended partitions in the main menu

   Example syslinux.cfg:
# configure the boot manager to start in text mode

label plp
    linux plpbt.bin
    append vm=text

# configure the boot manager to start in hidden mode and
# boot usb with forcing usb 1.1 mode 1

label plp2
    linux plpbt.bin
    append "hiddenusb usb1=1"


              Create a PCI boot manager option ROM (save in bios)
     __________________________________________________________________

   You can create a pci option rom file with [152]plpbtrom-0.6.zip. You
   can store the option rom in your bios or to the rom of a network card
   and run it from there.
Usage: plpbtrom [OPTIONS] input-file output-file

Options:
========
 -h               this help
 -vendorid        id hex value of the card vendor
 -deviceid        id hex value of device
 -grabid          grab vendor/device id from PCI ROM file
 -hidden          disable option rom text output
 -nodisable       do not allow option rom disable
 -forceINT        force hook interrupt
 -INT18           hook int 18h
 -compress        compress option rom
 -size  set rom to a size. examples: 64k, 128k, 1m, ...

 input-file   boot manager file (ex. plpbtrom.bin)
 output-file  ROM file name

  Examples

     * plpbtrom plpbtrom.bin plpbt.rom
     * plpbtrom -vendorid 0x10ec -deviceid 0x8139 plpbtrom.bin plpbt.rom
     * plpbtrom -grabid netcard.rom plpbtrom.bin plpbt.rom
     * plpbtrom -grabid netcard.rom -size 64k plpbtrom.bin plpbt.rom

  Special parameters

     * -forceINT: This forces the boot manager to hook the INT 19h/INT
       18h. If you have a PNP bios, then the boot manager does not use the
       PNP bios feature of the boot device sequence. The boot manager will
       be started before any boot device is tried (when INT 19h mode is
       used) or the boot manager is the last program that is started when
       all boot devices failed to boot (when INT 18h mode is used).
     * -INT18: Hook INT18h instead of INT19h. INT19h is the default mode.

  Files

     plpbtrom - Linux executable
     plpbtrom.exe - Windows executable
     plpbtrom.bin - Boot Manager

  Difference plpbtrom.bin and plpbt.bin

       plpbtrom.bin gives the control of the boot process back to the bios
       with a far return if you press esc. plpbt.bin makes a reboot with
       int 19h.
       Passing parameters to the boot manager with the linux kernel
       command line is not supported by plpbtrom.bin
       You can configure plpbtrom.bin like plpbt.bin with [153]plpcfgbt.
       You can enable/disable a hotkey to start the boot manager.

  How to test a ROM

       You can test your rom file with the free virtual machine [154]qemu.
       qemu -hda harddisk.img -option-rom plpbt.rom
       If you have no hard disk image file then take one from the qemu
       download page or use a floppy image.
       qemu -fda floppy.img -option-rom plpbt.rom

  How to flash an AMI bios

   Do this at your own risk! This can damage your pc.
     * Download the Ami bios flash utility and save your current bios.
       [155]AMI Homepage
       It's a DOS program, run the following command from a DOS floppy to
       save your bios
       afudos /obios.rom
     * Use the Windows tool [156]MMTools to replace the network rom with
       the plpbt.rom.
     * Load the file bios.rom
     * Find the network option rom. It has the id 20, the name PCI Option
       ROM and the RunLoc number VendorID:DeviceID of your network card.
       Maybe there are other option roms in your bios. Take care that you
       choose the network option rom.
     * Click on it that it's marked.
     * Click at the Replace Tab
     * Load as Module file the plpbt.rom file.
     * Press the Replace button
     * Press the Save ROM as and give it the name mybios.rom
     * Now comes the dangerous part. Flashing the bios.
       I suggest setting the bios to the default settings and save it.
       Then boot from a dos floppy and run
       afudos /imybios.rom
       Do not turn off the pc during flash. After the flash has completed,
       go to the bios and do again a reset to the default settings.
     * If all is ok, you should be able to configure the bios and start
       the boot manager during the boot process.

  How to flash an AWARD bios

   Do this at your own risk! This can damage your pc.
     * Download the Award bios flash utility aflash. You should find it at
       your Motherboard homepage in the bios section.
     * Run it from a DOS floppy and save your current bios to a file. Give
       it the name bios.rom.
     * Search the file cbrom in the web. There are different versions, not
       all will work with your bios file, so you have to test it with
       different versions.
     * Run cbrom bios.rom /d
     * This should list all parts of the bios rom. I cannot give you the
       command to replace the rom. None of the cbrom programs where able
       to display the content of my bios rom file. You have to test it by
       yourself.
     * When you updated the bios rom file, then flash it. I suggest
       setting the bios to the default settings and save it. Then boot
       from a dos floppy and run with awdflash.
     * If all is ok, you should be able to configure the bios and start
       the boot manager during the boot process.

                                   plpbt4win
     __________________________________________________________________

   plpbt4win makes it easy to add/remove the boot manager from the windows
   boot menu. The program can work with the boot.ini and with bcdedit. It
   automatically detects the required method. You can use it as batch file
   or run it with an built-in command line. You find plpbt4win in the
   Windows directory of [157]plpbt-5.0.14.zip.

  Feature list

     * Command line interface, ideal for batch programs and a gui
       frontend.
     * Built-in command line.
     * Works with boot.ini and bcdedit.
     * Can list, add and remove windows boot menu entries.
     * You can easy use different boot manager binary files. For example,
       one windows boot menu entry is the default boot manager file and
       another entry is configured to auto boot usb.
     * 2 batch files are included. InstallToBootMenu.bat and
       InstallToMBR.bat. The windows user must only start the batch file
       and everything is done by the batch file. The user must only reboot
       to see the new boot menu entries. Those batch files can also be
       used as example how to use plpbt4win.

  Help for batch mode

plpbt4win [/?] [/B] [/C [FILE]] [/L] [/A [NAME]] [/R <ID>] [/BIN <FILE>] [/D]

 /?          Help
 /B          Batch mode
 /BIN <FILE> Set the program filename. Default is "c:\plop\plpbt.bin"
 /C [FILE]   Create the plop boot manager loader program. Set the output
             filename. The default filename is "c:\plop\plpbt4win.ldr"
 /L          List windows boot menu entries
 /A [NAME]   Add to the windows boot menu a new entry. The default name is
             "Plop Boot Manager"
 /R <ID>     Remove the menu entry from the windows boot menu. ID is the
             number of the menu entry
 /D          Debug mode

  Batch mode examples

     * List boot menu entries: plpbt4win /B /L
     * Create loader: plpbt4win /B /C
     * Create custom named loader: plpbt4win /B /C c:\plop\plp.ldr
     * Add an entry: plpbt4win /B /A "The Plop Boot Manager is here"
     * Remove an entry, first use /L to get the ID and then: plpbt4win /B
       /R 3
     * Create loader and add entry at once: plpbt4win /B /C /A

  Help for built in command line

   Start plpbt4win without parameter.
Command (? for help):
 ?          Help
 bin <FILE> Set the program filename. Default is "c:\plop\plpbt.bin"
 c [FILE]   Create the plop boot manager loader program. Set the output
            filename. The default filename is "c:\plop\plpbt4win.ldr"
 l          List windows boot menu entries
 a [NAME]   Add to the windows boot menu a new entry. The default name is
            "Plop Boot Manager"
 r <ID>     Remove the menu entry from the windows boot menu. ID is the
            number of the menu entry
 d          Activate/disable debug mode
 v          Show current values
 q          Quit

                                  plpgenbtldr
     __________________________________________________________________

   plpgenbtldr is outdated and no longer supported. Use [158]plpbt4win.

   To remove entries from the windows boot menu use either [159]plpbt4win
   or

   Open a command prompt as administrator.
   Run "bcdedit /v" to list all entries.
   Run "bcdedit /delete {id}" to remove the entry. {id} is the number with
   { } beside the listed entry.

                      PCMCIA CardBus driver - USB PC-Card
     __________________________________________________________________

   Many old laptops are having one or two CardBus slots. The boot manager
   can act as USB PC-Card enabler and the boot manager makes it possible
   to boot from the USB PC-Card. When your laptop has only USB 1.1, then
   you can speed up the boot process with an USB 2.0 PC-Card. When your
   laptop has only one USB port, then you are able to get more USB ports
   with an USB PC-Card.

   You find the boot manager with the CardBus driver in the pcmcia
   directory of [160]plpbt-5.0.14.zip.

   The boot manager initializes the CardBus during the boot manager
   startup. This means, the PC-Card must be plugged in during the boot
   manager start! I do this during the program start, because then you
   have an initialized and ready to use PC-Card regardless if you boot
   from usb or not. When you have a DOS USB driver (for OHCI and EHCI)
   then you are able to use it with the PC-Card and you don't need a extra
   CardBus driver.

   During the boot manager startup you will see some infos about the
   CardBus init process. When you want to read it, then press the CTRL key
   during the boot manager start.

   Notes:
     * My CardBus driver works on many machines, but it does not work on
       all.
     * Because of the additional CardBus driver size, I had to remove the
       IDE Cdrom driver (only) from the pcmcia hard disk boot manager
       version.
       plpbt.bin has all drivers included.

                                    USB info
     __________________________________________________________________

     * Only USB mass storage devices are supported. The USB support allows
       booting from USB hard disk, USB thumb drives and USB card readers.
       USB floppies and CD/DVD drives are not working.
     * There is no USB HUB implementation. It's required to connect your
       USB drive directly to the USB port of your computer.
     * Current status see [161]Boot Manager News.

                             DOS and the USB driver
     __________________________________________________________________

   [162]1. The Boot Manager as USB hard disk driver for DOS
   [163]2. Disable the USB driver
   [164]3. Detect the USB driver under DOS

  1. The Boot Manager as USB hard disk driver for DOS
     __________________________________________________________________

   I know this is very special. Maybe it's useful for some people. You
   have to configure the plpbt.bin with [165]plpcfgbt to use int19h
   instead of booting the operating system.

   plpcfgbt int19h=on plpbt.bin

   Now you have to start plpbt.bin with a boot manager like grub, syslinux
   or whatever during boot time (supported boot managers see [166]here).
   Choose USB and the boot manager will install the usb driver and go back
   to your boot manager. If you start DOS you will have access to your usb
   drive as last hard disk. But remember, the usb drive is only as "read
   only" device available.

   If it works for you then use plpcfgbt int19h=on stm=hidden cnt=on
   cntval=1 dbt=usb plpbt.bin

  2. Disable the USB driver
     __________________________________________________________________

   If you run DOS and the Plop USB driver is loaded, then you can disable
   the USB driver with [167]plpdisd-0.2.zip. When you disable the driver,
   then you are able to load other DOS usb drivers.

   You can run plpdisd from config.sys
DEVICE=c:\tools\plpdisd.exe

   It's also possible to run it from the autoexec.bat or command line.

  3. Detect the USB driver under DOS
     __________________________________________________________________

   See [168]here

                             Detect the USB driver
     __________________________________________________________________

   [169]1. Detect the USB driver with Syslinux
   [170]2. Detect the USB driver under DOS

  1. Detect the USB driver with Syslinux
     __________________________________________________________________

   Icecube wrote the module ifplop.c32 for syslinux to detect the plop usb
   driver

   Example syslinux.cfg:
default plopcheck

# Check for the presence of plop (run by default)
#   When plop INT13 hook is found, run the first label
#   When plop INT13 hook isn't found, run the second label

label plopcheck
    com32 ifplop.c32
    append plop_detected -- plop_not_detected

# When plop INT13 hook was found, boot the menu system.
# plop can have added USB2.0 speed, so the entries we want to boot
# will be read from disk much faster (supposing that we have a BIOS
# that only supports USB1.1 speed).

label plop_detected
    com32 menu.c32
    append syslinux.cfg

# plop INT13 hook wasn't found, so we boot plop

label plop_not_detected
    linux plpbt.bin

   ifplop.c32 is part of syslinux since version 4.01.
   ifplop.c32 module page:
   [171]http://syslinux.zytor.com/wiki/index.php/Ifplop.c32

   You find some driver detection info's [172]here.

  2. Detect the USB driver under DOS
     __________________________________________________________________

   With the program [173]plpchk-0.1.zip you are able to detect the plop
   usb driver. You can use it in the config.sys, in a batch program or
   from the command line. The program is able to create a file when the
   driver is installed, or delete a file when the driver was not detected.
   According to the existence of the file you can do some actions. For
   batch files you can use the return value of the error level. The
   program makes no screen output when you use the /h parameter.
plpchk [/?] [/h] [file]

  /?      help
  /h      hide text output
  file    create this file when the driver was detected or remove it when the
          driver was not detected

config.sys example: DEVICE=c:\tools\plpchk.exe c:\tmp\plpusb

For batch processing: ERRORLEVEL 0 = no driver detected
                                 1 = driver detected

   You find some driver detection info's [174]here.

                      Hidden partition / Cleared partition
     __________________________________________________________________

  Hidden partition / Cleared partition
     __________________________________________________________________

   There is a important difference between "hidden" and "cleared"
   partitions.
     * Hidden Partition: Operating systems, backup solutions and so on can
       see them but they ignore them. I would say, this is a pseudo hidden
       partition.
     * Cleared Partition: No program (except the boot manager) knows that
       there is/was a partition defined in the MBR. This is really hidden.
       It looks like unallocated space for every program. That means no
       other program can access the data on that partition (with some work
       and searching the hard disk there are still ways to access the
       data). There is a risk, if you repartition the hard disk, you will
       overwrite your invisible partition and all data on it if you do it
       wrong.

  Example: Hide a partition
     __________________________________________________________________

   This is an example: A partition should be visible in one profile and
   hidden (and not cleared) in another profile

   Let's say you want to have the second partition on HDA (HDA2) on one
   profile visible and on another hidden (and not cleared).
     * Use an empty entry in partitions. Give it the label "hidden hda2".
     * Select the device HDA.
     * Go to "Edit MBR/Import data".
     * Move the cursor to P2 and press "s". Now move up to "BP" and press
       "p".
     * Press ESC and go to "Partition ID". Choose "Select from list".
       Choose the hidden version of your partition.
     * Press ESC and save your changes.
     * Go to "profiles".
       Now you can assign the "visible" version of your partition to one
       profile and the "hidden" to another profile.

                     Linux Boot Managers to the boot sector
     __________________________________________________________________

   LILO, GRUB / grub4dos, GRUB2: I had no time to write some short
   descriptions how to install them to the boot sector.

                                    Examples
     __________________________________________________________________

   [175]1. Video dual boot install Windows XP and Windows XP
   [176]2. Windows XP and Windows Vista dual boot with hidden (cleared)
   partitions
   [177]3. Dualboot Windows XP and Windows 7

  1. Video dual boot install Windows XP and Windows XP
     __________________________________________________________________

   Download [178]demoinstall.wmv ([179]demoinstall.zip). The quality is
   not the best but you see all required steps. I hope it's useful.

  2. Windows XP and Windows Vista dual boot with hidden (cleared) partitions
     __________________________________________________________________

   The goal is to install Windows XP on the first partition and Windows
   Vista on the second partition. I want that no windows has access to the
   partition of the other Windows. There should be a third partition that
   will be used as shared partition. Both Windows have access to this
   partition.

   There are many ways to do this. I will describe one way.

   It works only with the [180]MBR installation!

  What should be the result

     * Windows XP on partition 1
     * Windows Vista on partition 2
     * A shared partition for both Windows as partition 3
     * No Windows has access to the other Windows partition
     * Realized with the Plop Boot Manager (hard disk installation)

  Basic conditions

     * The hard disk is not partitioned
     * No boot manager is installed

                               The description

    Install Windows XP

     At first install Windows XP. Create with the Windows installer a
     partition with the size you want. I use a 10GB partition. Install
     Windows XP on this partition.

    Setup Partitions

     When you installed your Windows, go to the Disk Management and
     create a second primary partition for Vista and a third primary
     partition for the shared data.

    Install the boot manager

     Now comes the boot manager part. Boot from the boot manager install
     floppy or CD. Install the boot manager to the hard disk and then
     reboot.

    Configure the Windows XP profile

     The boot manager created a profile called "os harddisk 1" to boot
     Windows XP. It also imported the 3 primary partitions. The names are
     HDA1, HDA2 and HDA3.

     Now go to setup and profiles. Select os harddisk 1. Give it the new
     label windows xp.

     Select linked partitions. Press enter at the first slot of HDA and
     select HDA1. At the second slot press c to set it to cleared. You
     can leave the third slot as don't touch or select HDA3. See the
     difference at [181]configure partition entries.

    Configure the Windows Vista profile

     Now leave the configuration of Windows XP and go to an empty profile
     in Profiles. Give it the label windows vista. Set show in main menu
     to yes. Now select linked partitions. Press at the first slot c to
     set it to cleared. At the second slot press b to set the boot flag.
     Press enter and select HDA2. On the third slot choose the same as
     for windows xp (don't touch or HDA3).

    Install Window Vista

     Go back to the main menu. Now you see windows xp and windows vista.
     Move to windows vista and press Enter. This writes the profile
     settings to the hard disk. The booting will fail, because Vista is
     not installed. Now boot the Windows Vista install DVD. In the
     installer you should see at the partitions screen at first an
     unallocated space (there is xp installed) and 2 primary partitions.
     Select the first primary partition to install Windows Vista. when
     the Windows Vista installation has been finished, it's possible,
     that Vista is booting immediately and the Plop Boot Manager does not
     come. In this case use Rewrite loader from the Plop Boot Manager
     install floppy or CD.

   Now you should have two bootable Windows on your hard disk and they
   don't know from each other. You can share data between both with the
   shared partition.

  Windows Vista on the second hard disk

   It's similar to the previous description, if you want to install
   Windows XP on the first hard disk and Windows Vista on the second hard
   disk. The second hard disk is HDB in the boot manager. So install
   Windows Vista to the first partition of the second hard disk. Set in
   the vista profile/linked partitions the first slot of HDB to HDB1 and
   press b. The boot manager will set the boot flag to 81h. This should be
   ok for your installation.

  3. Dualboot Windows XP and Windows 7
     __________________________________________________________________

   Here are short instructions for a complete new installation of your pc
   with dualbooting WinXP and Win7. It doesn't matter if you use 32 or 64
   bit versions. Take care, all data on your pc will be deleted!

   Boot the Win7 install DVD. Remove all partitions from the hard disk.
   Create a partition for Win7. The install program will create 2
   partitions. One with about 80MB for the Win7 boot files and a second
   partition with the Win7 files. Create an additional partition for
   WinXP. Now you see 3 partitions. Install Win7 to the second partition.
   After the Win7 installation is complete, install the Plop Boot Manager.
   After the Boot Manager installation go to the Boot Manager Setup, then
   Profiles, then "OS HARDDISK 1". Change the name to "Win7". Go to linked
   partitions and press enter on the first position of HDA and select
   HDA1, on the second select HDA2 and on the third press "c" for cleared.
   Now leave the profile settings for Win7. Use now an empty profile to
   create the WinXP profile. Give it the name WinXP, visible in main menu
   "yes". In linked partitions select for HDA on the first position HDA3,
   press "b" to set the boot flag on the first position. On the second
   press "c" to set it cleared. On the third press "c" to set it to
   cleared too. Go to the main menu and press enter on WinXP. You will be
   not able to boot this partition because XP is not installed currently.
   If you get the message about invalid boot signature, then press "n" to
   abort. Now boot the WinXP install CD. You should see now only one
   partition. Install WinXP there. After the installation completed then
   start the Plop Boot Manager install CD and use "Rewrite loader".
   Reboot, the boot manager will tell you about partition changes. Press
   "y" to import the new values. Now you should be able to boot both
   systems.

                               NOD32 Virus report
     __________________________________________________________________

   NOD32 reports a MBR virus after the Boot Manager MBR installation. It's
   a false report. This problem was fixed but with the new NOD32 versions
   it's back.

                       FAQ's - Frequently asked questions
     __________________________________________________________________

    1. [182]I booted DOS from USB and I cannot write on the drive
    2. [183]Are there plans to add write support in the future
    3. [184]The boot manager detect's my usb cdrom, but booting hangs
    4. [185]My USB keyboard does not work when I booted from USB
    5. [186]Can I use my USB PC-Card (PCMCIA CardBus) to boot from USB
    6. [187]I want to install the boot manager from my USB device, but I
       cannot choose my internal hard disk
    7. [188]I use plpbt.bin and it forgets my settings
    8. [189]I cannot boot from my SATA CD/DVD drive
    9. [190]I was reading VIEW/EDIT/COPY data in the forum, where is this
       menu
   10. [191]Main menu network boot: !PXE structure was not found in UNDI
   11. [192]My USB DVD drive is detected, but I cannot boot


    1. I booted DOS from USB and I cannot write on the drive
       My drivers have no write routines implemented. You want to know
       why? My intention was to have USB drivers for UHCI, OHCI and EHCI
       controllers in my tiny boot manager. The space to install the boot
       manager without the need of a partition is very limited. So there
       was no space left for write routines.
    2. Are there plans to add write support in the future
       It's in my mind, but there are no fix plans.
    3. The boot manager detect's my usb cdrom, but booting hangs
       USB CD/DVD drives are not supported.
    4. My USB keyboard does not work when I booted from USB
       USB keyboards are not supported by my drivers. When you boot Linux
       or Windows, then your keyboard will work again when those operating
       systems are taking control over the USB hardware.
    5. Can I use my USB PC-Card (PCMCIA CardBus) to boot from USB
       Yes, with the pcmcai version of the boot manager
    6. I want to install the boot manager from my USB device, but I cannot
       choose my internal hard disk
       The problem with installing on the internal (in this case the
       second) hard disk with the installer is, that the installer imports
       the partitions from the usb device and thinks this are the
       partitions of the first hard disk. When the boot manager boot's
       later from the real hard disk then the imported partitions are not
       correct. You see the problem? Sure it would be possible to add an
       option to handle this situation, but there are so many other ways
       to install the boot manager, that there are no plans to add this
       feature to the installer (except, many people request this
       feature).
    7. I use plpbt.bin and it forgets my settings
       You have to configure plpbt.bin with plpcfgbt. All changes you make
       within the boot manager menu are only valid until you reboot. The
       changes are not saved.
    8. I cannot boot from my SATA CD/DVD drive
       SATA CD/DVD drives are not supported. Only IDE CD/DVD drives are
       working.
    9. I was reading VIEW/EDIT/COPY data in the forum, where is this menu
       'VIEW/EDIT/COPY' data has been renamed to 'Edit MBR/Import data'
       (setup/partitions/partition edit).
   10. Main menu network boot: !PXE structure was not found in UNDI
       Your network rom is a 'PXE Split ROM'. Currently only 'Monolithic'
       roms are supported
   11. My USB DVD drive is detected, but I cannot boot
       Booting from USB CD/DVD drives is not supported by the current usb
       driver
     __________________________________________________________________

                           (c) by Elmar Hanlhofer

References

   1. http://www.plop.at/en/bootmanager/full.html
   2. http://www.plop.at/print/en/bootmanager/full.html#l_intro
   3. http://www.plop.at/print/en/bootmanager/full.html#l_startmodes
   4. http://www.plop.at/print/en/bootmanager/full.html#l_features
   5. http://www.plop.at/print/en/bootmanager/full.html#l_screenshots
   6. http://www.plop.at/print/en/bootmanager/full.html#l_licence
   7. http://www.plop.at/print/en/bootmanager/full.html#l_download
   8. http://www.plop.at/print/en/bootmanager/full.html#l_thebootmanager
   9. http://www.plop.at/print/en/bootmanager/full.html#l_mbrinstall
  10. http://www.plop.at/print/en/bootmanager/full.html#l_plpbt.bin
  11. http://www.plop.at/print/en/bootmanager/full.html#l_iso
  12. http://www.plop.at/print/en/bootmanager/full.html#l_plpcfgbt
  13. http://www.plop.at/print/en/bootmanager/full.html#l_plpbt-parameter
  14. http://www.plop.at/print/en/bootmanager/full.html#l_rom
  15. http://www.plop.at/print/en/bootmanager/full.html#l_plpbt4win
  16. http://www.plop.at/print/en/bootmanager/full.html#l_plpgenbtldr
  17. http://www.plop.at/print/en/bootmanager/full.html#l_pcmcia
  18. http://www.plop.at/print/en/bootmanager/full.html#l_usbinfo
  19. http://www.plop.at/print/en/bootmanager/full.html#l_usbdos
  20. http://www.plop.at/print/en/bootmanager/full.html#l_usbdriverdetect
  21. http://www.plop.at/print/en/bootmanager/full.html#l_hiddenpartitions
  22. http://www.plop.at/print/en/bootmanager/full.html#l_linuxloaders
  23. http://www.plop.at/print/en/bootmanager/full.html#l_examples
  24. http://www.plop.at/print/en/bootmanager/full.html#l_nod32
  25. http://www.plop.at/print/en/bootmanager/full.html#l_faq
  26. http://download.plop.at/files/bootmngr/plpbt-5.0.14.zip
  27. http://www.plop.at/slide16en01.html
  28. http://www.plop.at/slide16en02.html
  29. http://www.plop.at/slide16en03.html
  30. http://www.plop.at/slide16en04.html
  31. http://download.plop.at/files/bootmngr/plpbt-5.0.14.zip
  32. http://download.plop.at/files/bootmngr/plpbt-5.0.13.zip
  33. http://download.plop.at/files/bootmngr/plpbtrom-0.6.zip
  34. http://download.plop.at/files/bootmngr/plpbt-createiso.zip
  35. http://download.plop.at/files/bootmngr/plpcfgbt-0.11.zip
  36. http://download.plop.at/files/bootmngr/plpdisd-0.2.zip
  37. http://download.plop.at/files/bootmngr/plpchk-0.1.zip
  38. http://download.plop.at/files/bootmngr/plpmkboot-0.1.zip
  39. http://www.plop.at/print/en/bootmanager/full.html#b0
  40. http://www.plop.at/print/en/bootmanager/full.html#b1
  41. http://www.plop.at/print/en/bootmanager/full.html#b2
  42. http://www.plop.at/print/en/bootmanager/full.html#b3
  43. http://www.plop.at/print/en/bootmanager/full.html#b4
  44. http://www.plop.at/print/en/bootmanager/full.html#b5
  45. http://www.plop.at/print/en/bootmanager/full.html#b6
  46. http://www.plop.at/print/en/bootmanager/full.html#b7
  47. http://www.plop.at/print/en/bootmanager/full.html#b8
  48. http://www.plop.at/print/en/bootmanager/full.html#b9
  49. http://www.plop.at/print/en/bootmanager/full.html#b10
  50. http://www.plop.at/print/en/bootmanager/full.html#b11
  51. http://www.plop.at/print/en/bootmanager/full.html#b12
  52. http://www.plop.at/print/en/bootmanager/full.html#b13
  53. http://www.plop.at/print/en/bootmanager/full.html#b14
  54. http://www.plop.at/print/en/bootmanager/full.html#b15
  55. http://www.plop.at/print/en/bootmanager/full.html#b16
  56. http://www.plop.at/print/en/bootmanager/full.html#b17
  57. http://www.plop.at/print/en/bootmanager/full.html#b18
  58. http://www.plop.at/print/en/bootmanager/full.html#b19
  59. http://www.plop.at/print/en/bootmanager/full.html#b20
  60. http://www.plop.at/print/en/bootmanager/full.html#b21
  61. http://www.plop.at/print/en/bootmanager/full.html#b22
  62. http://www.plop.at/print/en/bootmanager/full.html#b23
  63. http://www.plop.at/print/en/bootmanager/full.html#b24
  64. http://www.plop.at/print/en/bootmanager/full.html#b25
  65. http://www.plop.at/print/en/bootmanager/full.html#b26
  66. http://www.plop.at/print/en/bootmanager/full.html#b27
  67. http://www.plop.at/print/en/bootmanager/full.html#b28
  68. http://www.plop.at/print/en/bootmanager/full.html#b29
  69. http://www.plop.at/print/en/bootmanager/full.html#b30
  70. http://www.plop.at/print/en/bootmanager/full.html#b31
  71. http://www.plop.at/print/en/bootmanager/full.html#b32
  72. http://www.plop.at/print/en/bootmanager/full.html#b33
  73. http://www.plop.at/print/en/bootmanager/full.html#b34
  74. http://www.plop.at/print/en/bootmanager/full.html#b35
  75. http://www.plop.at/print/en/bootmanager/full.html#b36
  76. http://www.plop.at/print/en/bootmanager/plpbt.bin.html
  77. http://www.plop.at/print/en/bootmanager/linuxloaders.html
  78. http://www.plop.at/print/en/bootmanager/full.html#installer
  79. http://www.plop.at/print/en/bootmanager/full.html#instop
  80. http://www.plop.at/print/en/bootmanager/full.html#uninstall
  81. http://www.plop.at/print/en/bootmanager/full.html#instmeth
  82. http://www.plop.at/print/en/bootmanager/full.html#flpinst
  83. http://www.plop.at/print/en/bootmanager/full.html#cdinst
  84. http://www.plop.at/print/en/bootmanager/full.html#dosinst
  85. http://www.plop.at/print/en/bootmanager/full.html#wininst
  86. http://www.plop.at/print/en/bootmanager/full.html#syslinuxinst
  87. http://www.plop.at/print/en/bootmanager/full.html#liloinst
  88. http://www.plop.at/print/en/bootmanager/full.html#grubinst
  89. http://www.plop.at/print/en/bootmanager/full.html#grub2inst
  90. http://www.plop.at/print/en/bootmanager/full.html#netinst
  91. http://www.plop.at/print/en/bootmanager/full.html#fatinst
  92. http://www.plop.at/print/en/bootmanager/thebootmanager.html#hotkeys
  93. http://download.plop.at/files/bootmngr/plpbt-5.0.14.zip
  94. http://download.plop.at/files/DISKIMG.COM
  95. http://download.plop.at/files/rawwritewin.exe
  96. http://download.plop.at/files/bootmngr/plpbt-5.0.14.zip
  97. http://www.plop.at/print/en/bootmanager/full.html#installer
  98. http://www.nero.com/
  99. http://www.cdburnerxp.se/
 100. http://cdrecord.berlios.de/old/private/cdrecord.html
 101. http://download.plop.at/files/bootmngr/plpbt-5.0.14.zip
 102. http://www.plop.at/print/en/bootmanager/plpbt.bin.html#runwin
 103. http://download.plop.at/files/bootmngr/plpbt-5.0.14.zip
 104. http://www.plop.at/print/en/bootmanager/full.html#plpbt4win
 105. http://download.plop.at/files/bootmngr/plpbt-5.0.14.zip
 106. http://download.plop.at/files/bootmngr/plpbt-5.0.14.zip
 107. http://download.plop.at/files/bootmngr/plpbt-5.0.14.zip
 108. http://forum.plop.at/index.php/topic,1456.0.html
 109. http://download.plop.at/files/bootmngr/plpbt-5.0.14.zip
 110. http://forum.plop.at/index.php/topic,1456.0.html
 111. http://www.plop.at/en/ploplinux.html#pxel
 112. http://www.plop.at/en/ploplinux.html#pxew
 113. http://download.plop.at/files/bootmngr/plpbt-5.0.14.zip
 114. http://www.plop.at/print/en/bootmanager/plpcfgbt.html
 115. http://www.plop.at/print/en/bootmanager/full.html#runflp
 116. http://www.plop.at/print/en/bootmanager/full.html#runcd
 117. http://www.plop.at/print/en/bootmanager/full.html#runwin
 118. http://www.plop.at/print/en/bootmanager/full.html#runsyslinux
 119. http://www.plop.at/print/en/bootmanager/full.html#runlilo
 120. http://www.plop.at/print/en/bootmanager/full.html#rungrub
 121. http://www.plop.at/print/en/bootmanager/full.html#rungrub2
 122. http://www.plop.at/print/en/bootmanager/full.html#runnet
 123. http://www.plop.at/print/en/bootmanager/full.html#runfat
 124. http://download.plop.at/files/bootmngr/plpbt-5.0.14.zip
 125. http://download.plop.at/files/DISKIMG.COM
 126. http://download.plop.at/files/rawwritewin.exe
 127. http://www.plop.at/print/en/bootmanager/plpcfgbt.html
 128. http://download.plop.at/files/bootmngr/plpbt-5.0.14.zip
 129. http://www.plop.at/print/en/bootmanager/iso.html
 130. http://www.nero.com/
 131. http://www.cdburnerxp.se/
 132. http://cdrecord.berlios.de/old/private/cdrecord.html
 133. http://download.plop.at/files/bootmngr/plpbt-5.0.14.zip
 134. http://www.plop.at/print/en/bootmanager/full.html#plpbt4win
 135. http://download.plop.at/files/bootmngr/plpbt-5.0.14.zip
 136. http://www.plop.at/print/en/bootmanager/plpcfgbt.html
 137. http://download.plop.at/files/bootmngr/plpbt-5.0.14.zip
 138. http://www.plop.at/print/en/bootmanager/plpcfgbt.html
 139. http://download.plop.at/files/bootmngr/plpbt-5.0.14.zip
 140. http://forum.plop.at/index.php/topic,1456.0.html
 141. http://www.plop.at/print/en/bootmanager/plpcfgbt.html
 142. http://download.plop.at/files/bootmngr/plpbt-5.0.14.zip
 143. http://forum.plop.at/index.php/topic,1456.0.html
 144. http://www.plop.at/print/en/bootmanager/plpcfgbt.html
 145. http://www.plop.at/en/ploplinux.html#pxel
 146. http://www.plop.at/en/ploplinux.html#pxew
 147. http://download.plop.at/files/bootmngr/plpbt-5.0.14.zip
 148. http://download.plop.at/files/bootmngr/plpbt-createiso.zip
 149. http://smithii.com/cdrtools
 150. http://download.plop.at/files/bootmngr/plpcfgbt-0.11.zip
 151. http://www.plop.at/print/en/bootmanager/usbdos.html#usbhddrv
 152. http://download.plop.at/files/bootmngr/plpbtrom-0.6.zip
 153. http://www.plop.at/print/en/bootmanager/full.html#plpcfgbt
 154. http://www.qemu.org/
 155. http://www.ami.com/
 156. http://www.softpedia.com/get/System/System-Info/MMTool.shtml
 157. http://download.plop.at/files/bootmngr/plpbt-5.0.14.zip
 158. http://www.plop.at/print/en/bootmanager/plpbt4win.html
 159. http://www.plop.at/print/en/bootmanager/plpbt4win.html
 160. http://download.plop.at/files/bootmngr/plpbt-5.0.14.zip
 161. http://www.plop.at/en/bootmngrusblog.html
 162. http://www.plop.at/print/en/bootmanager/full.html#usbhddrv
 163. http://www.plop.at/print/en/bootmanager/full.html#usbdisable
 164. http://www.plop.at/print/en/bootmanager/full.html#usbdoschk
 165. http://www.plop.at/print/en/bootmanager/plpcfgbt.html
 166. http://www.plop.at/print/en/bootmanager/plpbt.bin.html
 167. http://download.plop.at/files/bootmngr/plpdisd-0.2.zip
 168. http://www.plop.at/print/en/bootmanager/usbdriverdetect.html#dos
 169. http://www.plop.at/print/en/bootmanager/full.html#ifplop
 170. http://www.plop.at/print/en/bootmanager/full.html#usbdetectdos
 171. http://syslinux.zytor.com/wiki/index.php/Ifplop.c32
 172. http://forum.plop.at/index.php/topic,165.msg2099.html
 173. http://download.plop.at/files/bootmngr/plpchk-0.1.zip
 174. http://forum.plop.at/index.php/topic,165.msg2099.html
 175. http://www.plop.at/print/en/bootmanager/full.html#ex0
 176. http://www.plop.at/print/en/bootmanager/full.html#ex1
 177. http://www.plop.at/print/en/bootmanager/full.html#ex2
 178. http://download.plop.at/files/bootmngr/video/demoinstall.wmv
 179. http://download.plop.at/files/bootmngr/video/demoinstall.zip
 180. http://www.plop.at/print/en/bootmanager/mbrinstall.html
 181. http://www.plop.at/print/en/bootmanager/full.html#partentries
 182. http://www.plop.at/print/en/bootmanager/full.html#faq0
 183. http://www.plop.at/print/en/bootmanager/full.html#faq1
 184. http://www.plop.at/print/en/bootmanager/full.html#faq2
 185. http://www.plop.at/print/en/bootmanager/full.html#faq3
 186. http://www.plop.at/print/en/bootmanager/full.html#faq4
 187. http://www.plop.at/print/en/bootmanager/full.html#faq5
 188. http://www.plop.at/print/en/bootmanager/full.html#faq6
 189. http://www.plop.at/print/en/bootmanager/full.html#faq7
 190. http://www.plop.at/print/en/bootmanager/full.html#faq8
 191. http://www.plop.at/print/en/bootmanager/full.html#faq9
 192. http://www.plop.at/print/en/bootmanager/full.html#faq10
