timedatectl set-ntp true

eche -e "   _____                .__      .____    .__                     "
eche -e "  /  _  \_______   ____ |  |__   |    |   |__| ____  __ _____  ___"
eche -e " /  /_\  \_  __ \_/ ___\|  |  \  |    |   |  |/    \|  |  \  \/  /"
eche -e "/    |    \  | \/\  \___|   Y  \ |    |___|  |   |  \  |  />    < "
eche -e "\____|__  /__|    \___  >___|  / |_______ \__|___|  /____//__/\_ \"
eche -e "        \/            \/     \/          \/       \/            \/"


echo "-------------------------------------------------"
echo "-------select your disk to format----------------"
echo "-------------------------------------------------"
lsblk
echo "Please enter disk to work on: (example /dev/sda)"
read DISK
echo "THIS WILL FORMAT AND DELETE ALL DATA ON THE DISK"
read -p "are you sure you want to continue (Y/N):" formatdisk
case $formatdisk in

y|Y|yes|Yes|YES)
echo "--------------------------------------"
echo -e "\nFormatting disk...\n$HR"
echo "--------------------------------------"

# create partitions
sfdisk "${DISK}" <<EOF
;
EOF

# make filesystems
echo -e "\nCreating Filesystems...\n$HR"
mkfs.ext4 "${DISK}1"
mount "${DISK}1" /mnt

echo "--------------------------------------"
echo "-- Arch Install on Main Drive       --"
echo "--------------------------------------"
pacstrap /mnt base base-devel linux linux-firmware vim --noconfirm --needed
genfstab -U /mnt >> /mnt/etc/fstab

echo "--------------------------------------"
echo "--   SYSTEM READY FOR 1-setup       --"
echo "--------------------------------------"
