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
;; Global binding keys
(require 'bind-key)
(bind-key* "C-;" 'comment-dwim-line)
(bind-key* "C-," 'duplicate-line)
(bind-key* "C-M-," 'copy-line)
(bind-key* (kbd "C-S-c") 'mc/edit-lines)
(bind-key* (kbd "M-g g") 'avy-goto-line)
(bind-key* "M-j" 'ace-jump-mode)

;; Yasnippets
(defun disable-yas-if-no-snippets ()
  (when (and yas-minor-mode (null (yas--get-snippet-tables)))
    (yas-minor-mode -1)))
(add-hook 'yas-minor-mode-hook #'disable-yas-if-no-snippets)
(define-key yas-minor-mode-map (kbd "TAB") 'yas-expand)
(define-key yas-minor-mode-map (kbd "<tab>") 'yas-expand)

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

;; utf-8 settings
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

(setq ispell-extra-args '("--lang=en_US"))

;; Python
(setq python-indent-offset 4)
;; https://github.com/jacktasia/dumb-jump
(setq dumb-jump-mode t)


;; drag-stuff
;; https://github.com/rejeep/drag-stuff.el
(drag-stuff-global-mode t)
(drag-stuff-define-keys)

;; To avoid yas confilct in org-mode disable
;; From: https://gist.github.com/takaxp/8604aa8660be93edd3b89df811851c64
(defun my:yas-expand (&optional field)
  "Disable `yas-expand' in src-block."
  (interactive)
  (if (equal major-mode 'org-mode)
      (org-cycle)
    (yas-expand field)))
(define-key yas-minor-mode-map (kbd "<tab>") 'my:yas-expand)


;; To avoid drag-stuff-right confilct in org-mode disable
(defun my:drag-stuff-right (&optional field)
  "Disable `drag-stuff-right' in src-block."
  (interactive)
  (if (equal major-mode 'org-mode)
      (org-metaright)
    (drag-stuff-right)))
(define-key drag-stuff-mode-map (kbd "<M-right>") 'my:drag-stuff-right)

;; To avoid drag-stuff-left confilct in org-mode disable
(defun my:drag-stuff-left (&optional field)
  "Disable `drag-stuff-left' in src-block."
  (interactive)
  (if (equal major-mode 'org-mode)
      (org-metaleft)
    (drag-stuff-left)))
(define-key drag-stuff-mode-map (kbd "<M-left>") 'my:drag-stuff-left)



;; Theme and font setting
;; C-x C-+ and C-x C-- to increase or decrease the buffer text size
;; (set-default-font "Monaco 20")
;; Spacemacs theme: https://themegallery.robdor.com/
(defun change-to-ppt-mode ()
  (interactive)
  (set-default-font "Source Code Pro 18")
  )


(defun change-back-from-ppt-mode ()
  (interactive)
  (set-default-font "Source Code Pro 13"))


(defun insert-current-timestamp ()
  (interactive)
  (insert (format-time-string "%Y-%m-%dT%H:%M:%S")))
