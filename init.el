;; User configurations files
(load "~/.emacs.d/user-conf/web-mode-config.el")
(load "~/.emacs.d/user-conf/helm-mode-config.el")

;; PERSONAL PREFERENCES

;; look and feel preferences
(tool-bar-mode -1)
(scroll-bar-mode -1)

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
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#cccccc" "#f2777a" "#99cc99" "#ffcc66" "#6699cc" "#cc99cc" "#66cccc" "#2d2d2d"))
 '(custom-enabled-themes (quote (moe-dark)))
 '(custom-safe-themes
   (quote
    ("8e5dd88c42089566d5f8e1a23d3017c213eeccd94a7b9e1a58a2dc3e08cb26d5" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(fci-rule-color "#515151")
 '(fringe-mode 0 nil (fringe))
 '(helm-mode t)
 '(helm-projectile nil)
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f2777a")
     (40 . "#f99157")
     (60 . "#ffcc66")
     <
     (80 . "#99cc99")
     (100 . "#66cccc")
     (120 . "#6699cc")
     (140 . "#cc99cc")
     (160 . "#f2777a")
     (180 . "#f99157")
     (200 . "#ffcc66")
     (220 . "#99cc99")
     (240 . "#66cccc")
     (260 . "#6699cc")
     (280 . "#cc99cc")
     (300 . "#f2777a")
     (320 . "#f99157")
     (340 . "#ffcc66")
     (360 . "#99cc99"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
