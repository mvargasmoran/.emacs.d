;; PHP derp

(add-hook 'php-mode-hook 'my-php-mode-hook)
(defun my-php-mode-hook ()
  "My PHP mode configuration."
  (setq indent-tabs-mode nil
        tab-width 4
        c-basic-offset 4))


;; Fixing PHP-MODE array awful indentation
;; from http://emacswiki.org/emacs/PhpMode#toc18
;; what a great PHP-MODE wiki
(add-hook 'php-mode-hook (lambda ()
    (defun ywb-php-lineup-arglist-intro (langelem)
      (save-excursion
        (goto-char (cdr langelem))
        (vector (+ (current-column) c-basic-offset))))
    (defun ywb-php-lineup-arglist-close (langelem)
      (save-excursion
        (goto-char (cdr langelem))
        (vector (current-column))))
    (c-set-offset 'arglist-intro 'ywb-php-lineup-arglist-intro)
    (c-set-offset 'arglist-close 'ywb-php-lineup-arglist-close)))

;; Fixing the new closures in PHP, that PHP-MODE doesn't consider

;; Adding a nice PHP doc lookup pop-up
;; from http://emacswiki.org/emacs/PhpMode#toc14
(add-hook 'php-mode-hook 'my-php-mode-stuff)

(defun my-php-mode-stuff ()
  (local-set-key (kbd "<f1>") 'my-php-function-lookup)
  (local-set-key (kbd "C-x <f1>") 'my-php-symbol-lookup))


(defun my-php-symbol-lookup ()
  (interactive)
  (let ((symbol (symbol-at-point)))
    (if (not symbol)
        (message "No symbol at point.")

      (browse-url (concat "http://php.net/manual-lookup.php?pattern="
                          (symbol-name symbol))))))


(defun my-php-function-lookup ()
  (interactive)
  (let* ((function (symbol-name (or (symbol-at-point)
                                    (error "No function at point."))))
         (buf (url-retrieve-synchronously (concat "http://php.net/manual-lookup.php?pattern=" function))))
    (with-current-buffer buf
      (goto-char (point-min))
        (let (desc)
          (when (re-search-forward "<div class=\"methodsynopsis dc-description\">\\(\\(.\\|\n\\)*?\\)</div>" nil t)
            (setq desc
              (replace-regexp-in-string
                " +" " "
                (replace-regexp-in-string
                  "\n" ""
                  (replace-regexp-in-string "<.*?>" "" (match-string-no-properties 1)))))

            (when (re-search-forward "<p class=\"para rdfs-comment\">\\(\\(.\\|\n\\)*?\\)</p>" nil t)
              (setq desc
                    (concat desc "\n\n"
                            (replace-regexp-in-string
                             " +" " "
                             (replace-regexp-in-string
                              "\n" ""
                              (replace-regexp-in-string "<.*?>" "" (match-string-no-properties 1))))))))

          (if desc
              (message desc)
            (message "Could not extract function info. Press C-x F1 to go the description."))))
    (kill-buffer buf)))


;; Has all php.net/manual has to offer (in terms of functions names)
;; from http://emacswiki.org/emacs/PhpMode#toc15
(defun my-fetch-php-completions ()
  (if (and (boundp 'my-php-symbol-list)
           my-php-symbol-list)
      my-php-symbol-list

    (message "Fetching completion list...")

    (with-current-buffer
        (url-retrieve-synchronously "http://www.php.net/manual/en/indexes.functions.php")

      (goto-char (point-min))

      (message "Collecting function names...")

      (setq my-php-symbol-list nil)
      (while (re-search-forward "<a[^>]*class=\"index\"[^>]*>\\([^<]+\\)</a>" nil t)
        (push (match-string-no-properties 1) my-php-symbol-list))

      my-php-symbol-list)))
