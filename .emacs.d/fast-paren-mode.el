;; Fast paren mode 1.01
;; Copyright(C) 2012, CrLF0710
;; Please use this code under BSD license

(defun fast-paren-space ()
  (interactive)
  (if (member (preceding-char) '(0 9 10 32 40))
      (if (and (symbol-value 'paredit-mode)
	       (symbol-function 'paredit-open-round))
	  (funcall 'paredit-open-round)
	  (insert-char ?\( 1))
      (insert-char ?\  1))
  (if (symbol-value 'slime-mode)
      (when (slime-background-activities-enabled-p)
            (slime-echo-arglist))))

(defun fast-paren-space-normal ()
  (interactive)
  (insert-char ?\  1)
  (if (symbol-value 'slime-mode)
      (when (slime-background-activities-enabled-p)
            (slime-echo-arglist))))

(put 'fast-paren-space 'delete-selection t) ; for delete-section-mode & CUA
(put 'fast-paren-space-normal 'delete-selection t) ; for delete-section-mode & CUA

;; Space key might be bound to 'slime-space by Slime-mode.
;; Thanks to Bruce Li for pointing out this.

(defadvice slime-space (around slime-space-and-fast-paren-around ())
  (if (symbol-value 'fast-paren-mode)
      (fast-paren-space)
      ad-do-it))

(ad-activate 'slime-space)


(define-minor-mode fast-paren-mode
  "Toggle fast-paren-mode.
With no argument, this command toggles the mode. 
Non-null prefix argument turns on the mode.
Null prefix argument turns off the mode.

When fast-paren-mode is enabled, Multiple spaces will be
interpreted into a space and multiple left brackets"
  nil
  " Fast-Paren"
  '((" " . fast-paren-space)
    ("\M- " . fast-paren-space-normal)))

(defun turn-on-fast-paren-mode ()
  "Turn on fast-paren-mode (see command `fast-paren-mode')."
  (interactive)
  (fast-paren-mode 1))

(provide 'fast-paren-mode)
