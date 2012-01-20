;;; rc-bbdb.el -- BBDB Settings

(add-to-list 'load-path (expand-file-name "~/src/mirror/emacs/bbdb3/lisp"))
(require 'bbdb-autoloads nil t)
(require 'bbdb nil t)

(eval-after-load 'bbdb
  '(progn
     (bbdb-initialize 'gnus 'message)
     (add-hook 'bbdb-notice-hook 'bbdb-auto-notes-hook)))

(setq bbdb-file (locate-user-emacs-file "bbdb.el") ;; keep ~/ clean; set before loading
      bbdb-offer-save 1                            ;; 1 means save-without-asking
      bbdb-use-pop-up 'horizontal                  ;; allow popups for addresses
      bbdb-electric-p t                            ;; be disposable with SPC
      bbdb-pop-up-target-lines 1                   ;; very small
      bbdb-dwim-net-address-allow-redundancy t     ;; always use full name
      bbdb-quiet-about-name-mismatches 2           ;; show name-mismatches 2 secs
      bbdb-always-add-addresses nil                ;; add new addresses to existing...
                                                   ;; ...contacts automatically
      bbdb-canonicalize-redundant-nets-p t         ;; x@foo.bar.cx => x@bar.cx
      bbdb-completion-type nil                     ;; complete on anything
      bbdb-complete-name-allow-cycling t           ;; cycle through matches
                                                   ;; this only works partially
      bbdb-message-caching-enabled t               ;; be fast
      bbdb-use-alternate-names t                   ;; use AKA
      bbdb/mail-auto-create-p nil
      bbdb/news-auto-create-p nil
      bbdb-ignore-some-messages-alist ;; don't ask about fake addresses
      ;; NOTE: there can be only one entry per header (such as To, From)
      ;; http://flex.ee.uec.ac.jp/texi/bbdb/bbdb_11.html
      '(("From" . "no.?reply\\|DAEMON\\|daemon\\|facebookmail\\|twitter\\|root\\|bugs")
        ("CC" . "bugs")
        ("List-Id" . ".*"))
      bbdb-auto-notes-alist '(("User-Agent" (".*$" MUA 0))
                              ("X-Mailer"   (".*$" MUA 0))
                              ("List-Id"    (".*$" Mailing-List 0))))

(provide 'rc-bbdb)
;; rc-bbdb.el ends here
