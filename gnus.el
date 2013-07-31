;;; my-gnus.el

;; Select methods
(setq gnus-select-method
      '(nnmbox "mail")
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

;; Make button for the multipart
(setq gnus-buttonized-mime-types
      '("multipart/alternative" "multipart/signed")
      mm-discouraged-alternatives
      '("text/html" "image/.*"))

;;; gnus-registry
(setq gnus-registry-max-entries 2500)
(gnus-registry-initialize)

(setq gnus-auto-expirable-newsgroups
      "mail.misc")

(setq nnmail-expiry-target 'nnmail-fancy-expiry-target
      nnmail-fancy-expiry-targets
      '(("list-id" "dev-geolocation"  "nnfolder+archive:geolocation.%Y")
        ("list-id" "b2g-internal"     "nnfolder+archive:b2g-internal.%Y")
        ("from"    "bugzilla-daemon@" "nnfolder+archive:bugzilla.%Y-%m")
        ("from"    "."                "nnfolder+archive:mozilla.%Y-%m"))
      nnmail-expiry-wait-function
      (lambda (group)
        (cond ((string= group "mail.misc") 'immediate))))

(provide 'my-gnus)
