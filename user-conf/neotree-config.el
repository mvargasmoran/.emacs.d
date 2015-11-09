;; Neotree stuff
(defun neotree-ffip-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (ffip-project-root))
		(file-name (buffer-file-name)))
	(if project-dir
		(progn
		  (neotree-dir project-dir)
		  (neotree-find file-name))
	  (message "Could not find git project root."))))

(global-set-key (kbd "C-c C-p") 'neotree-ffip-project-dir)


(defadvice helm-projectile-find-file (after helm-projectile-find-file activate)
  (neotree-dir default-directory))
