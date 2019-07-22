#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @date: 2018-10-04
# @author: Frank.Xu
# @version_info: 0.1.0
# @description: Install python packages for emacs(spacemacs)
import os, sys

# TODO: https://github.com/rupa/z
# TODO: https://github.com/Wyntau/fzf-zsh
# TODO: http://terminal.sexy
def is_python3():
    print("Checking Python3")
    if sys.version_info < (3, 0):
        print("Sorry, this program requires Python's version bigger than 3")
        sys.exit(1)

class TColors:
    """
    Terminal Colors
    """
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

BAR = "="*80

def green_print(s):
    return "{}{}{}".format(TColors.OKGREEN, s, TColors.ENDC)


def blue_print(s):
    return "{}{}{}".format(TColors.OKBLUE, s, TColors.ENDC)


def warning_print(s):
    return "{}{}{}".format(TColors.WARNING, s, TColors.ENDC)


def arch_install():
    print_and_cmd_list = [
        ("Sudo true"                         ,["sudo true"]),
        ("Upgrade"                           ,["yes | sudo pacman -Syu"]),
        ("Installing packages..."            ,["yes | sudo pacman -Syy vim tmux zsh mosh"]),
        # ("Use Vim's visul mode ..."          ,["find /usr/share/vim/ -name 'less.sh' -exec sudo cp {} /usr/local/bin/vless \;"]),
        # sudo apt-get install -y python2.7 python-pip
        ("Installing oh-my-zsh.."            ,["if [ ! -d ~/.oh-my-zsh ]; then git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh; fi"]),
        ("Install Zsh-autosuggestions in oh-my-zsh", [
            "if [ ! -d ~/.oh-my-zsh/custom/plugins ]; then mkdir -p ~/.oh-my-zsh/custom/plugins; fi",
            "if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions; fi"]),
        ("Install custom themes"             ,["if [ ! -d ~/.oh-my-zsh/custom/themes ]; then mkdir -p ~/.oh-my-zsh/custom/themes; fi",
                                               "if [ ! -f ~/.oh-my-zsh/custom/themes/bira-no-ruby.zsh-theme ]; then ln -s ~/frank_config/bira-no-ruby.zsh-theme ~/.oh-my-zsh/custom/themes/bira-no-ruby.zsh-theme; fi",
                                               "if [ ! -d ~/.zsh/zsh-autosuggestions ]; then git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions; fi"]),
        ("Install Tmux plugin"               ,["if [ ! -d ~/.tmux/plugins/tpm ]; then git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; fi"]),
        ("Install default Vim's plugin",      ["vim +PlugInstall +qall"]),

        # TODO Seems error in majanro i3wm because it's uxvt
        ("Change default sh to zsh"          ,["chsh - s $(which zsh)"]),
    ]
    for (show_message, cmd_list) in print_and_cmd_list:
        print(green_print(show_message))
        print(blue_print(BAR))
        for cmd in cmd_list:
            print(cmd)
            if os.system(cmd) != 0:
                print("Error happens in cmd: {}".format(cmd))
                sys.exit(1)


def link():
    print("Linking dot files and folder to home path...")
    filename_list = [
        ".tmux.conf",
        ".zshrc",
        ".vimrc",
        ".vim",
        ".xonshrc",
        ".spacemacs",
        ".emacs.private.el"
    ]
    for name in filename_list:
        cmd = "if [ ! -f ~/{} ]; then ln -s ~/frank_config/{} ~/{};fi".format(name, name, name)
        print(green_print(cmd))
        print(blue_print(BAR))
        os.system(cmd)
    folder_list = [
        ".zshrc.d",
        ".vim",
        ".emacs.private.d"
    ]
    for name in folder_list:
        cmd = "if [ ! -d ~/{} ]; then ln -s ~/frank_config/{} ~/{};fi".format(name, name, name)
        print(green_print(cmd))
        print(blue_print(BAR))
        os.system(cmd)


if __name__ == "__main__":
    is_python3()
    arch_install()
    link()
