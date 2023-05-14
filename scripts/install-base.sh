#!/bin/bash
wget https://starship.rs/install.sh
chmod +x install.sh
sudo ./install.sh -y
rm install.sh

sudo apt install alacritty -y

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/RobotoMono.zip
unzip RobotoMono.zip
sudo mv *.ttf /usr/share/fonts
fc-cache -vf /home/vagrant/.local/share/fonts/
mv 10-powerline-symbols.conf /home/vagrant/.config/fontconfig/conf.d/
rm RobotoMono.zip

sudo apt install npm -y
sudo npm i -g alacritty-themes
alacritty-themes Atelierforest.dark
