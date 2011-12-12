;;; rc-slime.el --- SLIME setup

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

(load (expand-file-name "~/quicklisp/slime-helper.el") 'noerror)

(setq slime-net-coding-system 'utf-8-unix
      slime-lisp-implementations
      '((sbcl ("sbcl"))
	(my-sbcl ("~/src/mirror/sbcl/run-sbcl.sh"))
	(ccl ("~/src/mirror/ccl/lx86cl64"))
        (clisp ("clisp"))
        (ecl ("ecl"))
        (picolisp ("pil") :init slime-init-picolisp)))

(defun slime-init-picolisp (file _)
  (setq slime-protocol-version 'ignore)
  (format "%S\n"
          `(prog (load ,(expand-file-name "~/src/mirror/swank-picolisp/swank-picolisp.l"))
                 (start-swank ,file))))
(provide 'rc-slime)
;;; rc-slime.el ends here
