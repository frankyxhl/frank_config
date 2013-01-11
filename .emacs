; ===========================================================================
; My Emacs Config
; Frank.Xu (franky.xhl[at]gmail.com)
; ===========================================================================

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
; ===========================================================================
;; lily pond mode load
; ===========================================================================
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
;; (add-to-list 'load-path "~/.emacs.d/company")
;; (autoload 'company-mode "company" nil t)
;;(menu-bar-mode nil)
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
; ===========================================================================
;; 透明背景transparent background
; ===========================================================================
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

;; (define-key key-translation-map [?\(] [?\[])
;; (define-key key-translation-map [?\[] [?\(])
;; (define-key key-translation-map [?\)] [?\]])
;; (define-key key-translation-map [?\]] [?\)])


(require 'paredit)
;; (add-hook 'emacs-lisp-mode-hook		(lambda () (paredit-mode 1)))
;; (add-hook 'lisp-mode-hook		(lambda () (paredit-mode 1)))
;; (add-hook 'lisp-interaction-mode-hook	(lambda () (paredit-mode 1)))
;; (add-hook 'python-mode-hook		(lambda () (paredit-mode 1)))
;; (add-hook 'scheme-mode-hook		(lambda () (paredit-mode 1)))

(require 'parenface)
(set-face-foreground 'paren-face "gray30")

(setq show-paren-delay 0)

(global-linum-mode 1)
(if (eq system-type 'darwin)
  (progn
    (global-set-key [C-f7] 'ns-toggle-fullscreen)
    ;; (setq mac-option-key-is-meta nil)
    ;; (setq mac-option-modifier nil)
		;; mac key set
    ;; (setq mac-option-key-is-command t)
    ;; (setq mac-option-modifier 'super)
    ;; (setq mac-command-key-is-meta t)
    ;; (setq mac-command-modifier 'meta)
		;; end key set here
    ;; (set-fontset-font (frame-parameter nil 'font) 'unicode '("黑体-简" . "unicode-bmp"))
    (set-frame-font "Monaco 16")
		(set-fontset-font
		 (frame-parameter nil 'font)
		 'han
		 (font-spec :family "Hiragino Sans GB" ))
    ;; (add-to-list 'default-frame-alist '(font . "Inconsolata-15")) ;设置新frame的字体大小
    ;; (set-frame-font "Inconsolata-15") ;设置英文字体
    ;; (set-language-environment "UTF-8")
    ;; (ns-toggle-fullscreen)
    )
  (progn
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

(defun toggle-mac-key-set ()
	"toggle mac key"
    (setq mac-option-key-is-meta t)
    (setq mac-option-key-is-command nil)
    (setq mac-option-modifier 'meta)
    ;; (setq mac-option-modifier nil)      
    (setq mac-command-key-is-meta nil)
    (setq mac-command-modifier 'super)
	)

(setq skeleton-pair t)
(global-set-key "(" 'skeleton-pair-insert-maybe)
(global-set-key "\"" 'skeleton-pair-insert-maybe)
(global-set-key "'" 'skeleton-pair-insert-maybe)
(global-set-key "[" 'skeleton-pair-insert-maybe)
(global-set-key "{" 'skeleton-pair-insert-maybe)

; ===========================================================================
; coffee-mode && js2-mode
; ===========================================================================
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
;;automatic complie after save file
(add-hook 'coffee-mode-hook '(lambda () (coffee-cos-mode t)))
(add-to-list 'ac-modes 'coffee-mode)

(defun coffee-custom ()
  "coffee-mode-hook"
  (set (make-local-variable 'tab-width) 2))

(setq coffee-args-compile '("-bc" "--bare"))

(add-hook 'coffee-mode-hook
	  '(lambda() (coffee-custom)))

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; lisp-environment
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
(setq-default tab-width 2)
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

(require 'undo-tree)
(global-undo-tree-mode)
; ===========================================================================
;;evil-mode
; ===========================================================================
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
;; (evil-mode 1)
;; (setq evil-emacs-state-modes nil)
;; (setq evil-default-state 'emacs)
(defun escape-if-next-char (c)
	"Watches the next letter.  If c, then switch to Evil's normal mode; otherwise insert a k and forward unpressed key to unread-command events"
	(self-insert-command 1)
	(let ((next-key (read-event)))
		(if (= c next-key)
				(progn
					(delete-backward-char 1)
					(do-evil-esc))
			(setq unread-command-events (list next-key)))))

(defun escape-if-next-char-is-j (arg)
	(interactive "p")
	(if (= arg 1)
			(escape-if-next-char ?j)
		(self-insert-command arg)))

 ;; (evil-define-command do-evil-esc (arg)
(evil-define-command do-evil-esc ()
  "Wait for further keys within `evil-esc-delay'.
Otherwise send [escape]."
  ;; :repeat ignore
  (interactive "P")
  (if (sit-for evil-esc-delay t)
      (progn
        (push 'escape unread-command-events)
        (when defining-kbd-macro
          ;; we need to replace the ESC by 'escape in the currently
          ;; defined keyboard macro
          (evil-save-echo-area
            (end-kbd-macro)
            (setq last-kbd-macro (vconcat last-kbd-macro [escape]))
            (start-kbd-macro t t))))
    (push last-command-event unread-command-events))
    ;; preserve prefix argument
    ;; (setq prefix-arg arg))
  ;; disable interception for the next key sequence
  (evil-esc-mode -1)
  (setq this-command last-command)
  (add-hook 'pre-command-hook #'evil-turn-on-esc-mode nil t))
(define-key evil-insert-state-map (kbd "j") 'escape-if-next-char-is-j)
; ===========================================================================
;;Scss-mode
; ===========================================================================
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(add-to-list 'ac-modes 'scss-mode)

; ===========================================================================
;;sr-speedbar-mode
; ===========================================================================
(require 'sr-speedbar)
(custom-set-variables
 '(speedbar-show-unknown-files t)
)
(custom-set-variables '(sr-speedbar-right-side nil) '(sr-speedbar-skip-other-window-p t) '(sr-speedbar-max-width 10) '(sr-speedbar-width-x 20))
(global-set-key (kbd "s-s") 'sr-speedbar-toggle)
(global-set-key (kbd "s-r") 'sr-speedbar-refresh-toggle)
;; (sr-speedbar-open)

; ===========================================================================
;;text-speedbar-mode
; ===========================================================================
(require 'textmate)
(textmate-mode)
; ===========================================================================
;;markdown-mode
; ===========================================================================
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'ac-modes 'markdown-mode)

; ===========================================================================
;;ido-mode
; ===========================================================================
(ido-mode 1)
 ;; Display ido results vertically, rather than horizontally
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-trucation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-trucation)
;; (define-key ido-mode-map (kbd "C-n") 'ido-next-match)
(eval-after-load "ido"
    '(progn (define-key ido-common-completion-map "\C-n" 'ido-next-match)
						(define-key ido-common-completion-map "\C-p" 'ido-prev-match))
; ===========================================================================
; slim-mode
; ===========================================================================
(require 'slim-mode)


; ===========================================================================
; zencoding-mode
; ===========================================================================
(require 'zencoding-mode)
(add-hook 'html-mode-hook 'zencoding-mode)

; ===========================================================================
; mark-multiple
; ===========================================================================
(add-to-list 'load-path "~/.emacs.d/mark-multiple")
(require 'inline-string-rectangle)
(global-set-key (kbd "C-x r t") 'inline-string-rectangle)
(require 'mark-more-like-this)
(global-set-key (kbd "C-<") 'mark-previous-like-this)
(global-set-key (kbd "C->") 'mark-next-like-this)
(global-set-key (kbd "C-M-m") 'mark-more-like-this) ; like the other two, but takes an argument (negative is previous)
(global-set-key (kbd "C-*") 'mark-all-like-this)

(add-hook 'sgml-mode-hook
          (lambda ()
            (require 'rename-sgml-tag)
            (define-key sgml-mode-map (kbd "C-c C-r") 'rename-sgml-tag)))

;; SLIME setup:
(add-to-list 'load-path "~/.emacs.d/slime")
(add-to-list 'load-path "~/.emacs.d/slime/contrib")
(setq slime-backend "~/.emacs.d/slime/swank-loader.lisp")
(load "slime-autoloads")
(set-language-environment "UTF-8")
(require 'slime)
(require 'slime-autoloads)
(eval-after-load "slime"
`(progn
(slime-setup '(slime-repl))
(custom-set-variables
'(inhibit-splash-screen t)
'(slime-complete-symbol*-fancy t)
'(slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
'(slime-net-coding-system 'utf-8-unix)
'(slime-startup-animation nil)
'(slime-lisp-implementations '((sbcl ("/usr/local/bin/sbcl") :coding-system utf-8-unix)))))) 
;; Stop SLIME’s REPL from grabbing DEL,
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")
(define-key global-map (kbd "C-c s") 'slime-selector)
;; (define-key slime-repl-mode-map (kbd "<f12>") 'slime-selector)
;; (define-key slime-mode-map (kbd "<f12>") 'slime-selector)
;; which is annoying when backspacing over a '('
(defun override-slime-repl-bindings-with-paredit ()
(define-key slime-repl-mode-map
(read-kbd-macro paredit-backward-delete-key) nil))
(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)
;; User’s stuff:
;; (zenburn)
;; (slime)
; ===========================================================================
;;less-css-mode
; ===========================================================================
(require 'less-css-mode)
(autoload 'less-css-mode "less-css-mode.el" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.less\\'" . less-css-mode))
(add-to-list 'ac-modes 'less-css-mode)
; ===========================================================================
;;helm-mode
; ===========================================================================
;; (add-to-list 'load-path "~/.emacs.d/helm/")
;; (require 'helm-config)
;; (helm-mode 1)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)

(global-set-key (kbd "C-o") 'next-buffer)
(global-set-key (kbd "M-o") 'previous-buffer)
