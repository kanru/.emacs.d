(add-to-list 'load-path (expand-file-name "~/zone2/public/emacs/gnus/lisp"))
(add-to-list 'Info-default-directory-list "~/zone2/public/emacs/gnus/texi/")
(require 'gnus-load nil t)

(setq gnus-init-file (locate-user-emacs-file "gnus"))

(provide 'rc-gnus)
