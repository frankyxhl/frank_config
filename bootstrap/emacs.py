#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# @date: 2018-10-04
# @author: Frank.Xu
# @version_info: 0.1.0
# @description: Install python packages for emacs(spacemacs)
import os, sys

PIP_INSTALL_LIST = [
    "python-language-server",
    "importmagic",
    "epc"
]

def is_python3():
    print("Checking Python3")
    if sys.version_info < (3, 0):
        sys.stdout.write("Sorry, requires Python 3.x\n")
        sys.exit(1)


def install()
    cmd = "pip install {}".format(" ".join(PIP_INSTALL_LIST))


if __name__ == "__main__":
    is_python3()
    install()
