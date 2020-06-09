#!/usr/bin/bash
# -*- coding: utf-8 -*-
# @date: 2012-03-02
# @date: 2018-07-10
# @date: 2018-10-30
# @author: Frank Xu
# @description: This script bootstrap a raw ubuntu system with my own config

# Set zsh as default
# TODO: should improve below without typing password, to make it automatically
sudo apt install zsh
sudo chsh -s $(which zsh)

sudo apt install -y git vim tmux
# find /usr/share/vim/ -name 'less.sh' -exec sudo cp {} /usr/local/bin/vless \;
# sudo apt-get install -y python2.7 python-pip

git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


if [ ! -f ~/.zshrc ]; then
    ln -s ~/frank_config/.zshrc ~/.zshrc
fi

if [ ! -f ~/.zshrc.d ]; then
    ln -s ~/frank_config/.zshrc.d ~/.zshrc.d
fi

if [ ! -f  ~/.vimrc ]; then
    ln -s ~/frank_config/.vimrc ~/.vimrc
fi

if [ ! -f ~/.vim ]; then
    ln -s ~/frank_config/.vim ~/.vim
fi

if [ ! -f  ~/.emacsclient ]; then
    ln -s ~/frank_config/.emacsclient ~/.emacsclient
fi

mkdir -p ~/.oh-my-zsh/custom/themes/
ln -s ~/frank_config/bira-no-ruby.zsh-theme ~/.oh-my-zsh/custom/themes/bira-no-ruby.zsh-theme
#cp -r ~/.fonts ~/

# Tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf

vim +PlugInstall +qall
