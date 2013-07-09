;;; rc-lisp.el --- Lisp Mode Config

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

(define-key read-expression-map (kbd "TAB") 'completion-at-point)
(define-key lisp-mode-shared-map (kbd "C-c l") "lambda")
(define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)
(define-key lisp-mode-shared-map (kbd "C-\\") 'completion-at-point)
(define-key lisp-mode-shared-map (kbd "C-c v") 'eval-buffer)

(defface esk-paren-face
   '((((class color) (background dark))
      (:foreground "grey50"))
     (((class color) (background light))
      (:foreground "grey55")))
   "Face used to dim parentheses."
   :group 'starter-kit-faces)

;;; Emacs Lisp

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'esk-remove-elc-on-save)

(defun esk-remove-elc-on-save ()
  "If you're saving an elisp file, likely the .elc is no longer valid."
  (make-local-variable 'after-save-hook)
  (add-hook 'after-save-hook
            (lambda ()
              (if (file-exists-p (concat buffer-file-name "c"))
                  (delete-file (concat buffer-file-name "c"))))))

(define-key emacs-lisp-mode-map (kbd "M-.") 'find-function-at-point)

;;; Enhance Lisp Modes

(eval-after-load 'paredit
  ;; need a binding that works in the terminal
  '(define-key paredit-mode-map (kbd "M-)") 'paredit-forward-slurp-sexp))

(dolist (x '(scheme emacs-lisp lisp clojure))
  (when window-system
    (font-lock-add-keywords
     (intern (concat (symbol-name x) "-mode"))
     '(("(\\|)" . 'esk-paren-face))))
  (when (fboundp 'paredit-mode)
    (add-hook
     (intern (concat (symbol-name x) "-mode-hook")) 'paredit-mode)))

(provide 'rc-lisp)
;;; rc-lisp.el ends here
