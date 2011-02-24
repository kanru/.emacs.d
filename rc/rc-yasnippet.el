;;; rc-yasnippet.el -- Yasnippet Mode Settings

(require 'yasnippet nil t)

(eval-after-load 'yasnippet
  '(progn
     (setq yas/root-directory (list
                               (locate-user-emacs-file "snippets")
                               "/usr/share/emacs/site-lisp/yasnippet/snippets"))
     (mapc 'yas/load-directory yas/root-directory)))

(provide 'rc-yasnippet)
;; rc-yasnippet.el ends here
