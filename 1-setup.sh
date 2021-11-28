
echo "--------------------------------------"
echo "--          Network Setup           --"
echo "--------------------------------------"
pacman -S networkmanager --noconfirm --needed
systemctl enable --now NetworkManager

echo "--------------------------------------"
echo "--           Grub Setup             --"
echo "--------------------------------------"
pacman -S grub --noconfirm --needed
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

echo "-------------------------------------------------"
echo "       Setup Language to US and set locale       "
echo "-------------------------------------------------"
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
echo LANG=en_US.UTF-8 > /etc/locale.conf

# Add sudo no password rights
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
echo "Defaults !tty_tickets" >> /etc/sudoers

#Add parallel downloading
sed -i 's/^#Para/Para/' /etc/pacman.conf

#Enable multilib
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
pacman -Sy --noconfirm

echo "--------------------------------------"
echo "--   SYSTEM READY FOR 2-users       --"
echo "--------------------------------------"
