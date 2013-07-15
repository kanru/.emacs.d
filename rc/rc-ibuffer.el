;;; rc-ibuffer.el -- IBuffer Mode Settings

(setq ibuffer-saved-filter-groups
      '(("default"
         ("mozilla" (or (filename . "mozilla")))
         ("mail/news"
          (or (mode . message-mode)
              (mode . bbdb-mode)
              (mode . mail-mode)
              (mode . rmail-mode)
              (mode . rmail-summary-mode)
              (mode . gnus-group-mode)
              (mode . gnus-summary-mode)
              (mode . gnus-article-mode)
              (name . "^\\.newsrc-dribble")
              (name . "^\\*gnus.*\\*$")))
         ("lisp"
          (or (mode . lisp-mode)
              (mode . emacs-lisp-mode)
              (name . "^\\*slime-")))
         ("irc"
          (or (mode . erc-mode)
              (mode . rcirc-mode))))))
(add-hook 'ibuffer-mode-hook
	  (lambda ()
	    (ibuffer-switch-to-saved-filter-groups "default")))

(provide 'rc-ibuffer)
;; rc-ibuffer.el ends here
