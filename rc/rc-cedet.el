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
(require 'ede/cpp-root)

(when (file-exists-p "~/zone2/mozilla/central")
  (ede-cpp-root-project "mozilla-central"
			:file "~/zone2/mozilla/central/configure.in"
			:system-include-path '("~/zone2/mozilla/B2G/objdir-gecko/dist/include"
					       "~/zone2/mozilla/B2G/objdir-gecko/ipc/ipdl/_ipdlheaders"))

  (ede-cpp-root-project "mozilla-central"
			:file "~/zone2/mozilla/B2G/gecko/configure.in"
			:system-include-path '("~/zone2/mozilla/B2G/objdir-gecko/dist/include"
					       "~/zone2/mozilla/B2G/objdir-gecko/ipc/ipdl/_ipdlheaders")))

(when (file-exists-p "~/zone2/public/chewing/npapi-chewing")
  (ede-cpp-root-project "npapi-chewing"
                        :name "NPAPI libchewing wrapper"
                        :file "~/zone2/public/chewing/npapi-chewing/configure.ac"
                        :include-path '("/src" "/npapi")
                        :spp-table '(("XP_UNIX" . "1"))))

(setq ede-locate-setup-options '(ede-locate-idutils ede-locate-base))

;; https://lwn.net/Articles/502119

(setq semantic-default-submodes (append semantic-default-submodes
                                        '(global-semantic-idle-local-symbol-highlight-mode
                                          global-semantic-idle-summary-mode
                                          global-semantic-decoration-mode
                                          global-semantic-highlight-func-mode
                                          global-semantic-stickyfunc-mode)))

(setq semantic-decoration-styles '(("semantic-decoration-on-includes" . t)
                                   ("semantic-decoration-on-protected-members")
                                   ("semantic-decoration-on-private-members")))

(semantic-mode)
(global-ede-mode)

;; auto-complete setup
;;
;; (ac-config-default)
;; (ac-set-trigger-key "TAB")

;; (defun nix-setup-auto-complete-semantic ()
;;   "Arrange to do semantic autocompletion."
;;   (add-to-list 'ac-sources 'ac-source-semantic))

(provide 'rc-cedet)
;;; rc-cedet.el ends here
