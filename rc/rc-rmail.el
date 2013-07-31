;;; rc-rmail.el --- RMAIL config

;; Copyright (C) 2013  Kan-Ru Chen (陳侃如)

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

;; Customization and utilities for the RMAIL package

;;; Code:

(require 'rmailsum)

;;; Default ignore all headers but some important ones
(setq rmail-ignored-headers ""
      rmail-nonignored-headers "^date:\\|^to:\\|^cc:\\|^from:\\|^subject:")

;;; Mails are archived to here
(setq rmail-secondary-file-directory "~/Mail"
      rmail-secondary-file-regexp ".")

(face-spec-set 'rmail-highlight '((t (:inherit nil :weight bold))) 'face-defface-spec)

(setq rmail-user-mail-address-regexp user-mail-address-regexp)

;;; Auto-file
(setq rmail-automatic-folder-directives
      '(("~/Mail/Geolocation"  "list-id" "dev-geolocation")
        ("~/Mail/Bugzilla"     "from"    "bugzilla-daemon@")
        ("~/Mail/B2G-internal" "list-id" "b2g-internal")
        ("~/Mail/Archive"      "to"      "kchen@mozilla.com")))

(add-hook 'rmail-show-message-hook 'visual-line-mode)
(add-hook 'rmail-show-message-hook 'goto-address-mode)

(require 'sendmail)
(defun rmail-strip-crlf-in-message ()
  "Remove trailing CRLF in some emails."
  (save-excursion
    (mail-text)
    (let ((inhibit-read-only t))
      (while (re-search-forward "\xd\n" nil t)
        (replace-match "\n")))))
(add-hook 'rmail-show-message-hook 'rmail-strip-crlf-in-message)

(require 'gnus-art)
(defun rmail-treat-date ()
  "Treat date header with Gnus-Art"
  (save-excursion
    (save-restriction
      (let ((inhibit-read-only t))
        (article-narrow-to-head)
        (gnus-article-save-original-date
         (article-date-combined-lapsed))))))
(add-hook 'rmail-show-message-hook 'rmail-treat-date)

;;; Press RET directly in the summary buffer will scroll the mail
;;; buffer up by one line just like in Gnus.
(defun rmail-summary-scroll-msg-up-or-goto-msg (&optional n)
  (interactive "p")
  (if current-prefix-arg
      (rmail-summary-goto-msg n)
    (rmail-summary-scroll-msg-up 1)))
(define-key rmail-summary-mode-map "\C-m" 'rmail-summary-scroll-msg-up-or-goto-msg)
(define-key rmail-summary-mode-map "<" 'rmail-summary-beginning-of-message)
(define-key rmail-summary-mode-map ">" 'rmail-summary-end-of-message)
(define-key rmail-summary-mode-map "=" 'delete-other-windows)
(define-key rmail-summary-mode-map "P" 'previous-line)
(define-key rmail-summary-mode-map "N" 'next-line)

(provide 'rc-rmail)
;;; rc-rmail.el ends here
