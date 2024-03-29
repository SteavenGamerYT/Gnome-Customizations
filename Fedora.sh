#!/bin/bash

# RPM Fusion

sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf group update core -y

# install snaps
sudo dnf install snapd -y
sudo ln -s /var/lib/snapd/snap /snap

# installing git
sudo dnf install git -y

# enabling flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Gnome Extensions
sudo dnf install gnome-shell-extensions -y 
sudo flatpak install flathub com.mattjakeman.ExtensionManager -y

#zsh
sudo dnf install zsh zsh-syntax-highlighting autojump zsh-autosuggestions -y
touch "~/.cache/zshhistory"
#-- Setup Alias in $HOME/zsh/aliasrc
mkdir ~/.zsh
mkdir ~/.zsh/plugins/
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/plugins/powerlevel10k
echo 'source ~/.zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ~/.zsh/plugins/zsh-autocomplete
echo 'source ~/.zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh' >> ~/.zshrc

# make zsh default
chsh -s $(which zsh)

# fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
sudo unzip FiraCode.zip -d "/usr/share/fonts"
sudo unzip Meslo.zip -d "/usr/share/fonts"
sudo fc-cache -vf
rm ./FiraCode.zip ./Meslo.zip

# theme
sudo git clone https://github.com/EliverLara/Nordic.git /usr/share/themes/Nordic
gsettings set org.gnome.desktop.interface gtk-theme Nordic
gsettings set org.gnome.desktop.wm.preferences theme Nordic

# gtk 4 support
wget https://github.com/odziom91/libadwaita-themes/raw/main/nordic/nordic-v42.zip
sudo unzip nordic-v42.zip -d /root/.config/
unzip nordic-v42.zip -d ~/.config/

# snap theme support
sudo snap install gtk-theme-nordic --edge
for i in $(snap connections | grep gtk-common-themes:gtk-3-themes | awk '{print $2}'); do sudo snap connect $i gtk-theme-nordic:gtk-3-themes; done
for i in $(snap connections | grep gtk-common-themes:gtk-4-themes | awk '{print $2}'); do sudo snap connect $i gtk-theme-nordic:gtk-4-themes; done

# flatpak theme support
sudo flatpak override --env=GTK_THEME=nordic
sudo flatpak override --env=ICON_THEME=papirus-dark

# icon theme
sudo dnf install papirus-icon-theme -y
gsettings set org.gnome.desktop.interface icon-theme Papirus-Dark

# Install brave-browser
sudo dnf install dnf-plugins-core -y
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/ -y 
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc -y
sudo dnf install brave-browser -y

# remove firefox
sudo snap remove firefox

# ubuntu spyware remover
sudo dnf purge ubuntu-report popularity-contest apport whoopsie -y
sudo dnf autoremove --purge -y

# installing vlc
sudo dnf install vlc -y

# power managment
sudo dnf purge -y power-profiles-daemon
sudo snap install auto-cpufreq
sudo auto-cpufreq --install

# install neofetch
sudo dnf install neofetch -y 

# preload
sudo dnf copr enable elxreno/preload -y && sudo dnf install preload -y
sudo systemctl enable preload
sudo systemctl start preload

# github dekstop
 sudo rpm --import https://mirror.mwt.me/ghd/gpgkey -y
 sudo sh -c 'echo -e "[shiftkey]\nname=GitHub Desktop\nbaseurl=https://mirror.mwt.me/ghd/rpm\nenabled=1\ngpgcheck=0\nrepo_gpgcheck=1\ngpgkey=https://mirror.mwt.me/ghd/gpgkey" > /etc/yum.repos.d/shiftkey-desktop.repo' 
 sudo dnf install github-desktop -y
# make english default
echo "LC_ALL=en_US.UTF-8" | sudo tee -a /etc/environment

