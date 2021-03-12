;; fast-paren-mode
(load "fast-paren-mode")
(require 'fast-paren-mode)

(smartparens-global-mode 1)
(global-paren-face-mode 1)

;; clojure-mode
(add-hook 'clojure-mode-hook #'inf-clojure-minor-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(setq clojure-toplevel-inside-comment-form t)
;; (add-hook 'clojure-mode-hook 'parinfer-mode)

;; Use figwheel
;; https://github.com/Day8/re-frame-template
;; (setq cider-cljs-lein-repl
;;       "(do (require 'figwheel-sidecar.repl-api)
;;          (figwheel-sidecar.repl-api/start-figwheel!)
;;          (figwheel-sidecar.repl-api/cljs-repl))")

;; lisp-mode
(add-hook 'lisp-mode-hook  'turn-on-fast-paren-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-fast-paren-mode)

;; hy-mode
(add-to-list 'auto-mode-alist '("\\.hy\\'" . hy-mode))
(add-to-list 'interpreter-mode-alist '("hy" . hy-mode))
(add-hook 'hy-mode-hook 'turn-on-fast-paren-mode)
(add-hook 'hy-mode-hook 'paredit-mode)
;; (add-hook 'hy-mode-hook 'parinfer-mode)

;; emacs-lisp-mode
(add-hook 'emacs-lisp-mode-hook 'turn-on-fast-paren-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
;; (add-hook 'emacs-lisp-mode-hook 'parinfer-mode)

