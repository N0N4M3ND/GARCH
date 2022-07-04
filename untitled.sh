pacman -Sy figlet &&
mkfs.fat -F 32 /dev/sda1 && mkswap /dev/sda2 &&
mkfs.ext4 /dev/sda3 && 
mount /dev/sda3 /mnt &&
swapon /dev/sda2 &&
mount --mkdir /dev/sda1 /mnt/boot/efi &&
timedatectl set-ntp true &&
pacstrap /mnt linux linux-firmware base base-devel grub efibootmgr nano vim networkmanager xorg lightdm-webkit2-greeter bspwm sxhkd alacritty ttf-liberation rofi pipewire pipewire-alsa pipewire-pulse pipewire-jack pavucontrol git neofetch lxappearance nitrogen picom polybar unzip amd-ucode nvidia && pacstrap /mnt mpv obs-studio firefox &&
genfstab -U /mnt > /mnt/etc/fstab &&
arch-chroot /mnt ln -sf /usr/share/zoneinfo/Asia/Tbilisi /etc/localtime &&
arch-chroot /mnt sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen &&
arch-chroot /mnt locale-gen &&
arch-chroot /mnt touch /etc/locale.conf &&
arch-chroot /mnt echo LANG=en_US.UTF-8 > /etc/locale.conf &&
arch-chroot /mnt touch /etc/hostname &&
arch-chroot /mnt echo archlinux > /etc/hostname && arch-chroot /mnt passwd &&
arch-chroot /mnt useradd -m -G wheel -s /bin/bash arch &&
arch-chroot /mnt passwd arch && arch-chroot /mnt grub-install /dev/sda &&
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg &&
arch-chroot /mnt sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/g' /etc/sudoers &&
arch-chroot /mnt sed -i 's/#greeter-session=example-gtk-gnome/greeter-session=lightdm-webkit2-greeter/g' /etc/lightdm/lightdm.conf &&
sed -i 's/#user-session=default/user-session=default/g' /etc/lightdm/lightdm.conf &&
arch-chroot /mnt systemctl enable lightdm && arch-chroot /mnt systemctl enable NetworkManager &&
figlet THE INSTALLATION IS COMPLETE
