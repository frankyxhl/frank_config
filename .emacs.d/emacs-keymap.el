
;;; emacs-keymap.el --- 

;;; load pymacs --- 

(pymacs-load "gen_etags" "gen-etags-")

;;; define keymap
;;;(global-set-key [f2] 'kill-this-buffer)
;; (global-set-key [f4] 'speedbar)
(global-set-key [f5] 'ibuffer)
(global-set-key [C-f5] 'bookmark-bmenu-list);; list bookmark
(global-set-key [f6] 'shell);; open shell
(global-set-key [C-f6] 'run-python-cmd)
(global-set-key [f7] 'switch-windows-buffer)

(global-set-key "\M-/" 'hippie-expand)
;; (global-set-key [(control \;)] 'comment-or-uncomment-region)
(global-set-key [(control x) (control b)] 'ibuffer)
(global-set-key [(control x) (k)] 'kill-this-buffer);; kill *this* buffer with no question
(global-set-key [(control tab)] 'other-window);; same as C-x o
(global-set-key [(control c) (tab)] 'hippie-expand)
(global-set-key [(control c) (a)] 'auto-complete-mode)
(global-set-key [(control c) (d)] 'debug-python-file)
(global-set-key [(control c) (g)] 'gen-etags-tables)
(global-set-key [(control c) (v)] 'visit-tags-table);; just load
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;below is written by Frank.Xu
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-c o e") 'open-emacs)
(global-set-key (kbd "C-c o k") 'open-keymap)
(global-set-key (kbd "C-c o b") 'open-bashrc)
(global-set-key (kbd "C-c o c") 'open-chicappa)
;; (global-set-key [(control .)] 'end-of-defun)
;; (global-set-key [(meta .)] 'beginning-of-defun)
(global-set-key [(control ,)] 'copy-line)
(global-set-key (kbd "C-+") 'increase-font-size)
(global-set-key (kbd "C--") 'decrease-font-size)
(global-set-key [(control \;)] 'comment-line)
(global-set-key (kbd "C-x ;") 'comment-or-uncomment-region)
(global-set-key [f11] 'fullscreen)

(defvar my-point-track 0
  "this variable save the point position when begin track
and goto the saved point position when end track.")

(define-key global-map "\C-cs" '(lambda ()
                                  (interactive)
                                  (setq my-point-track (point))
                                  (message "saved %d" my-point-track)))

(define-key global-map "\C-cj" '(lambda ()
                                  (interactive)
                                  (goto-char my-point-track)
                                  (message "jump back to %d" my-point-track)))