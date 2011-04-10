;;; rc-org.el -- OrgMode Settings

(add-to-list 'load-path "~/src/mirror/org-mode/lisp")
(add-to-list 'load-path "~/src/mirror/org-mode/contrib/lisp")

(require 'org)
(require 'org-checklist nil t)
(require 'org-contacts nil t)

(setq org-directory "~/org"
      diary-file "~/etc/diary"
      ;org-agenda-include-diary t
      mark-diary-entries-in-calendar t
      org-default-notes-file "journal.org"
      org-log-done 'time
      org-log-into-drawer "LOGBOOK"
      org-clock-into-drawer "CLOCK"
      ;org-clock-idle-time 30
      org-refile-targets
      '(("newgtd.org" :maxlevel . 1)
        ("someday.org" :level . 2))
      org-agenda-custom-commands
      '(("p" . "Projects")
        ("pp" "All Projects"
         ((tags "PROJECT")))
        ("ph" "Home Projects"
         ((tags "PROJECT+HOME")))
        ("po" "Office Projects"
         ((tags "PROJECT+OFFICE")))
        ("h" "Office and Home Lists"
         ((agenda)
          (tags-todo "OFFICE")
          (tags-todo "HOME")
          (tags-todo "DEBIAN")
          (tags-todo "READING")))
        ("d" "Daily Action List"
         ((agenda "" ((org-agenda-ndays 1)
                      (org-agenda-sorting-strategy
                       '((agenda time-up priority-down tag-up)))
                      (org-deadline-warning-days 0))))))
      org-capture-templates
      '(("u" "TODO: Read this URL" entry (file+datetree "reading.org")
         "* UNREAD %(format-time-string \"%H:%M\") [[%^{URL}][%^{Description}]]"
         :immediate-finish t)
        ("r" "GTD: Reply this mail" entry (file+headline "newgtd.org" "Tasks")
         "* TODO Reply mail from %:fromname %^g\n  %a")
        ("t" "GTD: New task" entry (file+headline "newgtd.org" "Tasks")
         "* TODO %^{Brief Description} %^g\n  %?")
        ("p" "GTD: New project" entry (file+headline "newgtd.org" "Projects")
         "* %^{Brief Description}")
        ("i" "GTD: In-Basket" entry (file+headline "newgtd.org" "In-Basket")
         "* %^{Brief Description}")
        ("c" "Contacts" entry (file "contacts.org")
         "* %(org-contacts-template-name)
  :PROPERTIES:
  :EMAIL:    %(org-contacts-template-email)
  :END:"))
      org-link-abbrev-alist
      '(("debbugs"  . "http://bugs.debian.org/%s")
        ("google"   . "https://www.google.com/search?q=")
        ("duckgo"   . "https://duckduckgo.com/?q=")
        ("gmap"     . "http://maps.google.com/maps?q=%s")
        ("omap"     . "http://nominatim.openstreetmap.org/search?q=%s&polygon=1")))

(setq org-contacts-files '("~/org/contacts.org"))

(provide 'rc-org)
;; rc-org.el ends here
