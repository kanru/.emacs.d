(require 'info)
(add-to-list 'Info-additional-directory-list "~/zone2/public/emacs/gnus/texi/")
(add-to-list 'Info-additional-directory-list (locate-user-emacs-file "info"))
(add-to-list 'Info-additional-directory-list "~/.local/share/info/")

(require 'info-look)
(info-lookup-add-help
 :mode 'lisp-mode
 :regexp "[^][()'\" \t\n]+"
 :ignore-case t
 :doc-spec '(("(ansicl)Symbol Index" nil nil nil)))
(info-lookup-add-help
 :mode 'slime-repl-mode
 :regexp "[^][()'\" \t\n]+"
 :ignore-case t
 :doc-spec '(("(ansicl)Symbol Index" nil nil nil)))

(provide 'rc-info)
