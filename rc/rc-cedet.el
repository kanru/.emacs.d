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

(require 'ede/cpp-root)
(require 'semantic/decorate/mode)

;;; TODO: Add a ede-project-autoload for gecko

(defvar mozilla-central (expand-file-name "~/mozilla/central"))
(defvar b2g (expand-file-name "~/mozilla/B2G"))

(defun clang-complete->include-path (project-root)
  "Read `.clang_complete' file under PROJECT-ROOT and return include paths."
  (with-temp-buffer
    (let ((clang-complete (format "%s/.clang_complete" project-root)))
      (when (file-exists-p clang-complete)
        (insert-file-contents clang-complete)))
    (goto-char (point-min))
    (let (paths)
      (while (re-search-forward (format "-I%s\\(/.*\\)$" project-root) nil t)
        (push (match-string-no-properties 1) paths))
      paths)))

(defun clang-complete->spp-table (project-root)
  "Read `.clang_complete' file under PROJECT-ROOT and return spp-tables for ede."
  (with-temp-buffer
    (let ((clang-complete (format "%s/.clang_complete" project-root)))
      (when (file-exists-p clang-complete)
        (insert-file-contents clang-complete)))
    (goto-char (point-min))
    (let (defines)
      (while (re-search-forward "^-D\\(.*\\)$" nil t)
        (push (cons (match-string-no-properties 1) "") defines))
      defines)))

(ede-cpp-root-project
 "mozilla/central"
 :file (expand-file-name "README.txt" mozilla-central)
 :include-path (clang-complete->include-path mozilla-central)
 :spp-table (clang-complete->spp-table mozilla-central))

(ede-cpp-root-project
 "b2g"
 :file (expand-file-name "README.md" b2g)
 :include-path (clang-complete->include-path b2g)
 :spp-table (clang-complete->spp-table b2g))

;; https://lwn.net/Articles/502119

(setq semantic-default-submodes
      '(global-semanticdb-minor-mode
        global-semantic-idle-scheduler-mode
        global-semantic-idle-summary-mode
        global-semantic-decoration-mode
        global-semantic-stickyfunc-mode
        global-semantic-idle-local-symbol-highlight-mode))

(semantic-toggle-decoration-style "semantic-tag-boundary" -1)
(semantic-toggle-decoration-style "semantic-decoration-on-protected-members" 1)
(semantic-toggle-decoration-style "semantic-decoration-on-private-members" 1)

(semantic-mode)
(global-ede-mode)

(provide 'rc-cedet)
;;; rc-cedet.el ends here
