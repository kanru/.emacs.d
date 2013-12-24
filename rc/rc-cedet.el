;;; rc-cedet.el --- CEDET

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

;; This file must be loaded early in emacs init.

;;; Code:

(require 'semantic/decorate/mode)

(add-to-list 'semanticdb-project-roots "~/zone2/mozilla/central/")

;; https://lwn.net/Articles/502119

(setq semantic-default-submodes (append semantic-default-submodes
                                        '(global-semantic-idle-local-symbol-highlight-mode
                                          global-semantic-idle-summary-mode
                                          global-semantic-decoration-mode
                                          global-semantic-highlight-func-mode
                                          global-semantic-stickyfunc-mode)))

(semantic-toggle-decoration-style "semantic-tag-boundary" -1)
(semantic-toggle-decoration-style "semantic-decoration-on-protected-members" 1)
(semantic-toggle-decoration-style "semantic-decoration-on-private-members" 1)

(semantic-mode)

(provide 'rc-cedet)
;;; rc-cedet.el ends here
