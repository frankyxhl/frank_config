#!/usr/bin/bash
# -*- coding: utf-8 -*-
# @date: 2012-03-02
# @author: Frank Xu
sudo true
sudo apt-get install -y git vim tmux zsh autojump
find /usr/share/vim/ -name 'less.sh' -exec sudo cp {} /usr/local/bin/vless \;
# sudo apt-get install -y autojump python2.7 python-pip

# https://github.com/mooz/percol
# sudo pip2 install percol


#ln -s ~/frank_config/.emacs ~/.emacs
#ln -s ~/frank_config/.emacs.d ~/.emacs.d
echo 'configure .zshrc'
if [ ! -f ~/.zshrc.js ]; then
    ln -s ~/frank_config/.zshrc ~/.zshrc
fi

if [ ! -f ~/.zshrc.d ]; then
    ln -s ~/frank_config/.zshrc.d ~/.zshrc.d
fi

echo 'configure .vimrc'
if [ ! -f  ~/.vimrc ]; then
    ln -s ~/frank_config/.vimrc ~/.vimrc
fi

if [ ! -f ~/~/.vim ]; then
    ln -s ~/frank_config/.vim ~/.vim
fi

echo 'configure .emacs'
if [ ! -f  ~/.emacsclient ]; then
    ln -s ~/frank_config/.emacsclient ~/.emacsclient
fi

echo 'configure tmux'
if [ ! -f  ~/.tmux.conf ]; then
    ln -s ~/frank_config/.tmux.conf ~/.tmux.conf
fi

echo 'configure oh-my-zsh'
if [ ! -d ~/.oh-my-zsh ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

if [ ! -d ~/.zsh/zsh-autosuggestions ]; then
    git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi


if [ ! -d ~/.oh-my-zsh/custom/themes ]; then
    mkdir -p ~/.oh-my-zsh/custom/themes
fi

if [ ! -d ~/.oh-my-zsh/plugins/zsh-syntax-highlighting ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
fi

echo 'configure oh-my-zsh custom theme'
if [ ! -f  ~/.oh-my-zsh/custom/themes/bira-no-ruby.zsh-theme ]; then
    ln -s ~/frank_config/bira-no-ruby.zsh-theme ~/.oh-my-zsh/custom/themes/bira-no-ruby.zsh-theme
fi
#cp -r ~/.fonts ~/

echo 'configure Tmux'
if [ ! -d ~/.tmux/plugins ]; then
    mkdir -p ~/.tmux/plugins
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    tmux source ~/.tmux.conf
fi

# Install default Vim's plugin
vim +PlugInstall +qall

# Set zsh as default shell
echo 'change default sh to zsh'
chsh -s $(which zsh)
