;; I want to let everybody know where this file path is
;; from http://stackoverflow.com/questions/2416655/file-path-to-clipboard-in-emacs
(defun mvm/file-name-clipboard ()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
      (message filename))))


;; Adding some keybindings
;;(global-set-key (kbd ""))

(global-set-key (kbd "C-c t") 'kill-this-buffer)
(global-set-key (kbd "C-c C-e") 'eval-buffer)

;; Joining lines
(global-set-key (kbd "C-c j") 'join-line)

;; Duplicating lines
;; This is missing and it really is useful
;; FROM: http://rejeep.github.io/emacs/elisp/2010/03/11/duplicate-current-line-or-region-in-emacs.html

;; Really useful
(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated. However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (i arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))

(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)

;; Creating new lines
(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)


;; Text movement
(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg)
          ;; Account for changes to transpose-lines in Emacs 24.3
          (when (and (eval-when-compile
                       (not (version-list-<
                             (version-to-list emacs-version)
                             '(24 3 50 0))))
                     (< arg 0))
            (forward-line -1)))
        (forward-line -1))
      (move-to-column column t)))))

;;;###autoload
(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))

;;;###autoload
(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))

;;;###autoload
(defun move-text-default-bindings ()
  "Bind `move-text-up' and `move-text-down' to M-up and M-down."
  (global-set-key (kbd <A-up>) 'move-text-up)
  (global-set-key (kbd <A-down>) 'move-text-down))

;;(provide 'move-text)

(global-set-key (kbd "<A-up>") 'move-text-up)
(global-set-key (kbd "<A-down>") 'move-text-down)

;; OLD Implementation
;; (defun move-line-down ()
;;   (interactive)
;;   (let ((col (current-column)))
;;     (save-excursion
;;       (forward-line)
;;       (transpose-lines 1))
;;     (forward-line)
;;     (move-to-column col)))

;; (defun move-line-up ()
;;   (interactive)
;;   (let ((col (current-column)))
    
;; 	(forward-line)
;; 	(transpose-lines -1)
;; 	(previous-line)
	
;;     (move-to-column col)
;; 	(previous-line)
;; 	))


;; (global-set-key (kbd "<A-down>") 'move-line-down)
;; (global-set-key (kbd "<A-up>") 'move-line-up)
