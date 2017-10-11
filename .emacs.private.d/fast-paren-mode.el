;; Fast paren mode 1.0
;; Copyright(C) 2012, CrLF0710
;; Please use this code under BSD license

(defun fast-paren-space ()
  (interactive)
  (if (member (preceding-char) '(0 9 10 32 40))
      (if (and (symbol-value 'paredit-mode)
	       (symbol-function 'paredit-open-round))
	  (funcall 'paredit-open-round)
	  (insert-char ?\( 1))
      (insert-char ?\  1)))

(defun fast-paren-space-normal ()
  (interactive)
  (insert-char ?\  1))

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
