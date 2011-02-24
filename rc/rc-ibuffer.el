;;; rc-ibuffer.el -- IBuffer Mode Settings

(setq ibuffer-saved-filter-groups
      '(("default"
         ("android" (filename . ".*android.*"))
         ("dired" (mode . dired-mode))
         ("lisp" (mode . emacs-lisp-mode))
         ("erc" (mode . erc-mode))
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
         ("jabber" (or
                    (mode . jabber-roster-mode)
                    (mode . jabber-chat-mode))))))
(add-hook 'ibuffer-mode-hook
	  (lambda ()
	    (ibuffer-switch-to-saved-filter-groups "default")))

(provide 'rc-ibuffer)
;; rc-ibuffer.el ends here
