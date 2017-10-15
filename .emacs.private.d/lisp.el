;; fast-paren-mode
(load "fast-paren-mode")
(require 'fast-paren-mode)

(smartparens-global-mode 1)
(global-paren-face-mode 1)


;; lisp mode
(add-hook 'lisp-mode-hook  'turn-on-fast-paren-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-fast-paren-mode)

;; Hy mode
(add-to-list 'auto-mode-alist '("\\.hy\\'" . hy-mode))
(add-to-list 'interpreter-mode-alist '("hy" . hy-mode))

(add-hook 'hy-mode-hook 'turn-on-fast-paren-mode)
(add-hook 'hy-mode-hook 'paredit-mode)
(add-hook 'hy-mode-hook 'parinfer-mode)

;; Emacs Lisp mode
(add-hook 'emacs-lisp-mode-hook 'turn-on-fast-paren-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'parinfer-mode)
