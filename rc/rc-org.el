;;; rc-org.el --- OrgMode Settings                   -*- lexical-binding: t; -*-

;; Copyright (C) 2014  Kan-Ru Chen (陳侃如)

;; Author: Kan-Ru Chen (陳侃如)
;; Keywords: 

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Reference: http://doc.norang.ca/org-mode.html

;;; Code:

(require 'org)
(require 'org-checklist nil t)

(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\)$" . org-mode))

;;; Standard key bindings
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-agenda-files '("~/r/org"))

;;; TODO keywords
(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
        (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "MEETING")))

(setq org-todo-keyword-faces
      '(("TODO" :foreground "#dc322f" :weight bold)
        ("NEXT" :foreground "#268bd2" :weight bold)
        ("DONE" :foreground "#859900" :weight bold)
        ("WAITING" :foreground "#cb4b16" :weight bold)
        ("HOLD" :foreground "#d33682" :weight bold)
        ("CANCELLED" :foreground "#859900" :weight bold)
        ("MEETING" :foreground "#859900" :weight bold)))

(setq org-use-fast-todo-selection t
      org-treat-S-cursor-todo-selection-as-state-change nil)

(setq org-todo-state-tags-triggers
      '(("CANCELLED" ("CANCELLED" . t))
        ("WAITING" ("WAITING" . t))
        ("HOLD" ("WAITING") ("HOLD" . t))
        (done ("WAITING") ("HOLD"))
        ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
        ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
        ("DONE" ("WAITING") ("CANCELLED") ("HOLD"))))

(setq org-directory "~/r/org")
(setq org-default-notes-file "~/r/org/refile.org")

;;; Capture templates for: TODO tasks, notes, appointments, meetings
(setq org-capture-templates
      '(("t" "todo" entry (file "~/r/org/refile.org")
         "* TODO %?\n%U\n%a\n"
         :clock-in t :clock-resume t)
        ("r" "respond" entry (file "~/r/org/refile.org")
         "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n"
         :clock-in t :clock-resume t :immediate-finish t)
        ("n" "note" entry (file "~/r/org/refile.org")
         "* %? :NOTE:\n%U\n%a\n"
         :clock-in t :clock-resume t)
        ("j" "journal" entry (file+datetree "~/r/org/diary.org")
         "* %?\n%U\n"
         :clock-in t :clock-resume t)
        ("w" "review" entry (file "~/r/org/refile.org")
         "* TODO Review %c\n%U\n"
         :clock-in t :clock-resume t :immediate-finish t)
        ("m" "meeting" entry (file "~/r/org/refile.org")
         "* MEETING with %? :MEETING:\n%U"
         :clock-in t :clock-resume t)))

;;; Refile configuration
;; Targets include this file and any file contributing to the agenda -
;; up to 9 levels deep
(setq org-refile-targets '((nil :maxlevel . 9)
                           (org-agenda-files :maxlevel . 9)))

;; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)

;; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)

;; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes 'confirm)

;;; Agenda setup
;; Do not dim blocked tasks
(setq org-agenda-dim-blocked-tasks nil)

;; Compact the block agenda view
(setq org-agenda-compact-blocks t)

;; Custom agenda command definitions
(setq org-agenda-custom-commands
      '(("N" "Notes" tags "NOTE"
         ((org-agenda-overriding-header "Notes")
          (org-tags-match-list-sublevels t)))
        (" " "Agenda"
         ((agenda "" nil)
          (tags "REFILE"
                ((org-agenda-overriding-header "Tasks to Refile")
                 (org-tags-match-list-sublevels nil)))
          (tags-todo "-CANCELLED/!NEXT"
                     ((org-agenda-overriding-header "Project Next Tasks")
                      (org-tags-match-list-sublevels t)
                      (org-agenda-sorting-strategy
                       '(todo-state-down effort-up category-keep))))
          (tags-todo "-CANCELLED+WAITING|HOLD/!"
                     ((org-agenda-overriding-header "Waiting and Holding Tasks")
                      (org-tags-match-list-sublevels nil)))
          (tags "+PROJECT/DONE"
                ((org-agenda-overriding-header "Tasks to Archive")
                 (org-tags-match-list-sublevels nil))))
         nil)))

(setq org-stuck-projects
      '("+PROJECT/-DONE-MAYBE" ("NEXT") nil "IGNORE"))

(setq org-agenda-include-diary t)

;;; Clock setup

;; Resume clocking task when emacs is restarted
(org-clock-persistence-insinuate)

;; Change tasks to NEXT when clocking in
(setq org-clock-in-switch-to-state "NEXT")

;; Save clock data and state changes and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)

;; This removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)

;; Clock out when moving task to a done state
(setq org-clock-out-when-done t)

;; Save the running clock and all clock history when exiting Emacs,
;; load it on startup
(setq org-clock-persist t)

;; Do not prompt to resume an active clock
(setq org-clock-persist-query-resume nil)

;; Enable auto clock resolution for finding open clocks
(setq org-clock-auto-clock-resolution 'when-no-clock-is-running)

;; Include current clocking task in clock reports
(setq org-clock-report-include-clocking-task t)

;; Agenda clock report parameters
(setq org-agenda-clockreport-parameter-plist
      '(:link t :maxlevel 5 :fileskip0 t :compact t :narrow 80))

;; Set default column view headings: Task Effort Clock_Summary
(setq org-columns-default-format
      "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")

;; global Effort estimate values
(setq org-global-properties
      '(("Effort_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")))

(setq org-agenda-log-mode-items '(closed state))

;; Tags with fast selection keys
(setq org-tag-alist '((:startgroup)
                      ("@office" . ?o)
                      ("@home" . ?H)
                      (:endgroup)
                      ("WAITING" . ?w)
                      ("HOLD" . ?h)
                      ("PERSONAL" . ?P)
                      ("WORK" . ?W)
                      ("NOTE" . ?n)
                      ("CANCELLED" . ?c)
                      ("FLAGGED" . ??)))

;; Allow setting single tags without the menu
(setq org-fast-tag-selection-single-key 'expert)

;; For tag searches ignore tasks with scheduled and deadline dates
(setq org-agenda-tags-todo-honor-ignore-options t)

(setq org-agenda-span 'day)

;;; Archive setup
(setq org-archive-mark-done nil)
(setq org-archive-location "%s_archive::* Archived Tasks")

(add-hook 'org-finalize-agenda-hook 'org-agenda-to-appt)
(org-agenda-to-appt)

(setq org-link-abbrev-alist
      '(("debbugs"  . "http://bugs.debian.org/%s")
        ("google"   . "https://www.google.com/search?q=")
        ("ddg"      . "https://duckduckgo.com/?q=")
        ("gmap"     . "http://maps.google.com/maps?q=%s")
        ("omap"     . "http://nominatim.openstreetmap.org/search?q=%s&polygon=1")
        ("bugzilla" . "http://bugzilla.mozilla.org/%s")))

(provide 'rc-org)
;; rc-org.el ends here
