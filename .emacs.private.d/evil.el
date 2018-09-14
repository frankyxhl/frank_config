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
