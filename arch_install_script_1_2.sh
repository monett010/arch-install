#!/bin/bash


# installing some important programs first...
echo 'Installing some important programs first...'
pacman -S nano vim sudo

# setting up graphics drivers and gui...
echo 'Setting up graphics drivers and gui...'
pacman -S intel-media-driver mesa xf86-video-amdgpu xf86-video-vmware libva-intel-driver vulkan-intel xf86-video-ati xorg-server libva-mesa-driver vulkan-radeon xorg-xinit
pacman -S xorg lightdm lightdm-slick-greeter lightdm-gtk-greeter budgie budgie-desktop-view budgie-backgrounds network-manager-applet networkmanager
pacman -S caja mate-terminal firefox
pacman -S arc-gtk-theme papirus-icon-theme

echo 'Configuring Xorg...'
Xorg :0 -configure
cp /root/xorg.conf.new /etc/X11/xorg.conf
systemctl enable lightdm
systemctl enable NetworkManager

cd /etc

# set the locale
touch locale.conf
echo "LANG=en_US.UTF-8" > locale.conf

# make hostname
touch hostname
echo "blue-yoshi" > hostname

cd /

# set root password
passwd

echo "Don't forget to run arch_install_script_2.sh to setup GRUB next."