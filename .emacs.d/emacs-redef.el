;; function
(defun switch-windows-buffer ()
  (interactive)
  (let ((this-buffer (window-buffer)))
    (switch-to-buffer (window-buffer (next-window (selected-window))))
    (switch-to-buffer-other-window this-buffer)
    (other-window 1)))

;; load hippie-expand
(setq hippie-expand-try-functions-list
      '( ;;senator-complete-symbol
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

;; for desktop
(defun remove-desktop-lock (path)
  (if (not (null path))
    (let ((root_desktop_filepath (car path)))
      (if (file-exists-p root_desktop_filepath)
	  (delete-file root_desktop_filepath)
	)
      (remove-desktop-lock (cdr path))
      )
    )
)

;; setup python mode
;; from here: https://groups.google.com/group/comp.lang.python/msg/956f1c2d37f93995?hl=en&pli=1
;; (setq auto-mode-alist ; trigger python mode automatically 
      ;; (cons '("\\.py$" . python-mode) auto-mode-alist)) 
;; (setq interpreter-mode-alist 
      ;; (cons '("python" . python-mode) 
            ;; interpreter-mode-alist)) 
;; (autoload 'python-mode "python-mode" "Python editing mode." t) 
; add my customization 
;; (add-hook 'python-mode-hook 'my-python-hook) 
; this gets called by outline to deteremine the level. Just use the length of the whitespace 
;; (defun py-outline-level () 
  ;; (let (buffer-invisibility-spec) 
    ;; (save-excursion 
      ;; (skip-chars-forward "\t ") 
      ;; (current-column)))) 
; this get called after python mode is enabled 
;; (defun my-python-hook () 
  ; outline uses this regexp to find headers. I match lines with no indent and indented "class" 
  ; and "def" lines. 
  ;; (setq outline-regexp "[^ \t]\\|[ \t]*\\(def\\|class\\) ") 
  ; enable our level computation 
  ;; (setq outline-level 'py-outline-level) 
  ; do not use their \C-c@ prefix, too hard to type. Note this overides some python mode bindings 
  ;; (setq outline-minor-mode-prefix "\C-m") 
  ; turn on outline mode 
  ;; (outline-minor-mode t) 
  ; initially hide all but the headers 
  ;; (hide-body) 
  ; make paren matches visible 
  ;; (show-paren-mode 1) 
;; ) 

;; for python
;; (defun run-python-cmd ()
  ;; (interactive)
  ;; (comint-run "/usr/bin/python"))

;; for python
(defun debug-python-file ()
  (interactive)
  (pdb (concat "pdb " (buffer-file-name))))

(defun copy-line (&optional arg)
  "Copy current line to next new line"
  (interactive "P")
  (let ((beg (line-beginning-position)) 
	(end (line-end-position arg)))
    (copy-region-as-kill beg end))
  (message "Line has been copied"))

(defun comment-line (&optional arg)
  "comment-line line"
  (interactive "P")
  (let ((beg (line-beginning-position)) 
	(end (line-end-position arg)))
    (comment-or-uncomment-region beg end)))

(defun open-bashrc()
  "Open-bashrc File"
  (interactive)
  (find-file "~/.bashrc"))

(defun open-emacs()
  "Open-emacs configure file"
  (interactive)
  (find-file "~/.emacs"))

(defun open-keymap()
  "Open-keymap configure file"
  (interactive)
  (find-file "~/.emacs.d/emacs-keymap.el"))


(defun increase-font-size ()
  (interactive)
  (set-face-attribute 'default
		      nil
		      :height
		      (ceiling (* 1.10
				  (face-attribute 'default :height)))))

(defun decrease-font-size ()
  (interactive) 
  (set-face-attribute 'default
		      nil                    
		      :height
		      (floor (* 0.9
				(face-attribute 'default :height)))))

(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
		       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))


(defun copy-sentence (&optional arg)
  "Copy current sentence"
  (interactive "P")
  (let ((current-position (point))
	(beg (progn (backward-sentence) (point))) 
	(end (progn (forward-sentence) (point)))) 
    (copy-region-as-kill beg end)
    (goto-char current-position)    
    (message "Sentence has been copied")))