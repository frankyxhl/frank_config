#!/usr/bin/python
# -*- coding: utf-8 -*-
# @date: 2009-06-25
# @author: shell.xu
from __future__ import with_statement
import os
import sys
from os import path
from Pymacs import lisp
interactions = {};

def walk_path (base_path, call_back):
    ''' '''
    for dirpath, dirnames, filenames in os.walk (base_path):
        for filename in filenames:
            fullname = path.join (dirpath, filename);
            call_back (fullname);

etags_path = 'C:\\Program Files\\emacs\\bin\\etags.exe';
ext_list = [".c", ".cpp", ".h", ".hpp", ".py"];
def gen_etags (target_file):
    ''' '''
    def etags_one (full_path):
        ''' '''
        bProc = False;
        full_path_lower = full_path.lower ();
        for ext in ext_list:
            if full_path_lower.endswith (ext):
                bProc = True;
                break;
        if bProc:
            os.spawnv (os.P_WAIT, etags_path,
                       ('etags.exe', full_path, "-a", "-o", target_file));
    return etags_one;

def gen_tag_table (cur_dir):
    """ """
    target_path = path.join (cur_dir, "TAGS");
    try:
        os.remove (target_path);
    except WindowsError:
        pass
    walk_path (cur_dir, gen_etags (target_path));

def tables ():
    ''' '''
    cur_dir = lisp.default_directory.value ();
    gen_tag_table (cur_dir);
    lisp.visit_tags_table (cur_dir, 'y');
interactions[tables] = '';

if __name__ == "__main__":
    if len (sys.argv) < 2:
        print "argv not enough.";
    gen_tag_table (sys.argv[1]);
