;;; rc-generic-x.el --- Generic Modes

;; Copyright (C) 2012  Kan-Ru Chen

;; Author: Kan-Ru Chen <kanru@kanru.info>
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

;; Since Emacs 24.3
;; ** `javascript-generic-mode' is now an obsolete alias for `js-mode'.

;;; Code:

(require 'generic-x)
(require 'cl-lib nil t)
(when (not (featurep 'cl-lib))
  (require 'cl)
  (defalias 'cl-remove-if 'remove-if))

(when (or (< emacs-major-version 24)
          (and (= emacs-major-version 24)
               (< emacs-minor-version 3)))
  (setq generic-extras-enable-list
        (remove 'javascript-generic-mode generic-extras-enable-list)
        generic-default-modes
        (remove 'javascript-generic-mode generic-default-modes))

  ;; hack! Remove javascript-generic-mode
  (setq auto-mode-alist
        (cl-remove-if (lambda (obj)
                        (eq (cdr obj) 'javascript-generic-mode))
                      auto-mode-alist)))

(provide 'rc-generic-x)
;;; rc-generic-x.el ends here
