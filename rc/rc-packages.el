;;; rc-packages.el --- Packages

;; Copyright (C) 2013  Kan-Ru Chen (陳侃如)

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

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t)

(use-package ace-jump-mode)
(use-package column-enforce-mode)
(use-package company)
(use-package css-eldoc)
(use-package diff-hl)
(use-package dtrt-indent)
(use-package expand-region)
(use-package ggtags)
(use-package git-commit)
(use-package go-mode)
(use-package haskell-mode)
(use-package highlight-defined)
(use-package ido-completing-read+)
(use-package ledger-mode)
(use-package lice)
(use-package lua-mode)
(use-package js2-mode)
(use-package magit)
(use-package markdown-mode)
(use-package multiple-cursors)
(use-package nlinum)
(use-package paredit)
(use-package projectile)
(use-package rcirc-color)
(use-package slime)
(use-package smart-mode-line)
(use-package smex)
(use-package undo-tree)
(use-package toml-mode)
(use-package org-journal)
(use-package ibuffer-projectile)
(use-package ess)
(use-package todotxt)
(use-package rust-mode)
(use-package racer)
(use-package eglot)
(use-package deadgrep)
(use-package elm-mode)

(provide 'rc-packages)
;;; rc-packages.el ends here
