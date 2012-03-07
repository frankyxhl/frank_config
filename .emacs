;; .emacs profile, written by shell.xu
(setq inhibit-startup-screen t);; close welcome screen
(setq column-number-mode t);; enable column mode
(setq default-major-mode 'text-mode);; set default mode
(show-paren-mode t);; unknown
(setq show-paren-style 'parentheses)
(setq visible-bell t)
(setq frame-title-format "%b");; set title
(auto-image-file-mode);; enable image view
(auto-compression-mode 1);; set compression mode
(transient-mark-mode t);; unknown
(tool-bar-mode -1);; remove tool bar
(fset 'yes-or-no-p 'y-or-n-p);; use y/n to anwser
(setq uniquify-buffer-name-style 'forward);; it's said that it can control buffer's name, but look like not work
(pc-selection-mode);; use shift + [array] to select
(put 'dired-find-alternate-file 'disabled nil)
(global-unset-key [?\C- ])

;; load other set
(add-to-list 'load-path "~/.emacs.d/")  ;;should set again if the enviroment has been changed
(load "color-theme")
(load "csv-mode")
(load "emacs-redef")
(load "emacs-plugin")
(load "python-indent")

;;lily pond mode load

(autoload 'LilyPond-mode "lilypond-mode" "LilyPond Editing Mode" t)
(add-to-list 'auto-mode-alist '("\\.ly$" . LilyPond-mode))
(add-to-list 'auto-mode-alist '("\\.ily$" . LilyPond-mode))
(add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  Below is written by Frank.Xu
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-interval 1)
(setq display-time-format "%m月%d日%H点%M分%S秒")
(display-time-mode 1)
 ;;shut up left scroll-bar in linux windows,去掉左边的滚轴
;; (scroll-bar-mode nil)
(scroll-bar-mode -1)  
(setq make-backup-file nil)
(setq auto-save-default nil)
(load "emacs-keymap")
(abbrev-mode 1)
(setq default-abbrev-mode t)
(add-to-list 'load-path "~/.emacs.d/company")
(autoload 'company-mode "company" nil t)
;; 打开自动文件文件打开模式
;;(ido-mode 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   去掉菜单栏
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(menu-bar-mode nil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   设置字体
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(set-frame-font "Monaco")
(set-fontset-font "fontset-default" 'han '("文泉驿等宽正黑" . "unicode-bmp"))
;;Pinbar-mode顶部Alt键
(require 'pinbar)
(global-set-key "\M-0" 'pinbar-add)
;;(pinbar-mode t)
;;Lua mode setting
(setq auto-mode-alist (cons '("\\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-hook 'lua-mode-hook 'turn-on-font-lock)
(add-hook 'lua-mode-hook 'hs-minor-mode)

(require 'color-theme-luolE-darknight )

;; (load "pymacs-settings")
;; (add-to-list 'load-path
             ;; "~/.emacs.d/yasnippet-0.6.1c/snippets")
;; (require 'yasnippet-bundle)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 透明背景
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (set-frame-parameter (selected-frame) 'alpha '(85 50))
;; (add-to-list 'default-frame-alist '(alpha 85 50))

(load "javascript-mode")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 高亮当前行
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-hl-line-mode t) 

(setq-default make-backup-files nil)
(color-theme-luolE-darknight)
;; (color-theme-midnight)
(require 'scim-bridge)
(add-hook 'after-init-hook 'scim-mode-on)
(require 'scim-bridge-zh-si)
(add-hook 'after-init-hook 'scim-mode-on)

;; (defun lisp-indent-or-complete (&optional arg)
  ;; (interactive "p")
  ;; (if (or (looking-back "^\\s-*") (bolp))
      ;; (call-interactively 'lisp-indent-line)
      ;; (call-interactively 'slime-indent-and-complete-symbol)))
;; (eval-after-load "lisp-mode"
  ;; '(progn
     ;; (define-key lisp-mode-map (kbd "TAB") 'lisp-indent-or-complete)))

(define-key key-translation-map [?\(] [?\[])
(define-key key-translation-map [?\[] [?\(])
(define-key key-translation-map [?\)] [?\]])
(define-key key-translation-map [?\]] [?\)])


(require 'paredit)
(add-hook 'emacs-lisp-mode-hook		(lambda () (paredit-mode 1)))
(add-hook 'lisp-mode-hook		(lambda () (paredit-mode 1)))
(add-hook 'lisp-interaction-mode-hook	(lambda () (paredit-mode 1)))
;; (add-hook 'python-mode-hook		(lambda () (paredit-mode 1)))
;; (add-hook 'scheme-mode-hook		(lambda () (paredit-mode 1)))

(require 'parenface)
(set-face-foreground 'paren-face "gray30")

(setq show-paren-delay 0)

(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")

(setq skeleton-pair t)
(global-set-key "(" 'skeleton-pair-insert-maybe)
(global-set-key "'" 'skeleton-pair-insert-maybe)
(global-set-key "[" 'skeleton-pair-insert-maybe)

(setq slime-net-coding-system 'utf-8-unix)
(linum-mode 1)
(ido-mode 1)



(require 'coffee-mode)

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(require 'mwe-color-box)
;; (load "js2")


(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(setq default-buffer-file-coding-system 'utf-8)

(defalias 'ar 'align-regexp)
(require 'anything)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

