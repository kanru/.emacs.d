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

(require 'rcirc)

(add-hook 'rcirc-mode-hook 'rcirc-omit-mode)

(rcirc-track-minor-mode 1)
(setq rcirc-fill-column 80
      rcirc-buffer-maximum-lines 2000
      rcirc-keywords '("kanru"
                       "urnak")
      rcirc-default-nick "kanru"
      rcirc-default-user-name "kanru"
      rcirc-default-full-name "Kan-Ru Chen")

(add-to-list 'rcirc-server-alist
             '("irc.freenode.net"
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
                          "#g0v.tw")))

(add-to-list 'rcirc-server-alist
             '("irc.debian.org"
               :port 6697
               :encryption tls
               :channels ("#dot"
                          "#debian-devel"
                          "#debian-www")))

(add-to-list 'rcirc-server-alist
             '("concrete.mozilla.org"
               :port 6697
               :encryption tls
               :channels ("#b2g"
                          "#gaia"
                          "#developers"
                          "#gfx"
                          "#layout"
                          "#media"
                          "#content"
                          "#geo"
                          "#auckland"
                          "#toronto"
                          "#servo"
                          "#mozilla-taiwan")))

(add-to-list 'rcirc-server-alist
             '("irc.w3.org"
               :port 6665
               :channels ("#chairs"
                          "#w3c"
                          "#sysreq"
                          "#geolocation")))

(defun rcirc--cache-authinfo (arg)
  "Read authinfo from `auth-sources' via the auth-source API."
  (auth-source-search :port '("irc-nickserv")
                      :require '(:user :secret)))

(defun rcirc--authenticate-using-authinfo (next-method &rest args)
  "Allow rcirc to read authinfo from `auth-sources' via the auth-source API."
  (let ((rcirc-authinfo rcirc-authinfo)
        (credentials (auth-source-search :port '("irc-nickserv")
                                         :require '(:user :secret))))
    (dolist (p credentials)
      (let ((host (plist-get p :host))
            (user (plist-get p :user))
            (secret (plist-get p :secret)))
        (let ((real-secret (if (functionp secret) (funcall secret) secret)))
          (add-to-list 'rcirc-authinfo (list host 'nickserv user real-secret)))))
    (apply next-method args)))

(defvar rcirc-ignore-all-buffer-activity nil
  "Whether to ignore normal conversations.")

(defun rcirc-toggle-ignore-all-buffer-activity ()
  "Toggle whether to ignore normal conversations."
  (interactive)
  (setq rcirc-ignore-all-buffer-activity
        (not rcirc-ignore-all-buffer-activity)))

(defun rcirc--filter-normal-buffer-activity (next-method buffer &optional type)
  "Filter normal activity of buffers"
  (when (or (not rcirc-ignore-all-buffer-activity)
            (member type '(nick keyword)))
    (funcall next-method buffer type)))

;;; TODO: Avoid conflict buffer names if they are on different IRC
;;; server. Maybe give a nick name to each server?
(defun rcirc-generate-new-buffer-name* (process target)
  "Return a buffer name based on PROCESS and TARGET.
This is used for the initial name given to IRC buffers.
This function returns a shorter name."
  (substring-no-properties
   (if target
       target
     (concat "*" (process-name process) "*"))))

(when (fboundp 'advice-add)
  (advice-add 'rcirc :before #'rcirc--cache-authinfo)
  (advice-add 'rcirc-authenticate :around #'rcirc--authenticate-using-authinfo)
  (advice-add 'rcirc-record-activity :around #'rcirc--filter-normal-buffer-activity)
  (advice-add 'rcirc-generate-new-buffer-name :override #'rcirc-generate-new-buffer-name*))

(require 'shr-color nil t)
(defvar rcirc-colors)
(when (featurep 'shr-color)
  (defun rcirc--set-rcirc-colors (&optional arg)
    "Set rcirc-colors to appropriate value."
    (let ((bg (face-background 'default))
          (shr-color-visible-luminance-min 80)
          candidates)
      (or (color-defined-p bg)
          (setq bg "black"))
      (dolist (item color-name-rgb-alist)
        (let ((color (car item)))
          (when (not (color-gray-p color))
            (let ((new-color (cadr (shr-color-visible bg color t))))
              (setq candidates (cons new-color candidates))))))
      (setq rcirc-colors candidates)))
  (when (fboundp 'advice-add)
    (advice-add 'rcirc :before #'rcirc--set-rcirc-colors)))
(require 'rcirc-color nil t)

(provide 'rc-rcirc)
;;; rc-rcirc.el ends here
