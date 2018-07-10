#!/usr/bin/bash
# -*- coding: utf-8 -*-
# @date: 2012-03-02
# @date: 2018-07-10
# @author: Frank Xu
sudo apt-get install -y git vim tmux zsh
find /usr/share/vim/ -name 'less.sh' -exec sudo cp {} /usr/local/bin/vless \;
# sudo apt-get install -y autojump python2.7 python-pip

git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions


# https://github.com/mooz/percol
# sudo pip2 install percol


#ln -s ~/frank_config/.emacs ~/.emacs
#ln -s ~/frank_config/.emacs.d ~/.emacs.d
if [ ! -f ~/.zshrc.js ]; then
    ln -s ~/frank_config/.zshrc ~/.zshrc
fi

if [ ! -f ~/.zshrc.d ]; then
    ln -s ~/frank_config/.zshrc.d ~/.zshrc.d
fi

if [ ! -f  ~/.vimrc ]; then
    ln -s ~/frank_config/.vimrc ~/.vimrc
fi

if [ ! -f ~/~/.vim ]; then
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

# Set zsh as default shell
sudo chsh -s $(which zsh)
