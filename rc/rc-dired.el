;;; rc-dired.el --- Dired Configuration

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

(require 'dired-x)

(setq dired-omit-files "\\(^\\.[^\\.].*$\\|^\\.\\..+$\\)")
(setq dired-dwim-target t)

(add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))
(add-hook 'dired-mode-hook 'hl-line-mode)

(provide 'rc-dired)
;;; rc-dired.el ends here
