echo "What do you want your username to be?"
read USERNAME
echo "What do you want your password to be?"
read PASSWORD
echo "What do you want your hostname to be?"
read HOSTNAME

# Adding user
useradd -mg wheel "$USERNAME"
passwd "$USERNAME"
"$PASSWORD"

# Adding hostname
echo "$HOSTNAME" >> /etc/hostname

echo "Done"
exit
umount -R /mnt
reboot
