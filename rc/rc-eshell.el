;;; rc-eshell.el --- Emacs Shell Config

;; Copyright (C) 2011  Earth, Solar System, Milky Way Galaxy

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

;; 

;;; Code:

(require 'esh-mode)

(setq eshell-directory-name (locate-user-emacs-file "eshell")
      eshell-ls-exclude-regexp "^\\(:2e\\|__MACOSX\\)"
      eshell-visual-subcommands '(("git" "log" "diff" "show")))

(defun eshell/clear ()
  "Clears the shell buffer ala Unix's clear or DOS' cls"
  (interactive)
  ;; the shell prompts are read-only, so clear that for the duration
  (let ((inhibit-read-only t))
    ;; simply delete the region
    (delete-region (point-min) (point-max))))

(defun eshell/.. (&optional level)
  "Go up LEVEL directories"
  (interactive)
  (let ((level (or level 1)))
    (eshell/cd (make-string (1+ level) ?.))
    (eshell/ls)))

(provide 'rc-eshell)
;;; rc-eshell.el ends here
