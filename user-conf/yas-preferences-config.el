;; YASnippets stuff

;; I really need to add my own Snippets (and those I've found laying around in the internetz
;; straight outa https://github.com/capitaomorte/yasnippet
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"					;; personal snippets
		"~/.emacs.d/el-get/yasnippet/yasmate"	;; the yasmate collection
        "~/.emacs.d/el-get/yasnippet/snippets"  ;; the default collection
        ))
;; Straight from https://github.com/emacs-jp/helm-c-yasnippet

(setq helm-yas-space-match-any-greedy t)
(global-set-key (kbd "C-c y") 'helm-yas-complete)
;;(yas-load-directory "<path>/<to>/snippets/") ;; I don't need this for the time being

(yas-global-mode 1)
