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
      rcirc-buffer-maximum-lines 4000
      rcirc-server-alist '(("irc.freenode.net" :channels ("#lisp"
                                                          "#hime"
                                                          "#lojban"
                                                          "#emacs"
                                                          "#emacs.tw"
                                                          "#sbcl"
                                                          "#python.tw"
                                                          "#pushisland"))
                           ("irc.debian.org" :channels ("#dot"
                                                        "#debian-devel"))
                           ("irc.mozilla.org" :channels ("#b2g"
                                                         "#developers"
                                                         "#gfx"
                                                         "#content"
                                                         "#mozilla-taiwan")))
      rcirc-keywords '("kanru"
                       "urnak"))

(defadvice rcirc (around rcirc-read-from-authinfo activate)
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

(provide 'rc-rcirc)
;;; rc-rcirc.el ends here
