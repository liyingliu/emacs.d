;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;packages setting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'smartparens-config)
(add-hook 'python-mode-hook #'smartparens-mode)
(require 'hungry-delete)
(global-hungry-delete-mode)
(elpy-enable)
;;enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(setq py-autopep8-options '("-a" "-a"))
;;hide show code
(add-hook 'python-mode-hook 'hs-minor-mode)
;;aggressive indent
;;(require 'aggressive-indent)
;;(add-hook 'python-mode-hook #'aggressive-indent-mode)
;;sidebar
;;(setq imenu-list-focus-after-activation t)
;;(setq imenu-list-auto-resize t)
;;(setq imenu-list-size     0.15)
;;(setq imenu-list-position 'right)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;other setting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


