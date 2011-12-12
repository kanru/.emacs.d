;;; rc-auto-complete.el --- AutoComplete config

;; Copyright (C) 2011  Kan-Ru Chen

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

(add-to-list 'load-path "~/src/mirror/auto-complete/")
(add-to-list 'load-path "~/src/mirror/auto-complete-clang/")
(add-to-list 'load-path "~/src/mirror/ac-slime/")
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories "~/src/mirror/auto-complete/dict")
  (ac-config-default)
  (require 'auto-complete-clang nil t)
  (require 'ac-slime nil t)
;  (add-to-list 'ac-sources 'ac-source-clang)
;  (add-to-list 'ac-sources 'ac-slime)
  )

(provide 'rc-auto-complete)
;;; rc-auto-complete.el ends here
