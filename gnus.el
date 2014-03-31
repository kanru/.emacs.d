;;; my-gnus.el

(gnus-registry-initialize)

;; Select methods
(setq gnus-select-method
      '(nnml "mail")
      gnus-secondary-select-methods
      '((nnimap "mozilla"
                (nnimap-address "mail.mozilla.com")
                (nnimap-port "imaps")
                (nnimap-inbox "INBOX")
                (nnimap-split-methods default))
        (nnimap "kanru"
                (nnimap-address "kanru.info")
                (nnimap-inbox "INBOX")
                (nnimap-split-methods default)))
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

(setq nnmail-treat-duplicates 'delete
      nnmail-split-methods 'nnmail-split-fancy
      nnmail-split-fancy
      '(| ("subject" "\\*\\*\\*SPAM" junk)
          (&
           ("list-id" ".*<\\(.*?\\)\\(\\.lists\\)?\\.mozilla\\.org>.*" "lists.mozilla.\\1")
           ("list-id" ".*<\\(.*?\\)\\.lists\\(.alioth\\)?\\.debian\\.org>.*" "lists.debian.\\1")
           ("list-id" ".*<\\(.*?\\)\\.w3\\.org>.*" "lists.w3.\\1")
           ("list-id" "ding\\.gnus\\.org" "lists.misc.gnus")
           ("list-id" ".*<\\(.*?\\)\\.gnu\\.org>.*" "lists.gnu.\\1")
           ("list-id" ".*<\\(.*?\\)\\.googlegroups\\.com>.*" "lists.misc.\\1")
           ("list-id" "contribute\\.mail\\.moztw\\.org" "lists.mozilla.contribute")
           ("list-id" "awesome\\.naquadah\\.org" "lists.misc.awesome")
           ("list-id" "awesome-devel\\.naquadah\\.org" "lists.misc.awesome")
           ("list-id" "debconf-team\\.lists\\.debconf\\.org" "lists.debian.debconf")
           (from "bugzilla-daemon@mozilla" "lists.mozilla.bugzilla")
           ("x-loop" "owner@bugs\\.debian\\.org" "mail.debian.bugs")
           (to "picolisp@software-lab.de" "lists.misc.picolisp"))
          (to "kchen.mozilla.com" "mail.mozilla")
          "mail.misc"))

(provide 'my-gnus)
