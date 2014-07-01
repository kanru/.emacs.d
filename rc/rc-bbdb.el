;;; rc-bbdb.el -- BBDB Settings

(require 'bbdb)

(bbdb-initialize 'gnus 'message)

(setq bbdb-file (locate-user-emacs-file "bbdb.el")
      bbdb-complete-mail-allow-cycling t)

(provide 'rc-bbdb)
;; rc-bbdb.el ends here
