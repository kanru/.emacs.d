;;; rc-slime.el --- SLY setup

;; Copyright (C) 2011, 2014  Kan-Ru Chen

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

(require 'sly-autoloads nil t)

(make-directory "~/.cache/sly-fasls/" t)

(setq sly-compile-file-options
      `(:fasl-directory ,(expand-file-name "~/.cache/sly-fasls/"))
      sly-net-coding-system 'utf-8-unix
      sly-lisp-implementations
      '((sbcl ("sbcl"))
	(ccl ("~/r/lisp/ccl/lx86cl64"))
        (clisp ("clisp"))
        (ecl ("ecl"))
        (cmucl ("cmucl"))))

(provide 'rc-sly)
;;; rc-slime.el ends here
