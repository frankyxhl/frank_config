(require 'package)
(package-initialize)

;; all the packages (in particular autoloads)
(add-to-list 'package-archives
             '("elpy" . "https://jorgenschaefer.github.io/packages/"))

;; the list of packages available 
;; (unless package-archive-contents
;;  (package-refresh-contents))

                                        ; install the missing packages
;; (dolist (package package-list)
;;  (unless (package-installed-p package)
;;    (package-install packaginline-string-rectanglee)))

(global-set-key [f5] 'ibuffer)
(global-set-key [f8] 'other-window)


;; (setq auto-save-default nil)
;; store all backup and;; fast-paren-mode
 
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
;; Install Javascript Code
;; npm install -g tern
;; enable turn-mode

;; install mode
;; color-identifiers-mode
;; rainbo-identifiers-mode

;; find-file-in-project
;; https://github.com/grizzl/fiplr

;; find file in current projects
;; (global-set-key (kbd "C-x p") 'fiplr-find-file)


;;(setq fiplr-ignored-globs '((directories (".git" ".sin"))
;;                            (files ("*.jpg" "*.png" "*.zip" "*~" "*.pyc"))))

;; Using helm find-file
(global-set-key (kbd "C-x p") 'helm-projectile-find-file)
;; install web-mode
(global-linum-mode)

(defun my-js2-mode-hook ()
  (define-key js2-mode-map "M-j" nil))
(add-hook 'js2-mode-hook 'my-js2-mode-hook)

;; https://github.com/skeeto/skewer-mode
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

(global-set-key (kbd "C-=") 'er/expand-region)
;; ctags
;; brew install global --with-ctags --with-pygments
;; https://github.com/syohex/emacs-helm-gtags/
(global-set-key (kbd "C-x t") 'helm-gtags-find-tag)
(global-set-key (kbd "C-t") 'helm-projectile-ag)
(global-set-key (kbd "C-x C-t") 'helm-gtags-find-pattern)

;;(custom-set-variables
;;  '(helm-gtags-prefix-key "\C-t")
;; '(helm-gtags-suggested-key-mapping t))

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


(require 'mark-more-like-this)
(global-set-key (kbd "C-<") 'mark-previous-like-this)
(global-set-key (kbd "C->") 'mark-next-like-this)
(global-set-key (kbd "C-M-m") 'mark-more-like-this) ; like the other two, but takes an argument (negative is previous)
(global-set-key (kbd "C-*") 'mark-all-like-this)

(add-hook 'sgml-mode-hook
          (lambda ()
            (require 'rename-sgml-tag)
            (define-key sgml-mode-map (kbd "C-c C-r") 'rename-sgml-tag)))

;; Hook rainbow-mode
(add-hook 'css-mode-hook (lambda () (rainbow-mode 1)))
(add-hook 'html-mode-hook (lambda () (rainbow-mode 1)))

(smartparens-global-mode 1)
(global-paren-face-mode 1)



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


(set-face-background hl-line-face "gray13")

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(setq-default pathname-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq locale-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; (setenv "PYTHONIOENCODING" "UTF-8")
(add-hook 'hy-mode-hook 'paredit-mode)
(add-hook 'hy-mode-hook 'parinfer-mode)

;; install ace-jump-mode
;; https://github.com/winterTTr/ace-jump-mode
;; (require 'ace-jump-mode)
;; (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

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

(setq js2-strict-missing-semi-warning nil)

;; Magit
(setq magit-repository-directories `("~/Projects/"))

;; npm install -g tern js-beautify eslint jslint
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))

(setq python-indent-offset 4)

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

(setq dumb-jump-mode t)


;; Install Python code
;; pip install jedi flake8 importmagic autopep8 rope
;; (elpy-enable)
;; (run-python)
;; (run-python) to start intractive python


;; (require 'inline-string-rectangle)
;; (global-set-key (kbd "C-x r t") 'inline-string-rectangle)

(add-to-list 'load-path "~/.emacs.private.d")
(load-file "~/.emacs.private.d/lisp.el")
