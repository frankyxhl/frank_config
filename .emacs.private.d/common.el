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


(defun copy-line (&optional arg)
  "Copy current line to next new line"
  (interactive "P")
  (let ((beg (line-beginning-position)) 
        (end (line-end-position arg)))
    (copy-region-as-kill beg end))
  (message "Line has been copied"))

(defun duplicate-line (arg)
  "Duplicate current line, leaving point in lower line."
  (interactive "*p")

  ;; save the point for undo
  (setq buffer-undo-list (cons (point) buffer-undo-list))

  ;; local variables for start and end of line
  (let ((bol (save-excursion (beginning-of-line) (point)))
        eol)
    (save-excursion

      ;; don't use forward-line for this, because you would have
      ;; to check whether you are at the end of the buffer
      (end-of-line)
      (setq eol (point))

      ;; store the line and disable the recording of undo information
      (let ((line (buffer-substring bol eol))
            (buffer-undo-list t)
            (count arg))
        ;; insert the line arg times
        (while (> count 0)
          (newline)         ;; because there is no newline in 'line'
          (insert line)
          (setq count (1- count)))
        )

      ;; create the undo information
      (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list)))
    ) ; end-of-let

  ;; put the point in the lowest line and return
  (next-line arg))

;; Original idea from
;; http://www.opensubscriber.com/message/emacs-devel@gnu.org/10971693.html
(defun comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
If no region is selected and current line is not blank and we are not at the end of the line,
then comment current line.
Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg))
  (next-line))

(global-set-key (kbd "M-,") 'copy-line)



(defun toggle-holy-mode ()
  (interactive)
  (if (bound-and-true-p holy-mode)
      (holy-mode -1)
    (holy-mode t)))
(global-set-key (kbd "C-z") 'toggle-holy-mode)
(global-set-key (kbd "M-p") 'ace-window)

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

(bind-key* "M-j" 'ace-jump-mode)
(bind-key* (kbd "M-g g") 'avy-goto-line)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; yasnippets
;; (define-key yas-minor-mode-map (kbd "TAB") 'yas-expand)
;; (define-key yas-minor-mode-map (kbd "<tab>") 'yas-expand)


;; god-mode
(require 'god-mode)
(setq god-exempt-major-modes nil)
(setq god-exempt-predicates nil)
;; (global-set-key (kbd "C-i") 'god-mode-all)
;; (bind-key* "C-i" 'god-mode-all)
;; Turn off Javascript semi warning


;; Magit
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

(smartparens-global-mode 1)
(global-paren-face-mode 1)


(require 'mark-more-like-this)
(global-set-key (kbd "C-<") 'mark-previous-like-this)
(global-set-key (kbd "C->") 'mark-next-like-this)
(global-set-key (kbd "C-M-m") 'mark-more-like-this) ; like the other two, but takes an argument (negative is previous)
(global-set-key (kbd "C-*") 'mark-all-like-this)

(setq python-indent-offset 4)
(setq dumb-jump-mode t)

(setq ispell-extra-args '("--lang=en_US"))
