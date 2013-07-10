;;; rc-shortcuts.el --- Shortcut commands

;; Copyright (C) 2012  Kan-Ru Chen

;; Author: Kan-Ru Chen <kanru@kanru.info>
;; Keywords: convenience

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

;; Define shortcut commands for quickly open/search something on the web.

;;; Code:

(require 'thingatpt)
(require 'url-util)

(defun forward-number (&optional n)
  "Move N numbers forward (backward if N is negative)."
  (interactive "p")
  (let ((direction (if (natnump n) 'forward 'backward))
        (times (abs n)))
    (case direction
      (forward (re-search-forward "[[:digit:]]+" nil t times))
      (backward (re-search-backward "[^[:digit:]][[:digit:]]" nil t times)
                (goto-char (1+ (match-beginning 0)))))))

(defun beginning-of-number ()
  "Move point to beginning of a number."
  (interactive)
  (forward-number -1))

(defun end-of-number ()
  "Move point to end of a number."
  (interactive)
  (forward-number 1))

(put 'number 'forward-op 'forward-number)
(put 'number 'beginning-op 'beginning-of-number)
(put 'number 'end-op 'end-of-number)

(defun shortcut-query (url term)
  (browse-url (replace-regexp-in-string "%s" (url-hexify-string term) url)))

(defmacro define-shortcut (name url &optional thing)
  `(defun ,name (term)
     ,(concat "Lookup TERM on " (symbol-name name) "
Use url " url)
     (interactive (list (read-string "Lookup: " (let ((bounds (bounds-of-thing-at-point ,(or thing ''symbol))))
                                                  (when bounds
                                                    (buffer-substring-no-properties
                                                     (car bounds) (cdr bounds)))))))
     (shortcut-query ,url term)))

(define-shortcut bugzilla
  "https://bugzilla.mozilla.org/buglist.cgi?quicksearch=%s"
  'number)

(define-shortcut mxr
  "https://mxr.mozilla.org/mozilla-central/search?string=%s")

(define-shortcut dxr
  "http://dxr.mozilla.org/mozilla-central/search?q=%s")

(define-shortcut mdn
  "https://developer.mozilla.org/search?q=%s")

(define-shortcut vlasi
  "http://vlasisku.lojban.org/vlasisku/%s")

(define-shortcut ddg
  "http://duckduckgo.com/?q=%s")

(provide 'rc-shortcuts)
;;; rc-shortcuts.el ends here
