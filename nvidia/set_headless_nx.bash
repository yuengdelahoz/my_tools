#! /bin/bash
#
# set_headless_nx.bash
# Copyright (C) 2021 yuengdelahoz <yuengdelahoz@Yueng>
#
# Distributed under terms of the MIT license.
#



#clean up

sudo systemctl stop gdm3
sudo systemctl disable gdm3
sudo systemctl set-default multi-user.target

sudo apt purge ubuntu-desktop gdm3 -y

sudo apt-get remove -y \
	nautilus nautilus-* 
	#gnome-power-manager \
	#gnome-screensaver \
	#gnome-termina* \
	#gnome-pane* \
	#gnome-applet* \
	#gnome-desktop* \
	#gnome-sessio* \
	#gnome-user* \
	#gnome-shell-common \
	#zeitgeist-core \
	#libzeitgeist* \
	#gnome-control-center \
	#gnome-screenshot 

#remove unsed programs

sudo apt-get remove --purge libreoffice* -y
sudo apt-get remove libreoffice-core -y
sudo apt-get remove snapd lightdm cups chromium* -y
sudo apt-get remove libcurlpp0 -y
sudo apt-get purge xserver* -y

########################

cd ~
rm -rf Desktop
rm -rf Documents
rm -rf Downloads
rm -rf Public
rm -rf Videos
rm -rf Classes
rm -rf Music
rm -rf examples.desktop
rm -rf Templates/
rm -rf Pictures
rm -rf VisionWorks-SF*
rm -rf NVIDIA_CUDA-*

#remove sources
#cd /usr/src/
#sudo rm -rf *

#sudo userdel -r ubuntu
sudo apt autoremove -y && sudo apt autoclean -y

