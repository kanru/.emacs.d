;;; init.el --- Where all the magic begins
;;

;; Set init file for custom settings

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'noerror)

;; Load path etc.
(add-to-list 'load-path (locate-user-emacs-file "lisp"))
(add-to-list 'load-path (locate-user-emacs-file "rc"))

(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(autoload 'gid "id-utils" "Id Utilities; get id" t)

;; Load features that needs to be loaded early in startup
;; (require 'rc-cedet)
(require 'rc-startup)
(when (>= emacs-major-version 24)
  (require 'rc-packages))

;; Load packages
(require 'saveplace)
(require 'uniquify)
(require 'uuid)
(require 'thingatpt)
(require 'imenu)
(require 'ra-emacs-lsp)

;; Misc
(require 'rc-smart-mode-line)
(require 'rc-themes)
(require 'rc-gnus)
(require 'rc-mule)
(require 'rc-misc)
(require 'rc-decor)
(require 'rc-kbd)
(require 'rc-info)
(require 'rc-autoinsert)
(require 'rc-pcomplete)
(require 'rc-shortcuts)
(require 'rc-compile)
(require 'rc-time)
(require 'rc-timeclock)
(require 'rc-expand-region)
(require 'rc-ace-jump)
(require 'rc-flyspell)
(require 'rc-mail)
(require 'rc-rmail)
(require 'rc-jabber)
(require 'rc-ido)
(require 'rc-debian)
(require 'rc-todo)
(require 'rc-magit)

;; Generic Modes
(require 'rc-generic-x)
(require 'rc-cua)
(require 'rc-tramp)
(require 'rc-org)
(require 'rc-rfc)
(require 'rc-ediff)
(require 'rc-ibuffer)
(require 'rc-eshell)
(require 'rc-dired)
(require 'rc-rcirc)
(require 'rc-paredit)
(require 'rc-eldoc)
(require 'rc-diary)
(require 'rc-ggtags)

;; Programming Modes
(require 'rc-prog)
(require 'rc-lisp)
(require 'rc-cc-mode)
(require 'rc-java)
(require 'rc-markdown)
(require 'rc-nxml)
(require 'rc-js-mode)
(require 'rc-slime)
(require 'rc-company)
(require 'rc-web-mode)

;;; init.el ends here
