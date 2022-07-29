pacman -Syy &&
pacman -Syu &&
pacman -Sy figlet &&
mkfs.fat -F 32 /dev/sda1 &&
mkswap /dev/sda2 &&
mkfs.ext4 /dev/sda3 &&
mount /dev/sda3 /mnt &&
swapon /dev/sda2 &&
mount --mkdir /dev/sda1 /mnt/boot/efi &&
pacstrap /mnt linux linux-headers linux-firmware base base-devel grub efibootmgr nano vim networkmanager net-tools openssh xorg lightdm-webkit2-greeter bspwm sxhkd alacritty code rofi ttf-liberation ttf-nerd-fonts-symbols bluez blueman v4l2loopback-dkms pipewire pipewire-alsa pipewire-pulse pipewire-jack pavucontrol git picom nitrogen polybar htop neofetch unzip amd-ucode intel-ucode nvidia virtualbox blender &&
pacstrap /mnt mpv obs-studio firefox &&
genfstab -U /mnt > /mnt/etc/fstab &&
arch-chroot /mnt ln -sf /usr/share/zoneinfo/Asia/Tbilisi /etc/localtime &&
arch-chroot /mnt sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen &&
arch-chroot /mnt locale-gen &&
arch-chroot /mnt touch /etc/locale.conf &&
arch-chroot /mnt echo LANG=en_US.UTF-8 > /etc/locale.conf &&
arch-chroot /mnt touch /etc/hostname &&
arch-chroot /mnt echo archlinux > /etc/hostname &&
arch-chroot /mnt passwd &&
arch-chroot /mnt useradd -m -G wheel -s /bin/bash arch &&
arch-chroot /mnt passwd arch &&
arch-chroot /mnt sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/g' /etc/sudoers &&
arch-chroot /mnt grub-install /dev/sda &&
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg &&
arch-chroot /mnt sed -i 's/#greeter-session=example-gtk-gnome/greeter-session=lightdm-webkit2-greeter/g' /etc/lightdm/lightdm.conf &&
arch-chroot /mnt sed -i 's/#user-session=default/user-session=default/g' /etc/lightdm/lightdm.conf &&
arch-chroot /mnt systemctl enable lightdm &&
arch-chroot /mnt systemctl enable NetworkManager &&
umount -a &&
figlet INSTALLATION COMPLETE
