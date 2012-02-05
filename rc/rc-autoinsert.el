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

;;; Author(s): " (user-full-name)
'(if (search-backward "&" (line-beginning-position) t)
     (replace-match (capitalize (user-login-name)) t t))
'(end-of-line 1) " <" (progn user-mail-address) ">

\;;; Permission is hereby granted, free of charge, to any person obtaining a copy of
\;;; this software and associated documentation files (the \"Software\"), to deal in
\;;; the Software without restriction, including without limitation the rights to
\;;; use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
\;;; of the Software, and to permit persons to whom the Software is furnished to do
\;;; so, subject to the following conditions:

\;;; The above copyright notice and this permission notice shall be included in all
\;;; copies or substantial portions of the Software.

\;;; THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
\;;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
\;;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
\;;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
\;;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
\;;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
\;;; SOFTWARE.

\;;;; Commentary:

\;;; " _ "

\;;;; Code:




\;;; " (file-name-nondirectory (buffer-file-name)) " ends here

\;;; Local Variables:
\;;; mode: lisp
\;;; End:\n"))


(provide 'rc-autoinsert)
;;; rc-autoinsert.el ends here
