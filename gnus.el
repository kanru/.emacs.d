;;; my-gnus.el

;; Select methods
(setq gnus-select-method
      '(nnml "mail")
      mail-sources
      '((file :plugged t)))

;; Fetching by `Message-ID' Using the Registry
(setq gnus-refer-article-method
      '(current
        (nnregistry)
        (nnweb "gmane" (nnweb-type gmane))))

(setq gnus-ignored-from-addresses user-mail-address-regexp)

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
(add-hook 'gnus-group-mode-hook 'hl-line-mode)
(add-hook 'gnus-summary-mode-hook 'hl-line-mode)

(setq gnus-treat-hide-citation-maybe t)

(add-to-list 'gnus-button-alist
             '("\\<bug \\([[:digit:]]+\\)\\>" 0
               (and (fboundp 'bugzilla)
                    gnus-newsgroup-name
                    (string-match "mozilla" gnus-newsgroup-name))
               bugzilla 1))

(add-to-list 'gnus-button-alist
             '("\\<bug \\([[:digit:]]+\\)\\>" 0
               (and (fboundp 'debbugs)
                    gnus-newsgroup-name
                    (string-match "debian" gnus-newsgroup-name))
               debbugs 1))

;; Make button for the multipart
(setq gnus-buttonized-mime-types
      '("multipart/alternative" "multipart/signed")
      mm-discouraged-alternatives
      '("text/html" "image/.*"))

;;; gnus-registry
(setq gnus-registry-max-entries 2500)
(gnus-registry-initialize)

(setq gnus-auto-expirable-newsgroups
      "lists\\.")

(setq nnmail-expiry-wait-function
      (lambda (group)
        (cond ((string-match "b2g-internal" group) 'never)
              (t 30))))

(setq nnmail-treat-duplicates 'delete
      nnmail-split-methods 'nnmail-split-fancy
      nnmail-split-fancy
      '(| ("list-id" ".*<\\(.*?\\)\\(\\.lists\\)?\\.mozilla\\.org>.*" "lists.mozilla.\\1")
          ("list-id" ".*<\\(.*?\\)\\.lists\\(.alioth\\)?\\.debian\\.org>.*" "lists.debian.\\1")
          ("list-id" ".*<\\(.*?\\)\\.w3\\.org>.*" "lists.w3.\\1")
          ("list-id" "summit2013zh\\.mail\\.moztw\\.org" "lists.mozilla.summit2013zh")
          ("list-id" "ding\\.gnus\\.org" "lists.misc.gnus")
          ("list-id" ".*<\\(.*?\\)\\.gnu\\.org>.*" "lists.gnu.\\1")
          (from "bugzilla-daemon" "lists.mozilla.bugzilla")
          ("x-loop" "owner@bugs\\.debian\\.org" "mail.debian.bugs")
          (to "kchen.mozilla.com" "mail.mozilla")
          "mail.misc"))

(provide 'my-gnus)
