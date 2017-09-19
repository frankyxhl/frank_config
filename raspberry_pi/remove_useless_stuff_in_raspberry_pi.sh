#!/bin/bash
# -*- coding: utf-8 -*-
# @date: 2012-09-20
# @author: Frank.Xu
# @version: 0.1
# @description: Remove not useless packages in Pi

sudo apt-get remove --purge wolfram-engine libreoffice*
sudo apt-get clean
sudo apt-get autoremove
