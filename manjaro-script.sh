#!/bin/bash

#  Update
sudo pacman -Syyuu --noconfirm

# Prerequirements
sudo pacman -S --noconfirm neovim curl wget tar bzip2 git base-devel\
                        yarn npm \
			re2c gd oniguruma postgresql-libs libzip libxml2 autoconf automake bison gettext krb5 libedit libjpeg libpng libzip openssl pkg-config zlib \
						
###  Installing and Enabling Printing Service
##  Installing Printing Service
sudo pamac install manjaro-printer avahi --noconfirm && \
sudo gpasswd -a $USER sys

##  Enabling Printing Service
sudo systemctl enable --now cups.service && \
sudo systemctl enable --now cups.socket && \
sudo systemctl enable --now cups.path && \
sudo systemctl enable --now avahi-daemon.service


###  Installing YAY (Yet Another Yogurt)
sudo pacman -S --needed git base-devel --noconfirm && \
cd /tmp && \
git clone https://aur.archlinux.org/yay.git  && \
cd yay && \
makepkg -si

###  Installing Powerlevel10k (already installed)
# yay -S --noconfirm zsh-theme-powerlevel10k-git
# echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

### ASDF-VM
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0

# Plugins
asdf plugin add rust
asdf install rust 1.59.0

asdf plugin add nodejs
asdf install nodejs 17.7.1

asdf plugin add ruby
asdf install ruby 3.1.1

asdf plugin add python
asdf install python 3.10.3

asdf plugin add golang
asdf install golang 1.18

asdf plugin add php
asdf install php 8.1.4

###  Installing LunarVim
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

# All Rust dependencies are successfully installed
# --------------------------------------------------------------------------------
#Cloning LunarVim configuration
#Cloning into '/home/rafael/.local/share/lunarvim/lvim'...
#remote: Enumerating objects: 164, done.
#remote: Counting objects: 100% (164/164), done.
#remote: Compressing objects: 100% (155/155), done.
#remote: Total 164 (delta 5), reused 91 (delta 3), pack-reused 0
#Receiving objects: 100% (164/164), 1.64 MiB | 5.05 MiB/s, done.
#Resolving deltas: 100% (5/5), done.
#--------------------------------------------------------------------------------
#Installing LunarVim shim
#make: Entering directory '/home/rafael/.local/share/lunarvim/lvim'
#starting LunarVim bin-installer
#bash ./utils/installer/install_bin.sh
#You can start LunarVim by running: /home/rafael/.local/bin/lvim
#make: Leaving directory '/home/rafael/.local/share/lunarvim/lvim'
#Preparing Packer setup
#Packer setup complete
#--------------------------------------------------------------------------------
#Thank you for installing LunarVim!!
#You can start it by running: /home/rafael/.local/bin/lvim
#Do not forget to use a font with glyphs (icons) support [https://github.com/ryanoasis/nerd-fonts]

# >> $HOME/.config/lvim/config.lua
#>>(+) vim.opt.timeoutlen = 500


### Rust alternatives
cargo install exa bat procs sd starship ripgrep tokei hyperfine ytop tealdeer bandwhich grex rmesg zoxide 

### Some tools
yay -S docker gdb
sudo usermod -aG docker $USER
