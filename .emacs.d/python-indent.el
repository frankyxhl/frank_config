(defun python-indent-file (start end &optional column)
  "indent = in python file,written by Frank Xu"
  (interactive  "r\nP")
  (save-excursion
    (goto-char end)
    (setq end (point-marker))
    (goto-char start)
    (while (< (point) end)
      (line-beginning-position)
      (print "text")
      (forward-line 1))
    ))

(defun  fi_print()
  (interactive)
  (print "te"))





