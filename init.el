;; Most stuff should be in it's own file, but...
;; first stop that startup stuff, stop it

;; from http://whattheemacsd.com/
;; Damn there are several good emacs thingys there

;; Turn off mouse interface early in startup to avoid momentary display
;; Get off my UI ٩(╬ఠ༬ఠ)و
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; User configurations files
;; first let's load a loader ᕙ(⇀‸↼‶)ᕗ
(load "~/.emacs.d/loader.el")
;; then load a dir o stuff
(load-directory "~/.emacs.d/user-conf")

;; it's important to me that I can just get back to work
(desktop-save-mode 1)

(ac-config-default) ;; auto-complete

;;nyan mode just to be goffy
(nyan-mode )
(nyan-start-animation )

;; Adding some powerline styles
;; (custom-set-faces
;;  '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
;;  '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))

(custom-set-faces
 '(mode-line ((t (:foreground "#030303" :background "lightskyblue" :box nil))))
 '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))


;;(setq powerline-color1 "grey22")
;;(setq powerline-color2 "grey40")

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
 '(helm-projectile )
 '(company-mode)
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
