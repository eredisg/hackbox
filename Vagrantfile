# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "kalilinux/rolling"

  config.vm.synced_folder "D://Development", "/media/Development"
  
  config.vm.provider "vmware_workstation" do |vm|
    vm.vmx['displayName'] = "Hackbox"
    vm.gui = true
    vm.memory = 8096
  end
  
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update -y
  SHELL
  
  # Create symlink of shared folder
  config.vm.provision :shell, inline: "ln -s /media/Development /home/vagrant/Development", run: "once"
  
  # Copy SSH configs to /home/vagrant/.ssh
  config.vm.provision "file", source: ".ssh", destination: "/home/vagrant/.ssh"
  
  # Copy dotfile configs to /home/vagrant/.config
  config.vm.provision "file", source: ".config", destination: "/home/vagrant/.config"
  
  # Copy .zshrc
  config.vm.provision "file", source: ".zshrc", destination: "/home/vagrant/.zshrc"
  
  # Copy .tmux.conf
  config.vm.provision "file", source: ".tmux.conf", destination: "/home/vagrant/.tmux.conf"

  # Copy background image
  config.vm.provision "file", source: "pictures/background.jpg", destination: "/home/vagrant/Pictures/background.jpg"

  # Download Burp Suite Pro
  config.vm.provision :shell, inline: "wget -O /opt/burp_pro.sh \"https://portswigger-cdn.net/burp/releases/download?product=pro&type=Linux\"", run: "once"

  # Install alacritty terminal
  config.vm.provision :shell, inline: "apt install alacritty -y"

  # Run additional app installs
  config.vm.provision :shell, inline: "xfce4-panel-profiles load ~/.config/xfce-profile.tar.bz2", privileged: false
  
  # Run additional app installs
  config.vm.provision :shell, path: "scripts/install-base.sh", privileged: false
end
