#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @date: 2018-10-04
# @author: Frank.Xu
# @version_info: 0.1.0
# @description: Install python packages for emacs(spacemacs)
import os, sys


def is_python3():
    print("Checking Python3")
    if sys.version_info < (3, 0):
        print("Sorry, this program require Python version bigger than 3.x")
        sys.exit(1)


def arch_install():
    print_and_cmd_list = [
        ("Sudo true"                         ,["sudo true"]),
        ("Upgrade"                           ,["yes | sudo pacman -Syu"]),
        ("Installing packages..."            ,["yes | sudo pacman -Syy vim tmux zsh mosh"]),
        # ("Use Vim's visul mode ..."          ,["find /usr/share/vim/ -name 'less.sh' -exec sudo cp {} /usr/local/bin/vless \;"]),
        # sudo apt-get install -y autojump python2.7 python-pip
        ("Installing oh-my-zsh.."            ,["if [ ! -d ~/.oh-my-zsh ]; then git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh; fi"]),
        ("Install Zsh-autosuggestions in oh-my-zsh", [
            "if [ ! -d ~/.oh-my-zsh/custom/plugins ]; then mkdir -p ~/.oh-my-zsh/custom/plugins; fi",
            "if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions; fi"]),
        ("Install custom themes"             ,["if [ ! -d ~/.oh-my-zsh/custom/themes ]; then mkdir -p ~/.oh-my-zsh/custom/themes; fi",
                                               "if [ ! -f ~/bira-no-ruby.zsh-theme ]; then ln -s ~/frank_config/bira-no-ruby.zsh-theme ~/.oh-my-zsh/custom/themes/bira-no-ruby.zsh-theme; fi"]),
        ("Install Tmux plugin"               ,["if [ ! -d ~/.tmux/plugins/tpm ]; then git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; fi"]),
    ]
    for (show_message, cmd_list) in print_and_cmd_list:
        print(show_message)
        for cmd in cmd_list:
            print(cmd)
            if os.system(cmd) != 0:
                print("Error happens in cmd: {}".format(cmd))
                sys.exit(1)


def link():
    print("Linking dot files to home path...")
    linking_name_list = [
        ".emacs",
        ".emacs.d",
        ".tmux.conf",
        ".zshrc",
        ".zshrc.d",
        ".vimrc",
        ".vim",
        ".emacsclient",
        ".xonsh"
    ]
    for name in linking_name_list:
        cmd = "if [ ! -f ~/{} ]; then ln -s ~/frank_config/{} ~/{};fi".format(name, name, name)
        print(cmd)
        os.system(cmd)


if __name__ == "__main__":
    is_python3()
    arch_install()
    link()
