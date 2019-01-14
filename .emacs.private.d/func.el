(defun copy-line (&optional arg)
  "Copy current line to next new line"
  (interactive "P")
  (let ((beg (line-beginning-position)) 
        (end (line-end-position arg)))
    (copy-region-as-kill beg end))
  (message "Line has been copied"))


(defun duplicate-line (arg)
  "Duplicate current line, leaving point in lower line."
  (interactive "*p")

  ;; save the point for undo
  (setq buffer-undo-list (cons (point) buffer-undo-list))

  ;; local variables for start and end of line
  (let ((bol (save-excursion (beginning-of-line) (point)))
        eol)
    (save-excursion

      ;; don't use forward-line for this, because you would have
      ;; to check whether you are at the end of the buffer
      (end-of-line)
      (setq eol (point))

      ;; store the line and disable the recording of undo information
      (let ((line (buffer-substring bol eol))
            (buffer-undo-list t)
            (count arg))
        ;; insert the line arg times
        (while (> count 0)
          (newline)         ;; because there is no newline in 'line'
          (insert line)
          (setq count (1- count)))
        )

      ;; create the undo information
      (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list)))
    ) ; end-of-let

  ;; put the point in the lowest line and return
  (next-line arg))


;; Original idea from
;; http://www.opensubscriber.com/message/emacs-devel@gnu.org/10971693.html
(defun comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
If no region is selected and current line is not blank and we are not at the end of the line,
then comment current line.
Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg))
  (next-line))

;; (global-set-key (kbd "M-,") 'copy-line)



(defun toggle-holy-mode ()
  (interactive)
  (if (bound-and-true-p holy-mode)
      (holy-mode -1)
    (holy-mode t)))
(global-set-key (kbd "C-z") 'toggle-holy-mode)
;; (global-set-key (kbd "M-p") 'ace-window)

;; http://ergoemacs.org/emacs/emacs_line_ending_char.html
;; https://stackoverflow.com/questions/23712076/how-to-remove-m-in-emacs#answer-23725763
(defun delete-carriage-returns ()
  "Remove Carriage Return in the file. Know as windows encoding trailing newline"
  (interactive)
  (save-excursion
    (goto-char 0)
    (while (search-forward "\r" nil :noerror)
      (replace-match ""))))

(defalias 'remove-windows-trailing-newlines 'delete-carriage-returns)
