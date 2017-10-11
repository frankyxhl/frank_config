;; load functions
(load "func")

(global-set-key [f5] 'ibuffer)
(global-set-key [f8] 'other-window)

;; (setq auto-save-default nil)
;; store all backup and;; fast-paren-mode
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


;; Using helm find-file
(global-set-key (kbd "C-x p") 'helm-projectile-find-file)
;; install web-mode
(global-linum-mode)


(global-set-key (kbd "C-=") 'er/expand-region)
;; ctags
;; brew install global --with-ctags --with-pygments
;; https://github.com/syohex/emacs-helm-gtags/
(global-set-key (kbd "C-x t") 'helm-gtags-find-tag)
(global-set-key (kbd "C-t") 'helm-projectile-ag)
(global-set-key (kbd "C-x C-t") 'helm-gtags-find-pattern)

;; (aggressive-indent-global-mode)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


(setq make-backup-files nil)
(require 'bind-key)
(bind-key* "C-;" 'comment-dwim-line)
(bind-key* "C-," 'duplicate-line)
(bind-key* "C-M-," 'copy-line)
(bind-key* (kbd "C-S-c") 'mc/edit-lines)

(bind-key* "M-j" 'ace-





jump-mode)
(bind-key* (kbd "M-g g") 'avy-goto-line)

;; Yasnippets
;; (define-key yas-minor-mode-map (kbd "TAB") 'yas-expand)
;; (define-key yas-minor-mode-map (kbd "<tab>") 'yas-expand)

;; god-mode
(require 'god-mode)
(setq god-exempt-major-modes nil)
(setq god-exempt-predicates nil)
;; (global-set-key (kbd "C-i") 'god-mode-all)
;; (bind-key* "C-i" 'god-mode-all)


;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
(setq magit-repository-directories `("~/Projects/"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; swiper                                                                 ;;
;; http://pragmaticemacs.com/emacs/dont-search-swipe/                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-s") 'swiper)
(setq ivy-display-style 'fancy)

(defun bjm-swiper-recenter (&rest args)
  "recenter display after swiper"
  (recenter)
  )
(advice-add 'swiper :after #'bjm-swiper-recenter)


(set-face-background hl-line-face "gray13")

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(setq-default pathname-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq locale-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)


(require 'mark-more-like-this)
(global-set-key (kbd "C-<") 'mark-previous-like-this)
(global-set-key (kbd "C->") 'mark-next-like-this)
(global-set-key (kbd "C-*") 'mark-all-like-this)

(setq python-indent-offset 4)
(setq dumb-jump-mode t)

(setq ispell-extra-args '("--lang=en_US"))
