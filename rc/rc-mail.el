;;; rc-mail.el --- All mail stuff                    -*- lexical-binding: t; -*-

;; Copyright (C) 2013  Kan-Ru Chen (陳侃如)

;; Author: Kan-Ru Chen (陳侃如) <kchen@mozilla.com>
;; Keywords: mail

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

;;; Default composing style
(setq message-from-style 'angles
      mail-from-style    'angles
      message-forward-as-mime nil
      message-forward-ignored-headers (regexp-opt '("X-" "Received"
                                                    "DKIM" "Return"
                                                    "Envelope"))
      message-forward-included-headers '("From" "To" "Date"
                                         "Subject" "Message-ID"))

(setq user-mail-address-regexp
      (regexp-opt
       (mapcar #'rot13
               '("xnaeh@0kyno.bet"
                 "xbfgre@qrovna.bet"
                 "xbfgre@qrovna.bet.gj"
                 "xnaeh@xnaeh.vasb"
                 "xnaeh.96@fgh.pfvr.apah.rqh.gj"
                 "pxnaeh@tznvy.pbz"
                 "xpura@zbmvyyn.pbz")))
      mail-dont-reply-to-names user-mail-address-regexp
      message-alternative-emails user-mail-address-regexp)

(provide 'rc-mail)
;;; rc-mail.el ends here
