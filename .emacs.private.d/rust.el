(with-eval-after-load 'lsp-mode
  (setq lsp-rust-rls-command '("rustup" "run" "1.27.0" "rls"))
  (require 'lsp-rust))

(add-hook 'rust-mode-hook #'lsp-rust-enable)
;; (add-hook 'rust-mode-hook #'flycheck-mode)
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

(add-hook 'racer-mode-hook #'company-mode)

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)
