;;; rc-cc-mode.el --- CC Mode config

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

(require 'cc-mode)

(c-add-style "mozilla"
             '((indent-tabs-mode . nil)
               (c-basic-offset . 2)
               (c-comment-only-line-offset . 0)
               (c-doc-comment-style . 'javadoc)
               (c-hanging-braces-alist
                (block-close)
                (statement-case-open after)
                (substatement-open after)
                (class-open before after)
                (class-close before)
                (inline-open before after)
                (inline-close before))
               (c-hanging-colons-alist
                (member-init-cont . before))
               (c-offsets-alist
                (inline-open . 0)
                (innamespace . 0)
                (label . -)
                (case-label . +)
                (substatement-label . -)
                (substatement-open . 0))
               (c-cleanup-list
                (brace-else-brace
                 brace-elseif-brace
                 brace-catch-brace
                 empty-defun-braces
                 defun-close-semi
                 list-close-comma
                 scope-operator))))

(set-default 'c-macro-names-with-semicolon
             "\\_<NS_\\(IMPL\\|DECL\\|DEFINE\\|DECLARE\\)_.*\\_>")

(define-skeleton insert-mozilla-header
  "Insert Mozilla license boilerplate."
  nil
  "/* -*- Mode: C++; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 2 -*- */\n"
  "/* vim: set ts=2 et sw=2 tw=80: */\n"
  "/* This Source Code Form is subject to the terms of the Mozilla Public\n"
  " * License, v. 2.0. If a copy of the MPL was not distributed with this file,\n"
  " * You can obtain one at http://mozilla.org/MPL/2.0/. */\n")

(define-abbrev c++-mode-abbrev-table "mozh" "" 'insert-mozilla-header :system t)

(define-skeleton insert-namespace
  "Insert namespace."
  "Namespace: "
  > "namespace " str & " " "{" \n
  > _ \n
  > "} // " str | "anonymous namespace"\n)

(define-abbrev c++-mode-abbrev-table "namespace" "" 'insert-namespace :system t)

;;; hide-ifdef-mode
(setq hide-ifdef-shadow t
      hide-ifdef-initially t)
(add-hook 'c-mode-common-hook 'hide-ifdef-mode)
(add-hook 'c-mode-common-hook 'subword-mode)

(provide 'rc-cc-mode)
;;; rc-cc-mode.el ends here
