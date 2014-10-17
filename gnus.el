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
      '((nnimap "mozilla"
                (nnimap-address "mail.mozilla.com")
                (nnimap-port "imaps")
                (nnimap-fetch-partial-articles t))
        (nnimap "kanru"
                (nnimap-address "kanru.info")
                (nnimap-fetch-partial-articles t)))
      mail-sources
      '((file :plugged t)))

(setq gnus-registry-max-entries 10000)
(gnus-registry-initialize)
;; Fetching by `Message-ID' Using the Registry
(setq gnus-refer-article-method
      '(current
        (nnregistry)
        (nnweb "gmane" (nnweb-type gmane))))

(setq gnus-ignored-from-addresses user-mail-address-regexp)

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
(add-hook 'gnus-group-mode-hook 'hl-line-mode)
(add-hook 'gnus-summary-mode-hook 'hl-line-mode)

(setq gnus-summary-line-format "%U%R%z%B%(%[%4L: %-23,23f%]%) %s\n"
      gnus-sum-thread-tree-false-root ""
      gnus-sum-thread-tree-indent "  "
      gnus-sum-thread-tree-leaf-with-other "├─━ "
      gnus-sum-thread-tree-root ""
      gnus-sum-thread-tree-single-leaf "└─━ "
      gnus-sum-thread-tree-vertical "│ ")
(defun gnus--simplify-summary-line-mode ()
  (when (string-match "lists\..*\.bugzilla" gnus-newsgroup-name)
    (setf gnus-summary-line-format "%U%R%z%B%s\n")))
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

(setq gnus-auto-expirable-newsgroups
      "lists\\."
      nnmail-expiry-wait-function
      (lambda (group)
        (cond ((string-match "b2g-internal" group) 'never)
              (t 30)))
      gnus-inhibit-user-auto-expire nil)

(provide 'my-gnus)
