;;; rc-packages.el --- Packages

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

(require 'package)
(package-initialize)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package '(ace-jump-mode
                   dtrt-indent
                   expand-region
                   git-commit-mode
                   go-mode
                   iedit
                   lua-mode
                   nav
                   openwith
                   paredit
                   pretty-mode
                   rcirc-color
                   undo-tree
                   vc-darcs))
  (unless (package-installed-p package)
    (when (assoc package package-archive-contents)
      (package-install package))))

(provide 'rc-packages)
;;; rc-packages.el ends here
