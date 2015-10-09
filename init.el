;; User configurations files
(load "~/.emacs.d/user-conf/web-mode-config.el")
(load "~/.emacs.d/user-conf/helm-mode-config.el")

;; PERSONAL PREFERENCES
(tool-bar-mode -1)

;; Securing el-get availability
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)


;; Multiple cursors keybindings
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Expand Regions
(global-set-key (kbd "C-=") 'er/expand-region)

;; Org-Mode TO-DOs you fancy?
;; for org mode todo ease, makes parent status depend on the childrens status
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;; adding new statuses to org mode
(setq org-todo-keywords
       '((sequence "TODO" "IN-PROGRESS" "FEEDBACK" "|" "DONE" "GOOD-ENOUGH")))

;; babel code-blocks
;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((sql . t)))

;; Auto complete
;; Company mode
(company-mode)
;;(ac-config-default) ;; auto-complete

;; Beyond this point emacs will do silly stuff by itself ;)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (moe-dark)))
 '(custom-safe-themes
   (quote
    ("8e5dd88c42089566d5f8e1a23d3017c213eeccd94a7b9e1a58a2dc3e08cb26d5" "be9dc1d3e2b84923530294ee74fba00ef7fe815f1e52ef2aec67ac40965a735a" "74278d14b7d5cf691c4d846a4bbf6e62d32104986f104c1e61f718f9669ec04b" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
