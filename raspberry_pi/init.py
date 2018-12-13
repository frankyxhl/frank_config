#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# @date: 2017-09-20
# @author: Frank.Xu
# @version_info: 0.1.0
# @description: Initial install for Raspberry Pi
import os, sys

def is_python3():
    print("Checking Python3")
    if sys.version_info < (3, 0):
        sys.stdout.write("Sorry, requires Python 3.x\n")
        sys.exit(1)

def install():
    print_and_cmd_list = [
        ("Installing packages..."            ,["sudo apt-get install -y vim tmux zsh ntfs-3g"]),
        ("Use Vim's visul mode ..."          ,["find /usr/share/vim/ -name 'less.sh' -exec sudo cp {} /usr/local/bin/vless \;"]),
        # sudo apt-get install -y python2.7 python-pip
        ("Installing oh-my-zsh.."            ,["git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh"]),
        # ("Installing zsh-autosuggestions..." ,["git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions"]),
        # https://github.com/mooz/percol
        ("Installing percol"                 ,["sudo pip install percol"]),
        ("Install custom themes"             ,["mkdir -p ~/.oh-my-zsh/custom/themes/",
                                               "ln -s ~/frank_config/bira-no-ruby.zsh-theme ~/.oh-my-zsh/custom/themes/bira-no-ruby.zsh-theme"]),
        ("Install Tmux plugin"               ,["git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"]),
        ("Installing Tmux building environment", ["sudo apt install -y autoconf autogen libevent-dev libncurses5-dev"])
        # TODO check below
        # ?? # print_then_run("tmux source ~/.tmux.conf")
    ]
    for (show_message, cmd_list) in print_and_cmd_list:
        print(show_message)
        for cmd in cmd_list:
            print(cmd)
            if os.system(cmd) != 0:
                print("Error happens in cmd: {}".format(cmd))
                sys.exit(1)


def link():
    print("Linking dot files to user home path...")
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
        cmd = "if [ ! -f ~/{} ]; then ln -s ~/frank_config/{} ~/{};".format(name, name, name)
        print(cmd)
        os.system(cmd)


if __name__ == "__main__":
    is_python3()
    install()
    link()
    # 挂载
    # sudo mount -t ntfs-3g /dev/sda1 /mnt/buffalo/
