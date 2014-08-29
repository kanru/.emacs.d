;;; rc-ido.el --- IDO                                -*- lexical-binding: t; -*-

;; Copyright (C) 2014  Kan-Ru Chen (陳侃如)

;; Author: Kan-Ru Chen (陳侃如) <kchen@mozilla.com>
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

;; ido-mode is like magic pixie dust!
(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)
(with-eval-after-load 'smex
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))
(setq ido-enable-flex-matching t
      ido-enable-dot-prefix t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers 'auto)

(provide 'rc-ido)
;;; rc-ido.el ends here
