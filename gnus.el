;;; my-gnus.el

(require 'nnir)
(require 'gnutls)

(gnus-registry-initialize)

;; Select methods
(setq gnus-select-method
      '(nntp "news.gmane.org")
      gnus-secondary-select-methods
      '((nnml ""
              (nnir-search-engine notmuch))
        (nndiary "diary")
        (nntp "aioe"
              (nntp-address "nntp.aioe.org"))
	(nntp "mozilla"
	      (nntp-address "news.mozilla.org"))
	(nnimap "mozilla"
		(nnimap-address "mail.mozilla.com"))
        (nnimap "kanru"
                (nnimap-stream shell)
                (nnimap-shell-program "ssh kanru.info nc localhost imap")))
      mail-sources
      '((file :plugged t)))

;; Fetching by `Message-ID' Using the Registry
(setq gnus-refer-article-method
      '(current
        (nnregistry)
        (nnweb "gmane" (nnweb-type gmane))))

;; Enable gnus-topic-mode
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;; Archive
(setq gnus-message-archive-group "archive")

;; Alternative emails, rot13'ed
(setq message-alternative-emails
      (regexp-opt
       (mapcar #'rot13
               '("xnaeh@0kyno.bet"
                 "xbfgre@qrovna.bet"
                 "xbfgre@qrovna.bet.gj"
                 "xnaeh@xnaeh.vasb"
                 "xnaeh.96@fgh.pfvr.apah.rqh.gj"
                 "pxnaeh@tznvy.pbz"
                 "xpura@zbmvyyn.pbz")))
      message-dont-reply-to-names message-alternative-emails
      gnus-ignored-from-addresses message-alternative-emails)

;; Completion interface
(setq message-mail-alias-type 'abbrev)

;; Scoring
(setq gnus-home-score-file
      '("/home/kanru/News/home.SCORE"))
(add-hook 'message-sent-hook 'gnus-score-followup-thread)

;; Posting styles
(setq gnus-posting-styles
      `((".*"
         (signature-file "~/.signature"))
        ("^gmane\\.linux\\.debian.*"
         (signature nil)
         (address ,(rot13 "xbfgre@qrovna.bet")))
        ("\\\(nnimap\\\|nntp\\\)\\+mozilla.*"
         (signature nil)
         (address ,(rot13 "xpura@zbmvyyn.pbz")))
        ((header "List-Id" "0xlab.*googlegroups")
         (signature-file "~/.signature-0xlab")
         (address ,(rot13 "xnaeh@0kyno.bet"))))
      message-from-style 'angles)

;; Treatment
(setq gnus-inhibit-images t)

;; NNDiary
(add-hook 'gnus-select-group-hook 'gnus-group-set-timestamp)
(require 'gnus-diary)

;; Make button for the multipart
(setq gnus-buttonized-mime-types
      '("multipart/alternative" "multipart/signed")
      mm-discouraged-alternatives
      '("text/html" "image/.*"))

(setq gnus-default-article-saver 'gnus-summary-save-in-mail)
(add-hook 'gnus-summary-mode-hook 'hl-line-mode)
(add-hook 'gnus-group-mode-hook 'hl-line-mode)

(provide 'my-gnus)
