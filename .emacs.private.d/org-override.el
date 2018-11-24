;; To avoid yas confilct in org-mode disable
;; From: https://gist.github.com/takaxp/8604aa8660be93edd3b89df811851c64
(defun my:yas-expand (&optional field)
  "Disable `yas-expand' in src-block."
  (interactive)
  (if (equal major-mode 'org-mode)
      (org-cycle)
    (yas-expand field)))
(define-key yas-minor-mode-map (kbd "<tab>") 'my:yas-expand)

;; To avoid drag-stuff-right confilct in org-mode disable
(defun my:drag-stuff-right (&optional field)
  "Disable `drag-stuff-right' in src-block."
  (interactive)
  (if (equal major-mode 'org-mode)
      (org-metaright)
    (drag-stuff-right)))
(define-key drag-stuff-mode-map (kbd "<M-right>") 'my:drag-stuff-right)

;; To avoid drag-stuff-left confilct in org-mode disable
(defun my:drag-stuff-left (&optional field)
  "Disable `drag-stuff-left' in src-block."
  (interactive)
  (if (equal major-mode 'org-mode)
      (org-metaleft)
    (drag-stuff-left)))
(define-key drag-stuff-mode-map (kbd "<M-left>") 'my:drag-stuff-left)

(require 'org)
(with-eval-after-load 'org
  (evil-define-key 'normal evil-org-mode-map (kbd "M-j") 'ace-jump-mode))
