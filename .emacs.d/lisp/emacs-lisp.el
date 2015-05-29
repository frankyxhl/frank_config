(require 'parenface)

(eval-after-load 'parenface
  (progn
    (set-face-foreground 'parenface-paren-face "gray30")
    (set-face-foreground 'parenface-bracket-face "gray30")
    (set-face-foreground 'parenface-curly-face "gray30")))
(setq show-paren-delay 0)

(setq skeleton-pair t)
(global-set-key "(" 'skeleton-pair-insert-maybe)
(global-set-key "\"" 'skeleton-pair-insert-maybe)
(global-set-key "'" 'skeleton-pair-insert-maybe)
(global-set-key "[" 'skeleton-pair-insert-maybe)
(global-set-key "{" 'skeleton-pair-insert-maybe)

(require 'paredit)
(add-hook 'emacs-lisp-mode-hook		(lambda () (paredit-mode 1)))
(add-hook 'lisp-mode-hook		(lambda () (paredit-mode 1)))
(add-hook 'lisp-interaction-mode-hook	(lambda () (paredit-mode 1)))
(add-hook 'python-mode-hook		(lambda () (paredit-mode 1)))
(add-hook 'scheme-mode-hook		(lambda () (paredit-mode 1)))
(add-hook 'clojure-mode-hook		(lambda () (paredit-mode 1)))

(require 'highlight-parentheses)
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
