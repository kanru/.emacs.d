;;; webwml-mode.el --- mode for edting website meta language templates

;; Copyright (C) 2010 Kan-Ru Chen

;; Author: Kan-Ru Chen <koster@debian.org>
;; Created: 17 Oct 2010
;; Keywords: languages, files

;; This file is NOT part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
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
(require 'nxml-mode)

(defvar webwml-font-lock-keywords
  '(("\\(?:^#use[[:blank:]]+wml::[[:word:]]+\\(?:::[[:word:]]+\\)*\\)"
     0 font-lock-preprocessor-face))
  "Additional font lock keywords for webwml mode.")

(define-derived-mode webwml-mode nxml-mode "WML"
  "Major mode for editing Website META Language templates."
  (setq comment-start "#")
  (setq comment-start-skip "#\\W*")
  (font-lock-add-keywords nil webwml-font-lock-keywords)
  )

(add-to-list 'auto-mode-alist '("\\.wml" . webwml-mode))

(provide 'webwml-mode)
;;; webwml-mode.el ends here
