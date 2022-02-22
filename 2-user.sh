echo "What do you want your username to be?"
read USERNAME
echo "What do you want your hostname to be?"
read HOSTNAME

# Adding user
useradd -mg wheel "$USERNAME"
echo "What do you want your password to be?"
passwd "$USERNAME"

# Adding hostname
echo "$HOSTNAME" >> /etc/hostname

echo "Done"
exit
umount -R /mnt
reboot
