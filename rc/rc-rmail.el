;;; rc-rmail.el --- RMAIL config

;; Copyright (C) 2013  Kan-Ru Chen (陳侃如)

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

;; Customization and utilities for the RMAIL package

;;; Code:

(require 'rmailsum)

;;; Default composing style
(setq message-from-style 'angles
      mail-from-style    'angles)

;;; Default ignore all headers but some important ones
(setq rmail-ignored-headers ""
      rmail-nonignored-headers "^date:\\|^to:\\|^cc:\\|^from:\\|^subject:")

;;; Mails are archived to here
(setq rmail-secondary-file-directory "~/Mail")

(face-spec-set 'rmail-highlight '((t (:inherit nil :weight bold))) 'face-defface-spec)

;;; Press RET directly in the summary buffer will scroll the mail
;;; buffer up by one line just like in Gnus.
(defun rmail-summary-scroll-msg-up-or-goto-msg (&optional n)
  (interactive "p")
  (if current-prefix-arg
      (rmail-summary-goto-msg n)
    (rmail-summary-scroll-msg-up 1)))
(define-key rmail-summary-mode-map "\C-m" 'rmail-summary-scroll-msg-up-or-goto-msg)

(provide 'rc-rmail)
;;; rc-rmail.el ends here
