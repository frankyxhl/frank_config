(defun my-js2-mode-hook ()
  (define-key js2-mode-map "M-j" nil))
(add-hook 'js2-mode-hook 'my-js2-mode-hook)

;; https://github.com/skeeto/skewer-mode
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

(add-hook 'web-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c r") 'web-mode-element-rename)))

;; Hook rainbow-mode
(add-hook 'css-mode-hook (lambda () (rainbow-mode 1)))
(add-hook 'html-mode-hook (lambda () (rainbow-mode 1)))

(add-hook 'sgml-mode-hook
          (lambda ()
            (require 'rename-sgml-tag)
            (define-key sgml-mode-map (kbd "C-c C-r") 'rename-sgml-tag)))

(setq js2-strict-missing-semi-warning nil)

;; npm install -g tern js-beautify eslint jslint
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))


