;;; init.el --- Where all the magic begins
;;

;; Set init file for custom settings
(setq custom-file (locate-user-emacs-file "custom.el"))

;; Load path etc.
(add-to-list 'load-path (locate-user-emacs-file "lisp"))
(add-to-list 'load-path (locate-user-emacs-file "rc"))

(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(autoload 'gid "id-utils" "Id Utilities; get id" t)

;; Load features that needs to be loaded early in startup
(require 'rc-cedet)
(require 'rc-startup)
(when (>= emacs-major-version 24)
  (require 'rc-packages))

;; Load packages
;(require 'cl)
(require 'saveplace)
(require 'uniquify)
(require 'uuid)
(require 'thingatpt)
(require 'imenu)
(require 'gtags nil t)

;; Misc
(require 'rc-mule)
(require 'rc-misc)
(require 'rc-decor)
(require 'rc-kbd)
(require 'rc-info)
(require 'rc-autoinsert)
(require 'rc-theme)
(require 'rc-pcomplete)
(require 'rc-shortcuts)
(require 'rc-compile)
(require 'rc-time)
(require 'rc-timeclock)
(require 'rc-bbdb)
(require 'rc-expand-region)
(require 'rc-ace-jump)

;; Generic Modes
(require 'rc-generic-x)
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
(require 'rc-paredit)
(require 'rc-eldoc)
(require 'rc-diary)

;; Programming Modes
(require 'rc-prog)
(require 'rc-lisp)
(require 'rc-cc-mode)
(require 'rc-java)
(require 'rc-markdown)
(require 'rc-nxml)
(require 'rc-python)
(require 'rc-js-mode)
(require 'rc-slime)
(require 'rc-auto-complete)

(load custom-file 'noerror)
;;; init.el ends here
