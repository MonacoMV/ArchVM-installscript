
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo "--------------------"
echo "  Starting install  "
echo "--------------------"

timedatectl set-ntp true

echo -e "-------------------------------------------------------------"
echo -e "     **                    **        **      ** ****     ****"
echo -e "    ****                  /**       /**     /**/**/**   **/**"
echo -e "   **//**   ******  ***** /**       /**     /**/**//** ** /**"
echo -e "  **  //** //**//* **///**/******   //**    ** /** //***  /**"
echo -e " ********** /** / /**  // /**///**   //**  **  /**  //*   /**"
echo -e "/**//////** /**   /**   **/**  /**    //****   /**   /    /**"
echo -e "/**     /**/***   //***** /**  /**     //**    /**        /**"
echo -e "//      // ///     /////  //   //       //     //         // "

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

parted /dev/sda mklabel gpt mkpart P1 ext4 1MiB 8GB
mkfs.ext4 /dev/sda1
mount /dev/sda1 /mnt

lsblk

echo "--------------------------------------"
echo "-- Arch Install on Main Drive       --"
echo "--------------------------------------"

pacstrap /mnt base base-devel linux linux-firmware vim
genfstab -U /mnt >> /mnt/etc/fstab
genfstab -U /mnt


