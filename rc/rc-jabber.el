;;; rc-jabber.el --- Jabber

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

;; Jabber mode and some utilities

;;; Code:

(defun k-display-jabber-chat-window ()
  (interactive)
  (let* ((target-buffer (find-if (lambda (buffer-name)
                                   (string-match "\\<\*-jabber-chat" buffer-name))
                                 (buffer-list) :key #'buffer-name))
         (target-window (get-buffer-window target-buffer)))
    (if target-window
        (when (cdr (window-list))
          ;; Not the last window
          (delete-window target-window)
          (bury-buffer target-buffer))
      (when target-buffer
        (let ((window (split-window-below -10)))
          (select-window window)
          (switch-to-buffer target-buffer))))))

;;; hide jabber buffer from normal operation
(setq jabber-chat-buffer-format " *-jabber-chat-%n-*")
;;; Disable avatar
(setq jabber-roster-line-format " %c %-25n %u %-8s  %S"
      jabber-chat-buffer-show-avatar nil
      jabber-alert-presence-hooks nil)

(global-set-key [f6] 'k-display-jabber-chat-window)

(provide 'rc-jabber)
;;; rc-jabber.el ends here
