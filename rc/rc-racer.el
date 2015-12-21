;;; rc-racer.el --- Rust-Racer                       -*- lexical-binding: t; -*-

;; Copyright (C) 2015  Kan-Ru Chen (陳侃如)

;; Author: Kan-Ru Chen (陳侃如) <kanru@isil>
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

(require 'rust-mode)
(require 'racer)

(setq racer-rust-src-path "/home/kanru/r/rust/src/"
      racer-cmd "/home/kanru/.local/bin/racer")

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(define-key racer-mode-map (kbd "TAB") #'company-indent-or-complete-common)

(provide 'rc-racer)
;;; rc-racer.el ends here
