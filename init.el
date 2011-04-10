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
(require 'gtags)
(require 'nav)

(require 'starter-kit-defuns)
(require 'starter-kit-lisp)

;; Misc
(require 'rc-mule)
(require 'rc-misc)
(require 'rc-decor)
(require 'rc-kbd)
(require 'rc-info)
(require 'rc-autoinsert)

;; Generic Modes
(require 'rc-predictive)
(require 'rc-gnus)
(require 'rc-jabber)
(require 'rc-cua)
(require 'rc-tramp)
; (require 'rc-yasnippet)
(require 'rc-org)
(require 'rc-rfc)
(require 'rc-bbdb)
(require 'rc-ediff)
(require 'rc-gtags)
(require 'rc-ibuffer)

;; Programming Modes
(require 'rc-java)
(require 'rc-markdown)
(require 'rc-nxml)
(require 'rc-python)

(load custom-file 'noerror)
;;; init.el ends here
