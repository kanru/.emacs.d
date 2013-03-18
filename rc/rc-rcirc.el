;;; rc-rcirc.el --- rcirc config

;; Copyright (C) 2012  Kan-Ru Chen

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

(add-hook 'rcirc-mode-hook 'rcirc-omit-mode)

(rcirc-track-minor-mode 1)
(setq rcirc-fill-column 80
      rcirc-buffer-maximum-lines 2000
      rcirc-server-alist '(("irc.freenode.net"
                            :port 6697
                            :encryption tls
                            :channels ("#lisp"
                                       "#hime"
                                       "#lojban"
                                       "#emacs"
                                       "#emacs.tw"
                                       "#cschat.tw"
                                       "#haskell.tw"
                                       "#sbcl"
                                       "#python.tw"
                                       "#pushisland"
                                       "#g0v.tw"))
                           ("irc.debian.org"
                            :port 6697
                            :encryption tls
                            :channels ("#dot"
                                       "#debian-devel"
                                       "#debian-www"))
                           ("concrete.mozilla.org"
                            :port 6697
                            :encryption tls
                            :channels ("#b2g"
                                       "#gaia"
                                       "#developers"
                                       "#gfx"
                                       "#media"
                                       "#content"
                                       "#auckland"
                                       "#mozilla-taiwan")))
      rcirc-keywords '("kanru"
                       "urnak")
      rcirc-default-nick "kanru"
      rcirc-default-user-name "kanru"
      rcirc-default-full-name "Kan-Ru Chen")

(defadvice rcirc (before rcirc-cache-authinfo activate)
  "Read authinfo from `auth-sources' via the auth-source API."
  (auth-source-search :port '("irc-nickserv")
                      :require '(:user :secret)))

(defadvice rcirc-authenticate (around rcirc-read-from-authinfo activate)
  "Allow rcirc to read authinfo from `auth-sources' via the auth-source API."
  (let ((rcirc-authinfo rcirc-authinfo)
        (credentials (auth-source-search :port '("irc-nickserv")
                                         :require '(:user :secret))))
    (dolist (p credentials)
      (let ((host (plist-get p :host))
            (user (plist-get p :user))
            (secret (plist-get p :secret)))
        (add-to-list 'rcirc-authinfo
                     (list host 'nickserv user
                           (if (functionp secret)
                               (funcall secret)
                             secret)))))
    ad-do-it))

(defadvice rcirc-record-activity (around rcirc-dont-record-normal-activity)
  "Don't record normal activity of buffers"
  (when (member type '(nick keyword))
    ad-do-it))

(defvar rcirc-ignore-all-buffer-activity-flag nil)
(defun rcirc-toggle-ignore-all-buffer-activity ()
  "Toggle whether to ignore normal conversations."
  (interactive)
  (setq rcirc-ignore-all-buffer-activity-flag
        (not rcirc-ignore-all-buffer-activity-flag))
  (if rcirc-ignore-all-buffer-activity-flag
      (ad-activate 'rcirc-record-activity)
    (ad-deactivate 'rcirc-record-activity)))

(require 'shr-color nil t)
(when (featurep 'shr-color)
  (defvar rcirc-colors
    (let ((bg (face-background 'default))
          (fg (face-foreground 'rcirc-my-nick))
          (shr-color-visible-luminance-min 80)
          candidates)
      (dolist (item color-name-rgb-alist)
        (let ((color (car item)))
          (when (not (color-gray-p color))
            (let ((new-color (cadr (shr-color-visible bg color t))))
              (setq candidates (cons new-color candidates))))))
      candidates)
    "Colors to use for nicks in rcirc.
By default, all the non-grey colors that are very different from
the default background are candidates.

To check out the list, evaluate (list-colors-display rcirc-colors)."))
(require 'rcirc-color nil t)
(require 'rcirc-controls nil t)

(provide 'rc-rcirc)
;;; rc-rcirc.el ends here
