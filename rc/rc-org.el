;;; rc-org.el -- OrgMode Settings

(require 'org)
(require 'org-checklist nil t)

(let ((quest-file (format-time-string "~/git/personal/org/quests/%Y.org")))
  (setq org-directory "~/git/personal/org"
        org-default-notes-file quest-file
        org-agenda-files (list quest-file)
        org-agenda-custom-commands
        '(("d" "Daily Action List"
           ((agenda "" ((org-agenda-ndays 1)
                        (org-agenda-sorting-strategy
                         '((agenda time-up priority-down tag-up)))
                        (org-deadline-warning-days 0))))))
        org-log-done 'time
        org-log-into-drawer t
        org-capture-templates
        `(("r" "Reply this mail" entry
           (file+olp ,quest-file "Quests" "Miscellaneous")
           "*** TODO Reply mail from %:fromname\n         %a")
          ("n" "New misc quest" entry
           (file+olp ,quest-file "Quests" "Miscellaneous")
           "*** TODO %?")
          ("m" "New main quest" entry
           (file+headline ,quest-file "Quests")
           "** %?"))
        org-link-abbrev-alist
        '(("debbugs"  . "http://bugs.debian.org/%s")
          ("google"   . "https://www.google.com/search?q=")
          ("duckgo"   . "https://duckduckgo.com/?q=")
          ("gmap"     . "http://maps.google.com/maps?q=%s")
          ("omap"     . "http://nominatim.openstreetmap.org/search?q=%s&polygon=1")
          ("bugzilla" . "http://bugzilla.mozilla.org/%s"))))

(setq org-latex-to-pdf-process
      '("xelatex -interaction nonstopmode -output-directory %o %f"
	"xelatex -interaction nonstopmode -output-directory %o %f"
	"xelatex -interaction nonstopmode -output-directory %o %f"))

(provide 'rc-org)
;; rc-org.el ends here
