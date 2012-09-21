;; load python
(require 'python)
(setq python-indent 4)
(setq python-use-skeletons t)

;; load pymacs
(require 'pymacs)
(setq pymacs-load-path ["~/.emacs.d/"])

;; load ibuffer
(require 'ibuffer)

;; load template
(require 'template)
;;here set the templates directory
(setq template-subdirectories '("./" "Templates/" "~/.emacs.d/templates/"))
(template-initialize)
(setq template-auto-insert t)

;; load desktop
;; all file need to be test and remove
(remove-desktop-lock '("~/.emacs.desktop.lock"))
(load "desktop") 
;; (desktop-read)
(desktop-save-mode)

;; load wikipedia-mode
;;(require 'wikipedia-mode)

; ===========================================================================
;yasnippet
; ===========================================================================
(add-to-list 'load-path "~/.emacs.d/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
;; (yas/initialize)
;;(yas/load-directory "~/.emacs.d/yasnippet/snippets")
;; load auto complete
(add-to-list 'load-path "~/.emacs.d/auto-complete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

(setq-default ac-sources '(
;; ac-source-yasnippet
ac-source-filename
ac-source-words-in-all-buffer
ac-source-functions
ac-source-variables
ac-source-symbols
ac-source-features
ac-source-abbrev
ac-source-words-in-same-mode-buffers
ac-source-dictionary))
;;(require 'auto-complete-cpp)
;; (require 'auto-complete-emacs-lisp)
;(require 'auto-complete-python)
(require 'auto-complete-yasnippet)
(require 'auto-complete)
(add-to-list 'ac-sources 'ac-source-yasnippet)
(global-auto-complete-mode t)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
