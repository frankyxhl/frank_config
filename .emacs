;;========================================
;; start the emacsserver that listens to emacsclient
(server-start)
; ===========================================================================
; My Emacs Config
; Frank.Xu (franky.xhl[at]gmail.com)
; ===========================================================================
;; Packages Need

;; load other set
(add-to-list 'load-path "~/.emacs.d/")  ;;should set again if the enviroment has been changed
(add-to-list 'load-path "~/.emacs.d/lisp")
(load "emacs-package-settings")

(require 'monokai-theme)

;; Basic settings


(setq inhibit-startup-screen t);; close welcome screen
(setq column-number-mode t);; enable column mode
(setq visible-bell t)
(setq frame-title-format "%b");; set title
(auto-image-file-mode);; enable image view
(auto-compression-mode 1);; set compression mode
(transient-mark-mode t);; unknown
(tool-bar-mode -1);; remove tool bar
(fset 'yes-or-no-p 'y-or-n-p);; use y/n to anwser

(put 'dired-find-alternate-file 'disabled nil)
(global-unset-key [?\C- ])

(global-hl-line-mode t)
(setq-default make-backup-files nil)
;; (require 'color-theme-luolE-darknight)
;; (color-theme-luolE-darknight)
;; (require 'jazz-theme)

(load "emacs-redef")
(load "emacs-keymap")
(load "emacs-plugin")
(load "emacs-lisp")

(print "Full .emacs file loaded successfully")
