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

;; load auto complete
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-cpp)
(require 'auto-complete-emacs-lisp)
(require 'auto-complete-python)
(require 'auto-complete)
(global-auto-complete-mode t)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

;; load wikipedia-mode
;;(require 'wikipedia-mode)
