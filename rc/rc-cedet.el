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

(load "~/zone2/public/emacs/cedet/cedet-devel-load" t)

(global-ede-mode t)

(ede-cpp-root-project "mozilla-central"
                      :file "~/zone2/mozilla/central/configure.in"
                      :system-include-path '("~/zone2/mozilla/B2G/objdir-gecko"))

(setq ede-locate-setup-options '(ede-locate-idutils ede-locate-base))

(provide 'rc-cedet)
;;; rc-cedet.el ends here
