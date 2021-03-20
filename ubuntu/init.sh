#!/usr/bin/bash
# -*- coding: utf-8 -*-
# @date: 2012-03-02
# @date: 2021-03-20
# @author: Frank Xu
sudo true
sudo apt-get install -y git vim tmux zsh
find /usr/share/vim/ -name 'less.sh' -exec sudo cp {} /usr/local/bin/vless \;

echo 'configure .zshrc'
[ ! -f ~/.zshrc.js ] && ln -s ~/frank_config/.zshrc ~/.zshrc

[ ! -f ~/.zshrc.d ] && ln -s ~/frank_config/.zshrc.d ~/.zshrc.d

echo 'configure .vimrc'
[ ! -f  ~/.vimrc ] && ln -s ~/frank_config/.vimrc ~/.vimrc
[ ! -f ~/.vim ] && ln -s ~/frank_config/.vim ~/.vim

echo 'configure .emacs'
[ ! -f  ~/.emacsclient ] ln -s ~/frank_config/.emacsclient ~/.emacsclient

echo 'configure tmux'
[ ! -f  ~/.tmux.conf ] && ln -s ~/frank_config/.tmux.conf ~/.tmux.conf

echo 'configure oh-my-zsh'
[ ! -d ~/.oh-my-zsh ] && git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
[ ! -d ~/.zsh/zsh-autosuggestions ] && git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
[ ! -d ~/.oh-my-zsh/custom/themes ] && mkdir -p ~/.oh-my-zsh/custom/themes
[ ! -d ~/.oh-my-zsh/plugins/zsh-syntax-highlighting ] git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
[ ! -d ~/.oh-my-zsh/plugins/zsh-autosuggestions ] && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo 'configure oh-my-zsh custom theme'
[ ! -f  ~/.oh-my-zsh/custom/themes/bira-no-ruby.zsh-theme ] && ln -s ~/frank_config/bira-no-ruby.zsh-theme ~/.oh-my-zsh/custom/themes/bira-no-ruby.zsh-theme
#cp -r ~/.fonts ~/

echo 'configure Tmux'
if [ ! -d ~/.tmux/plugins ]; then
    mkdir -p ~/.tmux/plugins
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    tmux source ~/.tmux.conf
fi

[ ! -d ~/.xonshrc ] && ln -s ~/frank_config/.xonshrc ~/.xonshrc

# Install default Vim's plugin
vim +PlugInstall +qall

# Set zsh as default shell
echo 'change default sh to zsh'
chsh -s $(which zsh)
