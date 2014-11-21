;;; rc-todo.el --- TODO mode                         -*- lexical-binding: t; -*-

;; Copyright (C) 2014  Kan-Ru Chen (陳侃如)

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

(setf todo-directory (expand-file-name "~/git/personal/todo/"))

(global-set-key (kbd "C-c t") #'todo-show)
(global-set-key (kbd "C-c j") #'todo-jump-to-category)
(global-set-key (kbd "C-c i") #'todo-insert-item)

(provide 'rc-todo)
;;; rc-todo.el ends here
