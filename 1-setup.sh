echo -e "   _____                 __       ____     __                      "
echo -e "  /  _  \_______   ____ |  |__   |    |   |__| ____  __ _____  ___ "
echo -e " /  /_\  \_  __ \_/ ___\|  |  \  |    |   |  |/    \|  |  \  \/  / "
echo -e "/    |    \  | \/\  \___|   Y  \ |    |___|  |   |  \  |  />    <  "
echo -e "\____|__  /__|    \___  >___|  / |_______ \__|___|  /____//__/\_ \ "

echo "--------------------------------------"
echo "--          Network Setup           --"
echo "--------------------------------------"
pacman -S networkmanager --noconfirm --needed
systemctl enable --now NetworkManager

echo "--------------------------------------"
echo "--           Grub Setup             --"
echo "--------------------------------------"
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

echo "-------------------------------------------------"
echo "       Setup Language to US and set locale       "
echo "-------------------------------------------------"
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
timedatectl --no-ask-password set-timezone America/Los_Angeles
timedatectl --no-ask-password set-ntp 1
localectl --no-ask-password set-locale LANG="en_US.UTF-8" LC_TIME="en_US.UTF-8"

# Set keymaps
localectl --no-ask-password set-keymap us

# Add sudo no password rights
sed -i 's/^# %wheel ALL=(ALL) ALL/Defaults !tty_tickets/' /etc/sudoers

#Add parallel downloading
sed -i 's/^#Para/Para/' /etc/pacman.conf

#Enable multilib
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
pacman -Sy --noconfirm
