;; fast-paren-mode
(load-file "~/.emacs.private.d/fast-paren-mode.el")
(require 'fast-paren-mode)

(add-hook 'lisp-mode-hook  'turn-on-fast-paren-mode)
(add-hook 'emacs-lisp-mode-hook 'turn-on-fast-paren-mode)
(add-hook 'ielm-mode-hook  'turn-on-fast-paren-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-fast-paren-mode)
(add-hook 'slime-repl-mode-hook       'turn-on-fast-paren-mode)
(add-hook 'hy-mode-hook  'turn-on-fast-paren-mode)
