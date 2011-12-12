(require 'info)
(add-to-list 'Info-default-directory-list "~/src/gnus/texi/")
(add-to-list 'Info-default-directory-list "~/.emacs.d/info/")

(require 'info-look)
(info-lookup-add-help
 :mode 'lisp-mode
 :regexp "[^][()'\" \t\n]+"
 :ignore-case t
 :doc-spec '(("(ansicl)Symbol Index" nil nil nil)))

(provide 'rc-info)
