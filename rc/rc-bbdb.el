;;; rc-bbdb.el -- BBDB Settings

(require 'bbdb-loaddefs "~/zone2/public/emacs/bbdb/lisp/bbdb-loaddefs.el" t)

(eval-after-load 'bbdb
  '(progn
     (bbdb-initialize 'gnus 'message)))

(setq bbdb-file (locate-user-emacs-file "bbdb.el")
      bbdb-complete-mail-allow-cycling t)

(provide 'rc-bbdb)
;; rc-bbdb.el ends here
