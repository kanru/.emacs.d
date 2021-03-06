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
(require 'rcirc-controls nil t)

(add-hook 'rcirc-mode-hook 'rcirc-omit-mode)

(rcirc-track-minor-mode 1)
(setq rcirc-fill-column 79
      rcirc-buffer-maximum-lines 20000
      rcirc-keywords '("kanru"
                       "urnak")
      rcirc-default-nick "kanru"
      rcirc-default-user-name "kanru"
      rcirc-default-full-name "Kan-Ru Chen"
      rcirc-server-alist nil
      rcirc-reconnect-delay 10)

(add-to-list 'rcirc-server-alist
             '("irc.freenode.net"
               :port 6697
               :encryption tls
               :channels ("#lisp"
                          "#emacs"
                          "#emacs.tw"
                          "#cschat.tw"
                          "#haskell.tw"
                          "#lisp.tw"
                          "#rust.tw"
                          "#sbcl"
                          "#python.tw"
                          "#pushisland2"
                          "#g0v.tw"
                          "#h4"
                          "#darktable")))

(add-to-list 'rcirc-server-alist
             '("irc.debian.org"
               :port 6697
               :encryption tls
               :channels ("#dot"
                          "#debian-devel"
                          "#debian-www")))

(add-to-list 'rcirc-server-alist
             '("irc.mozilla.org"
               :port 6697
               :encryption tls
               :channels ("#fxos"
                          "#developers"
                          "#gfx"
                          "#layout"
                          "#content"
                          "#geo"
                          "#servo"
                          "#rust"
                          "#mozilla-taiwan"
                          "#perf-tw"
                          "#perf"
                          "#raptor"
                          "#memshrink"
                          "#e10s")))

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

(defun rcirc--after-rcirc-next-active-buffer (&rest arg)
  (set-transient-map
   (let ((map (make-sparse-keymap)))
     (dolist (keys '("C-SPC" "SPC"))
       (define-key map (kbd keys)
         'rcirc-next-active-buffer))
     map)))

(when (fboundp 'advice-add)
  (advice-add 'rcirc :before #'rcirc--cache-authinfo)
  (advice-add 'rcirc-authenticate :around #'rcirc--authenticate-using-authinfo)
  (advice-add 'rcirc-record-activity :around #'rcirc--filter-normal-buffer-activity)
  (advice-add 'rcirc-next-active-buffer :after #'rcirc--after-rcirc-next-active-buffer))

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

(with-eval-after-load 'ibuffer
  (add-to-list 'ibuffer-fontification-alist
               '(99 (member (current-buffer) rcirc-activity) rcirc-prompt) t))

(require 'rcirc-notify nil t)
(with-eval-after-load 'rcirc-notify
  (rcirc-notify-add-hooks))

(provide 'rc-rcirc)
;;; rc-rcirc.el ends here
