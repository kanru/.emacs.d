;;; rc-calfw.el --- Calfw config

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

(add-to-list 'load-path "~/zone2/public/emacs/emacs-calfw")
(require 'calfw nil t)
(require 'calfw-cal nil t)
(require 'calfw-org nil t)

(eval-after-load "calfw"
  '(defun my-open-calendar ()
     (interactive)
     (cfw:open-calendar-buffer
      :contents-sources
      (list
       (cfw:org-create-source "Green")))))

(provide 'rc-calfw)
;;; rc-calfw.el ends here
