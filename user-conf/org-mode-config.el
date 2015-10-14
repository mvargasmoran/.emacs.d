;; Org-Mode TO-DOs you fancy?
;; for org mode todo ease, makes parent status depend on the childrens status
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;; adding new statuses to org mode
(setq org-todo-keywords
	  '((sequence "TODO" "IN-PROGRESS" "FEEDBACK" "|" "DONE" "GOOD-ENOUGH" "|" "QA-UAT")))

(setq org-todo-keyword-faces
	  '(
		("TODO" . org-warning)
		("IN-PROGRESS" . (:background "Gold" :foreground "LightYellow"))
		("QA-UAT" . (:background "lightskyblue" :foreground "midnightblue"  :weight bold))
		))

;; babel code-blocks
;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((sql . t)))


