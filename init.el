;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;packages 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))
 ;; cl - Common Lisp Extension
 (require 'cl)
 ;; Add Packages
 (defvar my/packages '(
		;; --- Better Editor ---
		hungry-delete
		smartparens
		monokai-theme
		elpy
		markdown-mode
		gh-md
		neotree
		py-autopep8
		;;aggressive-indent
		;;imenu-list
		) "Default packages")
 (setq package-selected-packages my/packages)
 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))
 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))
 ;; Find Executable Path on OS X
 (when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;modularize my functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))
(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))
;;load files
(load-user-file "myconfig.el")
(load-user-file "mypython.el")
(load-user-file "myc.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;key bindings 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set open init file to f2
(global-set-key (kbd "<f2>") 'open-init-file)
(global-set-key (kbd "C-d") 'duplicate-line)
(global-set-key (kbd "C-x |") 'toggle-window-split)
;;change end-of-line and beginning-of-line shortcut
;;(global-set-key (kbd "C-<right>") 'end-of-line)
;;(global-set-key (kbd "C-<left>") 'beginning-of-line)
;;hide show code
(with-eval-after-load "python"
  (define-key python-mode-map (kbd "C-c TAB") 'hs-toggle-hiding)
  (define-key python-mode-map (kbd "C-c h") 'hs-hide-all)
  (define-key python-mode-map (kbd "C-c s") 'hs-show-all)
  )
;;sidebar
;;(global-set-key [f9] 'imenu-list)
