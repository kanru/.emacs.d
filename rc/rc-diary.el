;;; rc-diary.el --- Diary

;; Copyright (C) 2012  Kan-Ru Chen (陳侃如)

;; Author: Kan-Ru Chen (陳侃如) <kanru@kanru.info>
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

;; 

;;; Code:

(setq diary-file "~/zone1/etc/diary"
      diary-comment-start "/*"
      diary-comment-end "*/"
      calendar-mark-diary-entries-flag t
      calendar-mark-holidays-flag t
      calendar-chinese-all-holidays-flag t)

(add-hook 'diary-list-entries-hook 'diary-include-other-diary-files)
(add-hook 'diary-mark-entries-hook 'diary-mark-included-diary-files)
(add-hook 'diary-list-entries-hook 'diary-sort-entries t)

(setq holiday-taiwan-holidays
      '((holiday-fixed 02 28 "228 和平紀念日")
        (holiday-fixed 04 04 "婦幼節")
        (holiday-fixed 04 05 "清明節")
        (holiday-fixed 05 01 "勞動節")
        (holiday-fixed 06 06 "端午節")
        (holiday-fixed 10 10 "國慶日")))

(setq calendar-holidays (append holiday-general-holidays
                                holiday-local-holidays
                                holiday-other-holidays
                                holiday-taiwan-holidays))

(require 'appt)
(appt-activate 1)

(provide 'rc-diary)
;;; rc-diary.el ends here
