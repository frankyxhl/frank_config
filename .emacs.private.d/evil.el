;; My custom evil keymap
(load "func")

(setq-default evil-escape-delay 0.2)
(setq-default evil-escape-key-sequence "jk")

(define-key evil-motion-state-map "," 'duplicate-line)
(define-key evil-visual-state-map "=" 'er/expand-region)

(define-key evil-normal-state-map "\C-t" 'helm-projectile-ag)
(define-key evil-normal-state-map "z" 'Control-X-prefix)
(define-key evil-normal-state-map ":" 'comment-dwim-line)

(define-key evil-normal-state-map "/" 'swiper)

(with-eval-after-load 'clojurescript
  (progn
    (evil-define-key 'normal clojurescript-mode-map (kbd "M-.") 'cider-find-var)
    (evil-define-key 'normal clojurescript-mode-map (kbd "M-,") 'cider-pop-back)))

(with-eval-after-load 'python
  (progn
    (evil-define-key 'normal python-mode-map (kbd "M-.") 'xref-find-definitions)
    (evil-define-key 'normal python-mode-map (kbd "M-,") 'xref-pop-marker-stack)))

(require 'org)
(with-eval-after-load 'org
  (evil-define-key 'normal evil-org-mode-map (kbd "M-j") 'ace-jump-mode))
