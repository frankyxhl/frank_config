;; My custom evil keymap

(setq-default evil-escape-delay 0.2)
(setq-default evil-escape-key-sequence "jj")

(define-key evil-motion-state-map "," 'duplicate-line)
(define-key evil-visual-state-map "=" 'er/expand-region)
