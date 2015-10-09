((color-theme status "installed" recipe
	      (:name color-theme :description "An Emacs-Lisp package with more than 50 color themes for your use. For questions about color-theme" :website "http://www.nongnu.org/color-theme/" :type http-tar :options
		     ("xzf")
		     :url "http://download.savannah.gnu.org/releases/color-theme/color-theme-6.6.0.tar.gz" :load "color-theme.el" :features "color-theme" :post-init
		     (progn
		       (color-theme-initialize)
		       (setq color-theme-is-global t))))
 (color-theme-sanityinc-tomorrow status "installed" recipe
				 (:name color-theme-sanityinc-tomorrow :description "Two pleasant medium-contrast Emacs color themes in light and dark flavours" :type github :pkgname "purcell/color-theme-sanityinc-tomorrow" :depends color-theme :prepare
					(progn
					  (autoload 'color-theme-sanityinc-tomorrow-day "color-theme-sanityinc-tomorrow" "color-theme: sanityinc-tomorrow-day" t)
					  (autoload 'color-theme-sanityinc-tomorrow-night "color-theme-sanityinc-tomorrow" "color-theme: sanityinc-tomorrow-night" t)
					  (autoload 'color-theme-sanityinc-tomorrow-blue "color-theme-sanityinc-tomorrow" "color-theme: sanityinc-tomorrow-blue" t)
					  (autoload 'color-theme-sanityinc-tomorrow-bright "color-theme-sanityinc-tomorrow" "color-theme: sanityinc-tomorrow-bright" t)
					  (autoload 'color-theme-sanityinc-tomorrow-eighties "color-theme-sanityinc-tomorrow" "color-theme: sanityinc-tomorrow-eighties" t))))
 (company-mode status "installed" recipe
	       (:name company-mode :website "http://company-mode.github.io/" :description "Modular in-buffer completion framework for Emacs" :type github :pkgname "company-mode/company-mode"))
 (el-get status "installed" recipe
	 (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
		("el-get.*\\.el$" "methods/")
		:features el-get :post-init
		(when
		    (memq 'el-get
			  (bound-and-true-p package-activated-list))
		  (message "Deleting melpa bootstrap el-get")
		  (unless package--initialized
		    (package-initialize t))
		  (when
		      (package-installed-p 'el-get)
		    (let
			((feats
			  (delete-dups
			   (el-get-package-features
			    (el-get-elpa-package-directory 'el-get)))))
		      (el-get-elpa-delete-package 'el-get)
		      (dolist
			  (feat feats)
			(unload-feature feat t))))
		  (require 'el-get))))
 (emmet-mode status "installed" recipe
	     (:name emmet-mode :website "https://github.com/smihica/emmet-mode" :description "Produce HTML from CSS-like selectors." :type "github" :branch "master" :pkgname "smihica/emmet-mode"))
 (expand-region status "installed" recipe
		(:name expand-region :type github :pkgname "magnars/expand-region.el" :description "Expand region increases the selected region by semantic units. Just keep pressing the key until it selects what you want." :website "https://github.com/magnars/expand-region.el#readme"))
 (helm status "installed" recipe
       (:name helm :description "Emacs incremental and narrowing framework" :type github :pkgname "emacs-helm/helm" :autoloads "helm-autoloads" :build
	      (("make"))
	      :build/darwin
	      `(("make" ,(format "EMACS_COMMAND=%s" el-get-emacs)))
	      :build/windows-nt
	      (let
		  ((generated-autoload-file
		    (expand-file-name "helm-autoloads.el"))
		   \
		   (backup-inhibited t))
	      (update-directory-autoloads default-directory)
	      nil)))
(moe-theme status "installed" recipe
(:name moe-theme :description "A customizable colorful eye-candy theme for Emacser. Moe, moe, kyun!" :website "https://github.com/kuanyui/moe-theme.el" :type github :pkgname "kuanyui/moe-theme.el" :prepare
(add-to-list 'custom-theme-load-path default-directory)))
(multiple-cursors status "installed" recipe
(:name multiple-cursors :description "An experiment in adding multiple cursors to emacs" :type github :pkgname "magnars/multiple-cursors.el"))
(web-mode status "installed" recipe
(:name web-mode :description "emacs major mode for editing PHP/JSP/ASP HTML templates (with embedded CSS and JS blocks)" :type github :pkgname "fxbois/web-mode"))
(zenburn status "installed" recipe
(:name zenburn :auto-generated t :type emacswiki :description "" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/zenburn.el")))
