;; web-mode

;; PHP bunch
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))

;; Html
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; Laravel
(setq web-mode-engines-alist
      '(("php"    . "\\.phtml\\'")
        ("blade"  . "\\.blade\\."))
	  )

;; JS, Sails, Angular
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))
