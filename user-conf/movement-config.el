
(defun move-line-down ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines 1))
    (forward-line)
    (move-to-column col)))

(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))
    
	(forward-line)
	(transpose-lines -1)
	(previous-line)
	
    (move-to-column col)
	(previous-line)
	))


(global-set-key (kbd "<A-down>") 'move-line-down)
(global-set-key (kbd "<A-up>") 'move-line-up)
