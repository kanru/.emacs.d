;;; init.el --- Where all the magic begins
;;

;; Set init file for custom settings
(setq custom-file (locate-user-emacs-file "custom.el"))

;; Load path etc.
(add-to-list 'load-path (locate-user-emacs-file "lisp"))
(add-to-list 'load-path (locate-user-emacs-file "rc"))

(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Load features that needs to be loaded early in startup
(require 'rc-startup)

;; Load packages
(require 'cl)
(require 'saveplace)
(require 'uniquify)
(require 'paredit)
(require 'uuid)
(require 'git-commit)
(require 'thingatpt)
(require 'imenu)
(require 'undo-tree)
(require 'gtags nil t)
(require 'nav)
(require 'generic-x)
(require 'idutils "id-utils" t)

(require 'starter-kit-defuns)
(require 'starter-kit-lisp)

;; Misc
(require 'rc-mule)
(require 'rc-misc)
(require 'rc-decor)
(require 'rc-kbd)
(require 'rc-info)
(require 'rc-autoinsert)
(require 'rc-theme)
(require 'rc-pcomplete)

;; Generic Modes
(require 'rc-predictive)
(require 'rc-gnus)
(require 'rc-cua)
(require 'rc-tramp)
(require 'rc-yasnippet)
(require 'rc-org)
(require 'rc-rfc)
(require 'rc-ediff)
(require 'rc-gtags)
(require 'rc-ibuffer)
(require 'rc-eshell)
(require 'rc-dired)
(require 'rc-calfw)
(require 'rc-rcirc)

;; Programming Modes
(require 'rc-cc-mode)
(require 'rc-java)
(require 'rc-markdown)
(require 'rc-nxml)
(require 'rc-python)
(require 'rc-slime)
(require 'rc-auto-complete)

(load custom-file 'noerror)
;;; init.el ends here
