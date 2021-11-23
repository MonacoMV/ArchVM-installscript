#!/bin/bash

    bash 0-preinstall.sh
    arch-chroot /mnt /root/ArchVM-installscript/1-setup.sh
    arch-chroot /mnt /root/ArchVM-installscript/2-users.sh
