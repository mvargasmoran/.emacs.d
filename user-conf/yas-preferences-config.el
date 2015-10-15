;; YASnippets stuff

;; Straight from https://github.com/emacs-jp/helm-c-yasnippet

(setq helm-yas-space-match-any-greedy t)
(global-set-key (kbd "C-c y") 'helm-yas-complete)
;;(yas-load-directory "<path>/<to>/snippets/") ;; I don't need this for the time being

(yas-global-mode 1)
