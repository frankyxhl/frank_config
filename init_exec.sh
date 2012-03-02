#!/usr/bin/zsh
# -*- coding: utf-8 -*-
# @date: 2012-03-02
# @author: Frank.Xu

sudo apt-get install vim
find /usr/share/vim/ -name 'less.sh' -exec sudo cp {} /usr/local/bin/vless \;
ln -s .emacs ~/.emacs
ln -s .emacs.d ~/.emacs.d 
ln -s .tmux.conf ~/.tmux.conf
ln -s .zshrc ~/.zshrc
