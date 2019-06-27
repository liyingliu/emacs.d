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
		clang-format
		company-irony
		irony
		company
		;;company-irony-c-headers
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


;;to install irony-server: brew install llvm;export LDFLAGS="-L/usr/local/opt/llvm/lib";export CPPFLAGS="-I/usr/local/opt/llvm/include";https://github.com/Sarcasm/irony-mode/issues/167
;;(require 'irony)
;;(add-hook 'c++-mode-hook 'irony-mode)
;;(add-hook 'c-mode-hook 'irony-mode)
;;(add-hook 'objc-mode-hook 'irony-mode)
;;(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;;only the following 3 lines can have drop downbox, if with the above 5 lines dropdown are gone,but autocomplete still there
(add-hook 'after-init-hook 'global-company-mode)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))
(add-to-list 'company-backends 'company-irony-c-headers)
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
