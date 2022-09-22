#!/bin/bash
sudo apt purge snapd -y
#sudo wget https://github.com/SteavenGamerYT/SteavenBuntu/raw/main/nosnap.pref -P /etc/apt/preferences.d/
#sudo wget https://github.com/SteavenGamerYT/SteavenBuntu/raw/main/nonautilus.pref -P /etc/apt/preferences.d/
#sudo wget https://github.com/SteavenGamerYT/SteavenBuntu/raw/main/nolibreoffice.pref -P /etc/apt/preferences.d/
#sudo wget https://github.com/SteavenGamerYT/SteavenBuntu/raw/main/nogdm.pref -P /etc/apt/preferences.d/
sudo wget https://github.com/SteavenGamerYT/SteavenBuntu/raw/main/01-network-manager-all.yaml -P /etc/netplan/
sudo add-apt-repository ppa:papirus/papirus -y
sudo apt update
sudo apt upgrade -y
yes | sudo apt-get install xorg xterm menu gksu synaptic --no-install-recommends
yes | sudo apt-get install gnome-session gnome-panel metacity gnome-terminal --no-install-recommends
yes | sudo apt install gnome-shell-extension-dash-to-panel gnome-shell-extension-desktop-icons gnome-shell-extension-gamemode nemo lightdm lightdm-settings git wget papirus-icon-theme firefox gnome-shell-extension-top-icons-plus
sudo wget https://github.com/SteavenGamerYT/SteavenBuntu/raw/main/pop-gnome-shell-theme_5.3.1_all.deb -O ~/pop-shell-theme.deb
sudo wget https://github.com/SteavenGamerYT/SteavenBuntu/raw/main/pop-gtk-theme_5.3.1_all.deb -O ~/pop-gtk-theme.deb
sudo wget https://github.com/SteavenGamerYT/SteavenBuntu/raw/main/pop-sound-theme_5.3.1_all.deb -O ~/pop-sound-theme.deb
sudo dpkg --force-all -i ~/pop-shell-theme.deb
sudo dpkg --force-all -i ~/pop-gtk-theme.deb
sudo dpkg --force-all -i ~/pop-sound-theme.deb
sudo apt install -f -y
sudo apt install gedit
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
gsettings set org.gnome.desktop.interface gtk-theme Pop
gsettings set org.gnome.desktop.wm.preferences theme Pop
gsettings set org.gnome.desktop.interface icon-theme Papirus-Light
gnome-extensions enable dash-to-panel@jderose9.github.com
gnome-extensions enable desktop-icons@csoriano
gnome-extensions enable gamemode@christian.kellner.me
gnome-extensions enable TopIcons@phocean.net
