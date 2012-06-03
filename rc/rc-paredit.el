;;; rc-paredit.el --- Paredit

;; Copyright (C) 2012  Kan-Ru Chen

;; Author: Kan-Ru Chen <kanru@isil.kanru.info>
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


;; copied from http://mumble.net/~campbell/emacs/paredit.release
(defvar common-lisp-octothorpe-quotation-characters '(?P))
(defvar common-lisp-octothorpe-parameter-parenthesis-characters '(?A))
(defvar common-lisp-octothorpe-parenthesis-characters '(?+ ?- ?C))

(defun paredit-space-for-delimiter-predicate-common-lisp (endp delimiter)
  (or endp
      (let ((case-fold-search t)
            (look
             (lambda (prefix characters n)
               (looking-back
                (concat prefix (regexp-opt (mapcar 'string characters)))
                (min n (point))))))
        (let ((oq common-lisp-octothorpe-quotation-characters)
              (op common-lisp-octothorpe-parenthesis-characters)
              (opp common-lisp-octothorpe-parameter-parenthesis-characters))
          (cond ((eq (char-syntax delimiter) ?\()
                 (and (not (funcall look "#" op 2))
                      (not (funcall look "#[0-9]*" opp 20))))
                ((eq (char-syntax delimiter) ?\")
                 (not (funcall look "#" oq 2)))
                (else t))))))

(add-hook 'common-lisp-mode-hook
          (defun common-lisp-mode-hook-paredit ()
            (make-local-variable 'paredit-space-for-delimiter-predicates)
            (add-to-list 'paredit-space-for-delimiter-predicates
                         'paredit-space-for-delimiter-predicate-common-lisp)))

(provide 'rc-paredit)
;;; rc-paredit.el ends here
