(add-to-list 'load-path (expand-file-name "~/zone2/public/emacs/gnus/lisp"))
(require 'gnus-load nil t)

(setq gnus-init-file (locate-user-emacs-file "gnus"))

(provide 'rc-gnus)
