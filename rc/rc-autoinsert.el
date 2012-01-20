;;; rc-autoinsert.el

(require 'autoinsert)

(add-hook 'find-file-hooks 'auto-insert)
(setq auto-insert-directory (locate-user-emacs-file "insert"))
(setq auto-insert 'other)
(setq auto-insert-query nil)

(define-auto-insert 'java-mode ["default.java" (lambda () (goto-char (point-max)))])
(define-auto-insert 'python-mode ["default.py" (lambda () (goto-char (point-max)))])

(add-to-list 'auto-insert-alist
	     '(("\\.lisp\\'" . "Lisp header")
     "Short description: "
     ";;;; " (file-name-nondirectory (buffer-file-name)) " --- " str "

;;; Copyright (C) " (substring (current-time-string) -4) "  "
 (getenv "ORGANIZATION") | (progn user-full-name) "

;;; Author: " (user-full-name)
'(if (search-backward "&" (line-beginning-position) t)
     (replace-match (capitalize (user-login-name)) t t))
'(end-of-line 1) " <" (progn user-mail-address) ">

\;;; This program is free software; you can redistribute it and/or modify
\;;; it under the terms of the GNU General Public License as published by
\;;; the Free Software Foundation, either version 3 of the License, or
\;;; (at your option) any later version.

\;;; This program is distributed in the hope that it will be useful,
\;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
\;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
\;;; GNU General Public License for more details.

\;;; You should have received a copy of the GNU General Public License
\;;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

\;;;; Commentary:

\;;; " _ "

\;;;; Code:




\;;; " (file-name-nondirectory (buffer-file-name)) " ends here

\;;; Local Variables:
\;;; mode: lisp
\;;; End:\n"))


(provide 'rc-autoinsert)
;;; rc-autoinsert.el ends here
