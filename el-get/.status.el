((ac-php status "installed" recipe
		 (:name ac-php :description "Auto complete source for php" :type github :pkgname "xcwen/ac-php" :depends
				(php-mode auto-complete yasnippet xcscope f s)))
 (auto-complete status "installed" recipe
				(:name auto-complete :website "https://github.com/auto-complete/auto-complete" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
					   (popup fuzzy)
					   :features auto-complete-config :post-init
					   (progn
						 (add-to-list 'ac-dictionary-directories
									  (expand-file-name "dict" default-directory))
						 (ac-config-default))))
 (cl-lib status "installed" recipe
		 (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :url "http://elpa.gnu.org/packages/cl-lib.html"))
 (color-theme status "installed" recipe
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
 (dash status "installed" recipe
	   (:name dash :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el"))
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
 (emacs-neotree status "installed" recipe
				(:name emacs-neotree :description "A emacs tree plugin like NerdTree for Vim." :website "https://github.com/jaypei/emacs-neotree" :type github :pkgname "jaypei/emacs-neotree"))
 (emacs-powerline status "installed" recipe
				  (:name emacs-powerline :website "https://github.com/jonathanchu/emacs-powerline" :depends
						 (cl-lib)
						 :description "Powerline for Emacs" :type github :pkgname "jonathanchu/emacs-powerline" :load-path "." :features powerline))
 (emmet-mode status "installed" recipe
			 (:name emmet-mode :website "https://github.com/smihica/emmet-mode" :description "Produce HTML from CSS-like selectors." :type "github" :branch "master" :pkgname "smihica/emmet-mode"))
 (epl status "installed" recipe
	  (:name epl :description "EPL provides a convenient high-level API for various package.el versions, and aims to overcome its most striking idiocies." :type github :pkgname "cask/epl"))
 (expand-region status "installed" recipe
				(:name expand-region :type github :pkgname "magnars/expand-region.el" :description "Expand region increases the selected region by semantic units. Just keep pressing the key until it selects what you want." :website "https://github.com/magnars/expand-region.el#readme"))
 (f status "installed" recipe
	(:name f :website "https://github.com/rejeep/f.el" :description "Modern API for working with files and directories in Emacs" :depends
		   (s dash)
		   :type github :pkgname "rejeep/f.el"))
 (fuzzy status "installed" recipe
		(:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
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
(php-mode status "installed" recipe
(:name php-mode :description "A PHP mode for GNU Emacs " :type github :pkgname "ejmr/php-mode" :website "https://github.com/ejmr/php-mode"))
(php-mode-improved status "installed" recipe
(:name php-mode-improved :description "Major mode for editing PHP code. This is a version of the php-mode from http://php-mode.sourceforge.net that fixes a few bugs which make using php-mode much more palatable" :type emacswiki :load
("php-mode-improved.el")
:features php-mode))
(pkg-info status "installed" recipe
(:name pkg-info :description "Provide information about Emacs packages." :type github :pkgname "lunaryorn/pkg-info.el" :depends
(dash epl)))
(popup status "installed" recipe
(:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :submodule nil :depends cl-lib :pkgname "auto-complete/popup-el"))
(projectile status "installed" recipe
(:name projectile :description "Project navigation and management library for Emacs." :type github :pkgname "bbatsov/projectile" :depends
(dash s f pkg-info)))
(s status "installed" recipe
(:name s :description "The long lost Emacs string manipulation library." :type github :pkgname "magnars/s.el"))
(web-mode status "installed" recipe
(:name web-mode :description "emacs major mode for editing PHP/JSP/ASP HTML templates (with embedded CSS and JS blocks)" :type github :pkgname "fxbois/web-mode"))
(xcscope status "installed" recipe
(:name xcscope :description "Cscope interface for (X)Emacs" :type github :pkgname "dkogan/xcscope.el" :prepare
(progn
(add-hook 'c-mode-hook #'cscope-minor-mode)
(add-hook 'c++-mode-hook #'cscope-minor-mode)
(add-hook 'dired-mode-hook #'cscope-minor-mode))))
(yasnippet status "installed" recipe
(:name yasnippet :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :compile "yasnippet.el" :submodule nil :build
(("git" "submodule" "update" "--init" "--" "snippets"))))
(zenburn status "installed" recipe
(:name zenburn :auto-generated t :type emacswiki :description "" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/zenburn.el")))
