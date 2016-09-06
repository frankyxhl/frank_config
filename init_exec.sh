#!/usr/bin/zsh
# -*- coding: utf-8 -*-
# @date: 2012-03-02
# @author: Frank.Xu
#sudo apt-get install vim-nox tmux zsh 
#find /usr/share/vim/ -name 'less.sh' -exec sudo cp {} /usr/local/bin/vless \;
sudo apt-get install -y autojump
cd && git clone https://github.com/robbyrussell/oh-my-zsh.git
mv oh-my-zsh .oh-my-zsh
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
ln -s ~/frank_config/.emacs ~/.emacs
ln -s ~/frank_config/.emacs.d ~/.emacs.d
ln -s ~/frank_config/.tmux.conf ~/.tmux.conf
ln -s ~/frank_config/.zshrc ~/.zshrc
ln -s ~/frank_config/.vimrc ~/.vimrc
ln -s ~/frank_config/.vim ~/.vim
ln -s ~/frank_config/.emacsclient ~/.emacsclient
#cp -r ~/.fonts ~/
