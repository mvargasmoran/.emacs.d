;; (define-key map (kbd "C-j") 'emmet-expand-line)
;; (define-key map (kbd "<C-return>") 'emmet-expand-line)
;; (define-key map (kbd "<C-M-right>") 'emmet-next-edit-point)
;; (define-key map (kbd "<C-M-left>") 'emmet-prev-edit-point)
;; (define-key map (kbd "C-c w") 'emmet-wrap-with-markup)

;; (define-key map (kbd "RET") 'emmet-preview-accept)
;; (define-key map (kbd "<return>") 'emmet-preview-accept)
;; (define-key map [(control ?g)] 'emmet-preview-abort)

(global-set-key (kbd "<C-tab>") 'emmet-expand-yas)
(global-set-key (kbd "<C-S-tab>") 'emmet-preview)
