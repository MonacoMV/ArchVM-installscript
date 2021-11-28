#!/bin/bash

    bash 0-preinstall.sh
    arch-chroot /mnt pacman -S git
    arch-chroot /mnt git clone https://github.com/MonacoMV/ArchVM-installscript
    arch-chroot /mnt bash /ArchVM-installscript/1-setup.sh
    arch-chroot /mnt bash /ArchVM-installscript/2-user.sh
