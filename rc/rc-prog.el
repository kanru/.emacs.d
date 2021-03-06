;;; rc-prog.el --- Prog Mode

;; Copyright (C) 2012  Kan-Ru Chen (陳侃如)

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

;;

;;; Code:

(defun local-column-number-mode ()
  (make-local-variable 'column-number-mode)
  (column-number-mode t))

(defun turn-on-save-place-mode ()
  (setq save-place t))

(defun add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\|XXX\\)\\>"
          1 font-lock-warning-face t))))

(require 'column-enforce-mode nil t)
(defun turn-on-column-enforce-mode ()
  (when (featurep 'column-enforce-mode)
    (column-enforce-n 80)))

(which-function-mode 1)

(add-hook 'prog-mode-hook 'local-column-number-mode)
(add-hook 'prog-mode-hook 'turn-on-save-place-mode)
(add-hook 'prog-mode-hook 'add-watchwords)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'prog-mode-hook 'turn-on-column-enforce-mode)
  
(provide 'rc-prog)
;;; rc-prog.el ends here
