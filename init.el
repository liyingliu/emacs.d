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
		neotree
		py-autopep8
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
;;packages setting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'smartparens-config)
(add-hook 'python-mode-hook #'smartparens-mode)
(load-theme 'monokai t)
(require 'hungry-delete)
(global-hungry-delete-mode)
(elpy-enable)
(global-set-key [f8] 'neotree-toggle)
;;enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(setq py-autopep8-options '("-a" "-a"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;other setting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; close tool-bar-mode
(tool-bar-mode -1)
;; close scroll bar
(scroll-bar-mode -1)
;; show line number
;;(global-linum-mode 1)
;; set cursor type
(setq-default cursor-type 'bar)
;; close open help 
(setq inhibit-splash-screen 1)
;; fond to 16
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 160)
;; shortcut for init-file
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(delete-selection-mode 1)
;;(global-hl-line-mode 1)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;key bindings 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set open init file to f2
(global-set-key (kbd "<f2>") 'open-init-file);;duplicate-line
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  )
(global-set-key (kbd "C-d") 'duplicate-line)
;;change end-of-line and beginning-of-line shortcut
;;(global-set-key (kbd "C-<right>") 'end-of-line)
;;(global-set-key (kbd "C-<left>") 'beginning-of-line)

