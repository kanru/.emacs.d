;;; rc-helm.el --- helm                              -*- lexical-binding: t; -*-

;; Copyright (C) 2014  Kan-Ru Chen (陳侃如)

;; Author: Kan-Ru Chen (陳侃如) <kanru@isil.kanru.info>
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

(require 'helm-config)
(helm-mode 1)
(setq helm-time-zone-home-location "Taipei")

(define-key global-map [remap execute-extended-command] 'helm-M-x)
(define-key global-map [remap switch-to-buffer] 'helm-mini)
(define-key global-map [remap find-file] 'helm-find-files)
(define-key global-map [remap occur] 'helm-occur)
(define-key global-map [remap list-buffers] 'helm-buffers-list)
(define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
(unless (boundp 'completion-in-region-function)
  (define-key lisp-interaction-mode-map
    [remap completion-at-point] 'helm-lisp-completion-at-point)
  (define-key emacs-lisp-mode-map
    [remap completion-at-point] 'helm-lisp-completion-at-point))

(global-set-key (kbd "C-x f") 'helm-recentf)

(provide 'rc-helm)
;;; rc-helm.el ends here
