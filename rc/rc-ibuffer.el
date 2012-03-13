;;; rc-ibuffer.el -- IBuffer Mode Settings

(setq ibuffer-saved-filter-groups
      '(("default"
         ("mozilla" (or (filename . "mozilla")))
         ("dired" (mode . dired-mode))
         ("lisp" (or
		  (mode . lisp-mode)
		  (mode . emacs-lisp-mode)
		  (name . "^\\*slime-")))
         ("org" (or
                 (mode . org-mode)))
         ("gnus" (or
                  (mode . message-mode)
                  (mode . bbdb-mode)
                  (mode . mail-mode)
                  (mode . gnus-group-mode)
                  (mode . gnus-summary-mode)
                  (mode . gnus-article-mode)
                  (name . "^\\.bbdb$")
                  (name . "^\\.newsrc-dribble")
                  (name . "^\\*gnus.*\\*$")))
         ("irc" (or (mode . erc-mode)
                    (mode . rcirc-mode))))))
(add-hook 'ibuffer-mode-hook
	  (lambda ()
	    (ibuffer-switch-to-saved-filter-groups "default")))

(provide 'rc-ibuffer)
;; rc-ibuffer.el ends here
