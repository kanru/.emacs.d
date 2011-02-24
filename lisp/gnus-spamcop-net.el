;;; gnus-spamcop-net.el --- SpamCop.net report package for Gnus

;; Copyright (C) 2011  Kan-Ru Chen

;; Author: Kan-Ru Chen <kanru@kanru.info>
;; Keywords: mail, tools

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

(require 'spam)

(defcustom spam-spamcop-net-program "reporter.pl"
  "SpamCop.net reporter help utility program."
  :type 'string
  :group 'spam)

(defun spam-report-spamcop-register-routine (articles)
  (dolist (article articles)
    (let ((article-string (spam-get-article-as-string article)))
      (when (stringp article-string)
        (with-temp-buffer
          (insert article-string)

          (apply 'call-process-region
                 (point-min) (point-max)
                 spam-spamcop-net-program
                 nil nil nil))))))

(spam-install-nocheck-backend 'spam-use-spamcop
                              nil
                              'spam-report-spamcop-register-routine
                              nil
                              nil)
(provide 'gnus-spamcop-net)
;;; gnus-spamcop-net.el ends here
