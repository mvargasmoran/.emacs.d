;;(require 'helm)
;;(require 'helm-config)


(global-set-key (kbd "C-c h") 'helm-M-x)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

;;(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
;;(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
;;(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

;; I need helm projectile available on startup
(helm-projectile-on)

;;(helm-mode 1)
;; Projectile Keybndings yes, I don't need all
(global-set-key (kbd "C-c p") 'helm-projectile-find-file-dwim)
(global-set-key (kbd "C-c d") 'helm-projectile-find-dir)
(global-set-key (kbd "C-c S") 'helm-projectile-switch-project)
(global-set-key (kbd "C-c b") 'helm-projectile-switch-to-buffer)
