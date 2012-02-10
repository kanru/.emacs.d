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

(defun shortcut-query (url term)
  (browse-url (replace-regexp-in-string "%s" (url-hexify-string term) url)))

(defmacro define-shortcut (name url)
  `(defun ,name (term)
     ,(concat "Lookup TERM on " (symbol-name name) "
Use url " url)
     (interactive (list (read-string "Lookup: " (thing-at-point 'symbol))))
     (shortcut-query ,url term)))

(define-shortcut bugzilla
  "http://bugzilla.mozilla.org/%s")

(define-shortcut mxr
  "https://mxr.mozilla.org/mozilla-central/search?string=%s")

(define-shortcut mdn
  "https://developer.mozilla.org/search?q=%s")

(define-shortcut vlasi
  "http://vlasisku.lojban.org/vlasisku/%s")

(provide 'rc-shortcuts)
;;; rc-shortcuts.el ends here
