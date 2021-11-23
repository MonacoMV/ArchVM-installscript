timedatectl set-ntp true

echo -e "   _____                 __       ____     __                      "
echo -e "  /  _  \_______   ____ |  |__   |    |   |__| ____  __ _____  ___ "
echo -e " /  /_\  \_  __ \_/ ___\|  |  \  |    |   |  |/    \|  |  \  \/  / "
echo -e "/    |    \  | \/\  \___|   Y  \ |    |___|  |   |  \  |  />    <  "
echo -e "\____|__  /__|    \___  >___|  / |_______ \__|___|  /____//__/\_ \ "

echo "-------------------------------------------------"
echo "-------select your disk to format----------------"
echo "-------------------------------------------------"
lsblk
echo "Please enter disk to work on: (example /dev/sda)"
read DISK
echo "THIS WILL FORMAT AND DELETE ALL DATA ON THE DISK"
read -p "are you sure you want to continue (Y/N):" formatdisk

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
