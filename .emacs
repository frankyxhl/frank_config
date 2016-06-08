(when (eq system-type 'darwin)
  (add-to-list 'load-path "~/.emacs.d/libs")
  (add-to-list 'load-path "~/.emacs.d/prelude"))



(require 'osx-pseudo-daemon)
(server-start)
(load "init")

;; Emacs IRC client

(require 'prelude-helm) ;; Interface for narrowing and search
(require 'prelude-helm-everywhere) ;; Enable Helm everywhere
;; (require 'prelude-company)
;; (require 'prelude-key-chord) ;; Binds useful features to key combinations
;; (require 'prelude-mediawiki)
;; (require 'prelude-evil)

;;; Programming languages support
(require 'prelude-c)
(require 'prelude-clojure)
;; (require 'prelude-coffee)
;; (require 'prelude-common-lisp)
(require 'prelude-css)
(require 'prelude-emacs-lisp)
;; (require 'prelude-erlang)
;; (require 'prelude-elixir)
;; (require 'prelude-go)
;; (require 'prelude-haskell)
(require 'prelude-js)
;; (require 'prelude-latex)
(require 'prelude-lisp)
;; (require 'prelude-ocaml)
(require 'prelude-org) ;; Org-mode helps you keep TODO lists, notes and more
(require 'prelude-perl)
(require 'prelude-python)

(require 'prelude-ruby)
;; (require 'prelude-scala)
(require 'prelude-scheme)
(require 'prelude-shell)
;; (require 'prelude-scss)
(require 'prelude-web) ;; Emacs mode for web templates
(require 'prelude-xml)
;; (require 'prelude-yaml)



(require 'emacs-package-settings)
(require 'emacs-config)
(require 'emacs-setup)
;; (require 'emacs-plugin)
(require 'emacs-lisp)
;; (require 'emacs-clojure)
(require 'emacs-keymap)
