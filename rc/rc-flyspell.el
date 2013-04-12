;;; rc-flyspell.el --- Config for Flyspell mode

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

;;

;;; Code:

;; Allow M-TAB in org-mode
(setq flyspell-use-meta-tab nil)

;; Printing messages for every word (when checking the entire buffer)
;; causes an enormous slowdown.
(setq flyspell-issue-message-flag nil)

(add-hook 'text-mode-hook 'turn-on-flyspell)

(provide 'rc-flyspell)
;;; rc-flyspell.el ends here
