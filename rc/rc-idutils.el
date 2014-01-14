;;; rc-idutils.el --- ID-utils                       -*- lexical-binding: t; -*-

;; Copyright (C) 2013  Kan-Ru Chen (陳侃如)

;; Author: Kan-Ru Chen (陳侃如) <kchen@mozilla.com>
;; Keywords: tools

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

;; Interactive commands to query the ID database

;;; Code:

(require 'compile)

(defun gid (term)
  (interactive
   (let* ((bounds (bounds-of-thing-at-point 'symbol))
          (thing (when bounds
                   (buffer-substring-no-properties
                    (car bounds) (cdr bounds)))))
     (list (read-string "Lookup: " thing))))
  (compile (format "gid %s" term)))

(provide 'rc-idutils)
;;; rc-idutils.el ends here
