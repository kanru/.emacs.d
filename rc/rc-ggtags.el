;;; rc-ggtags.el --- GGtags mode                     -*- lexical-binding: t; -*-

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

(require 'ggtags nil t)

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (when (fboundp 'ggtags-mode)
                (ggtags-mode 1)
                (setq-local eldoc-documentation-function
                            #'ggtags-eldoc-function)))))

(provide 'rc-ggtags)
;;; rc-ggtags.el ends here
