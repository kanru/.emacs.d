(add-to-list 'load-path (expand-file-name "~/zone2/public/emacs/gnus/lisp"))

(setq gnus-home-directory (locate-user-emacs-file "gnus")
      gnus-init-file      (locate-user-emacs-file "gnus")
      message-directory   (expand-file-name "Mail/" gnus-home-directory))

(require 'gnus-load nil t)
(provide 'rc-gnus)
