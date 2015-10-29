;; PERSONAL PREFERENCES

;;;; look and feel preferences

;; no scratch message, I know what it does already
(setq initial-scratch-message "")

;;(tool-bar-mode -1)
;;(scroll-bar-mode -1)
;;neotree
(global-set-key [f8] 'neotree-toggle)


;;;;;; ### Easier on the eyes ###
(set-face-attribute 'default nil :height 130)
(setq-default line-spacing 6)

;;;;;; about indentation and tabs
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))))

(setq-default tab-width 4)

;;;;; Editor
(global-git-gutter-mode t)

;; Moving ~**** backup-files away.-
;; following Magnar's  whattheemacs.d
;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)


;;;; sound stuff
;;;;;; Disable annoying limits bell
(defun my-bell-function ()
  (unless (memq this-command
        '(isearch-abort abort-recursive-edit exit-minibuffer
              keyboard-quit mwheel-scroll down up next-line previous-line
              backward-char forward-char))
    (ding)))
(setq ring-bell-function 'my-bell-function)
