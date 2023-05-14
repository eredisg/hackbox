#!/bin/bash
sudo apt install jq fzf -y
cd ~/Downloads
tb_releases_url='https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release'
download_url=$(curl --silent $tb_releases_url | jq --raw-output '.TBA[0].downloads.linux.link')
curl --output jetbrains-toolbox.tgz --progress-bar --location $download_url
tar -xf jetbrains-toolbox.tgz

cd ~
wget https://starship.rs/install.sh
chmod +x install.sh
sudo ./install.sh -y
rm install.sh

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/RobotoMono.zip
mkdir fonts
unzip RobotoMono.zip -d fonts
sudo mv fonts/*.ttf /usr/share/fonts
fc-cache -vf /home/vagrant/.local/share/fonts/
mv 10-powerline-symbols.conf /home/vagrant/.config/fontconfig/conf.d/
rm RobotoMono.zip
rm -r fonts

sudo apt install npm -y
sudo npm i -g alacritty-themes
alacritty-themes Dracula

export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$UID/bus"
xfconf-query -c xfce4-desktop -np /backdrop/screen0/monitorVirtual1/workspace0/last-image -t 'string' -s /home/vagrant/Pictures/background.jpg

cd /usr/share/themes
sudo wget https://github.com/dracula/gtk/releases/download/v4.0.0/Dracula.tar.xz
sudo tar -xf Dracula.tar.xz
xfconf-query -c xsettings -np /Net/ThemeName -t 'string' -s Dracula
sudo rm Dracula.tar.xz

cd /usr/share/icons
sudo wget https://github.com/dracula/gtk/files/5214870/Dracula.zip
sudo unzip Dracula.zip
xfconf-query -c xsettings -np /Net/IconThemeName -t 'string' -s Dracula
sudo rm Dracula.zip