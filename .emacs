;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; My Emacs Config
;; Frank.Xu (franky.xhl[at]gmail.com)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (ido-mode 1)
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

(put 'dired-find-alternate-file 'disabled nil)
(global-unset-key [?\C- ])

;; load other set
(add-to-list 'load-path "~/.emacs.d/")  ;;should set again if the enviroment has been changed
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0") 
(require 'color-theme)
(load "csv-mode")
(load "emacs-redef")
(load "emacs-plugin")
(load "python-indent")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; lily pond mode load
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'LilyPond-mode "lilypond-mode" "LilyPond Editing Mode" t)
(add-to-list 'auto-mode-alist '("\\.ly$" . LilyPond-mode))
(add-to-list 'auto-mode-alist '("\\.ily$" . LilyPond-mode))
(add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  Below is written by Frank.Xu
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   去掉菜单栏
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(menu-bar-mode nil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   设置字体
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(set-frame-font "Monaco")

;;Pinbar-mode顶部Alt键
(require 'pinbar)
(global-set-key "\M-0" 'pinbar-add)
(pinbar-mode t)
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
;;------------------------------------------------------------------------------
;; 透明背景transparent background
;;------------------------------------------------------------------------------
(set-frame-parameter (selected-frame) 'alpha '(55 50))
(add-to-list 'default-frame-alist '(alpha 55 50))

(global-hl-line-mode t) 		;高亮当前行

(setq-default make-backup-files nil)
(color-theme-luolE-darknight)
;; (color-theme-midnight)
;; Debian下中文输入法问题
;; (require 'scim-bridge)
;; (add-hook 'after-init-hook 'scim-mode-on)
;; (require 'scim-bridge-zh-si)
;; (add-hook 'after-init-hook 'scim-mode-on)

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
;; (add-hook 'emacs-lisp-mode-hook		(lambda () (paredit-mode 1)))
;; (add-hook 'lisp-mode-hook		(lambda () (paredit-mode 1)))
;; (add-hook 'lisp-interaction-mode-hook	(lambda () (paredit-mode 1)))
;; (add-hook 'python-mode-hook		(lambda () (paredit-mode 1)))
;; (add-hook 'scheme-mode-hook		(lambda () (paredit-mode 1)))

(require 'parenface)
(set-face-foreground 'paren-face "gray30")

(setq show-paren-delay 0)

(if (eq system-type 'darwin)
    (progn
      (setq mac-option-key-is-meta nil)
      (setq mac-option-modifier nil)      
      (setq mac-command-key-is-meta t)
      (setq mac-command-modifier 'meta)
      (set-face-attribute 'default (selected-frame) :height 200)
      (set-fontset-font (frame-parameter nil 'font) 'unicode '("STHeiti" . "unicode-bmp"))
      (set-frame-font "Monaco"))
  (progn
    (global-linum-mode 1)
    (setq display-time-24hr-format t)
    (setq display-time-day-and-date t)
    (setq display-time-interval 1)
    (setq display-time-format "%m月%d日%H点%M分%S秒")
    (display-time-mode 1)
    (pc-selection-mode);; use shift + [array] to select    
    (set-fontset-font "fontset-default" 'han '("文泉驿等宽正黑" . "unicode-bmp"))      
    (load (expand-file-name "~/quicklisp/slime-helper.el"))
    ;; Replace "sbcl" with the path to your implementation
    (setq inferior-lisp-program "sbcl")
    (setq slime-net-coding-system 'utf-8-unix)
    ))

(setq skeleton-pair t)
(global-set-key "(" 'skeleton-pair-insert-maybe)
;; (global-set-key "'" 'skeleton-pair-insert-maybe)
;; (global-set-key "[" 'skeleton-pair-insert-maybe)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; coffee-mode && js2-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
;;automatic complie after save file
(add-hook 'coffee-mode-hook '(lambda () (coffee-cos-mode t)))
(add-to-list 'ac-modes 'coffee-mode)

(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; lisp-environment
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'ac-modes 'lisp-mode)
(add-to-list 'ac-modes 'slime-mode)

(setq default-buffer-file-coding-system 'utf-8)

(defalias 'ar 'align-regexp)
(require 'anything)

;; (paredit-mode nil)
(require 'fast-paren-mode)
(add-hook 'emacs-lisp-mode-hook		(lambda () (fast-paren-mode 1)))
(add-hook 'lisp-mode-hook		(lambda () (fast-paren-mode 1)))
(add-hook 'lisp-interaction-mode-hook	(lambda () (fast-paren-mode 1)))
(add-hook 'slime-mode-hook		(lambda () (fast-paren-mode 1)))
(require 'highlight-parentheses)


(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

(require 'color-theme-arjen)
(require 'htmlize)
;; (setq-default tab-width 2)
(define-skeleton src 
  "Input #+begin_src #+end_src in org-mode"
""
"#+begin_src lisp \n"
 _ "\n" 
"#+end_src"
)
(delete-selection-mode 1)

(add-to-list 'load-path "~/.emacs.d/jade-mode")
(require 'sws-mode)
(require 'jade-mode)    
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))
(require 'mon-css-complete)
(load "indent-vline")
;; (add-hook 'jade-mode-hook '(lambda () (indent-hint-mode t)))
;; (add-hook 'coffee-mode-hook '(lambda () (indent-hint-mode t)))
