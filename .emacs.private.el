(require 'package)
(package-initialize)

;; all the packages (in particular autoloads)
(add-to-list 'package-archives
             '("elpy" . "https://jorgenschaefer.github.io/packages/"))

;; the list of packages available
;; (unless package-archive-contents
;;  (package-refresh-contents))

;; (dolist (package package-list)
;;  (unless (package-installed-p package)
;;    (package-install packaginline-string-rectanglee)))

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

;;(custom-set-variables
;;  '(helm-gtags-prefix-key "\C-t")
;; '(helm-gtags-suggested-key-mapping t))

;; (setenv "PYTHONIOENCODING" "UTF-8")
;; install ace-jump-mode
;; https://github.com/winterTTr/ace-jump-mode
;; (require 'ace-jump-mode)
;; (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; Install Python code
;; pip install jedi flake8 importmagic autopep8 rope
;; (elpy-enable)
;; (run-python)
;; (run-python) to start intractive python


;; (require 'inline-string-rectangle)
;; (global-set-key (kbd "C-x r t") 'inline-string-rectangle)

(add-to-list 'load-path "~/.emacs.private.d")
(load "lisp")
(load "common")
(load "web")
