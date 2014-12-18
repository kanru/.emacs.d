;;; my-gnus.el

(setq gnus-save-newsrc-file nil
      gnus-read-newsrc-file nil
      gnus-save-killed-list nil
      gnus-check-new-newsgroups 'ask-server)

(setq gnus-use-full-window nil)

;; Select methods
(setq gnus-select-method
      '(nnml "mail")
      gnus-secondary-select-methods
      '((nnimap "kanru"
                (nnimap-address "kanru.info")
                (nnimap-fetch-partial-articles "text/")))
      mail-sources
      '((file :plugged t)))

;;; Archive groups
(setq gnus-message-archive-group
      '((cond
         ((message-news-p) (format-time-string "sent.%Y-%m"))
         ((message-mail-p) "nnimap+kanru:Sent")))
      gnus-gcc-mark-as-read t)

(setq gnus-ignored-from-addresses user-mail-address-regexp)

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
(add-hook 'gnus-group-mode-hook 'hl-line-mode)
(add-hook 'gnus-summary-mode-hook 'hl-line-mode)

(setq gnus-face-1 'font-lock-keyword-face
      gnus-face-2 'font-lock-doc-face)

(setq gnus-summary-line-format "%U%R%z%* %1{%d%} %(%-20,20f %2{%4k%} %B%s%) \n"
      gnus-sum-thread-tree-false-root ""
      gnus-sum-thread-tree-indent "  "
      gnus-sum-thread-tree-leaf-with-other "├─━ "
      gnus-sum-thread-tree-root ""
      gnus-sum-thread-tree-single-leaf "└─━ "
      gnus-sum-thread-tree-vertical "│ ")
(defun gnus--simplify-summary-line-mode ()
  (when (string-match "lists\..*\.bugzilla" gnus-newsgroup-name)
    (setf gnus-summary-line-format "%U%R%z%* %1{%d%} %(%B%s%) \n")))
(add-hook 'gnus-summary-mode-hook 'gnus--simplify-summary-line-mode)

(add-to-list 'gnus-button-alist
             '("\\<bug[ \n]*?\\([[:digit:]]+\\)\\>" 0
               (and (fboundp 'bugzilla)
                    gnus-newsgroup-name
                    (string-match "mozilla" gnus-newsgroup-name))
               bugzilla 1))

(add-to-list 'gnus-button-alist
             '("\\<bug[ \n]*?\\([[:digit:]]+\\)\\>" 0
               (and (fboundp 'debbugs)
                    gnus-newsgroup-name
                    (string-match "debian" gnus-newsgroup-name))
               debbugs 1))

;; Make button for the multipart
(setq gnus-buttonized-mime-types
      '("multipart/alternative" "multipart/signed")
      mm-discouraged-alternatives
      '("text/html" "image/.*"))

(setq gnus-posting-styles
      `((t
         (address ,(rot13 "xnaeh@xnaeh.vasb")))
        ((or (string-match-p "work" system-name)
             (string-match-p "mozilla" gnus-newsgroup-name))
         (address ,(rot13 "xpura@zbmvyyn.pbz"))
         ("X-Message-SMTP-Method"
          ,(rot13 "fzgc znvy.zbmvyyn.pbz 587 xpura@zbmvyyn.pbz")))
        ("debian"
         (address ,(rot13 "xbfgre@qrovna.bet")))))

(provide 'my-gnus)
