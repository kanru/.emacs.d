;;; rc-misc.el -- Misc Settings

;; fit-frame-to-buffer
(setq fit-window-to-buffer-horizontally t)

;; C-l
(setq recenter-positions '(top bottom middle))

;; Browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program (or (getenv "BROWSER")
                                     (executable-find "browse")))

;; User FULL NAME
(setq user-full-name "Kan-Ru Chen (陳侃如)")

;; UUID
(setq uuid-ns-kanru "e026a194-898b-54d7-a2cb-1e822452179c")

;; Transparently open compressed files
(auto-compression-mode t)

;; Save a list of recent files visited.
(recentf-mode 1)

(setq save-place-file (locate-user-emacs-file "places.el"))

(add-to-list 'safe-local-variable-values '(lexical-binding . t))
(add-to-list 'safe-local-variable-values '(whitespace-line-column . 80))

;; Hippie expand
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-complete-file-name
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill))

(set-default 'indent-tabs-mode nil)
(set-default 'imenu-auto-rescan t)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

(defalias 'yes-or-no-p 'y-or-n-p)
(random t) ;; Seed the random-number generator

;; Don't clutter up directories with files~
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (locate-user-emacs-file "backups")))))

(eval-after-load 'grep
  '(when (boundp 'grep-find-ignored-files)
    (add-to-list 'grep-find-ignored-files "target")
    (add-to-list 'grep-find-ignored-files "*.class")))

;; undo-tree mode
(global-undo-tree-mode)

;; dtrt-indent mode
(dtrt-indent-mode)

;; ispell
(setq ispell-dictionary "american")

(setq ring-bell-function (lambda nil))

(require 'mm-url)
(defun replace-tinyurl ()
  "Grabs the url at point and echos the equivalent tinyurl in the
minibuffer to ease cutting and pasting."
  (interactive)
  (let* ((url-bounds (bounds-of-thing-at-point 'url))
	 (long-url (buffer-substring-no-properties (car url-bounds) (cdr url-bounds)))
	 (tinyurl
	  (save-excursion
	    (with-temp-buffer
	      (mm-url-insert
	       (concat "http://tinyurl.com/api-create.php?url=" long-url))
	      (kill-ring-save (point-min) (point-max))
	      (buffer-string)))))
    (delete-region (car url-bounds) (cdr url-bounds))
    (goto-char (car url-bounds))
    (insert tinyurl)
    (message tinyurl)))

(defun tinyurl ()
  "Grabs the url at point and echos the equivalent tinyurl in the
minibuffer to ease cutting and pasting."
  (interactive)
  (let* ((url-bounds (bounds-of-thing-at-point 'url))
	 (long-url (buffer-substring-no-properties (car url-bounds) (cdr url-bounds)))
	 (tinyurl
	  (save-excursion
	    (with-temp-buffer
	      (mm-url-insert
	       (concat "http://tinyurl.com/api-create.php?url=" (url-hexify-string long-url)))
	      (kill-ring-save (point-min) (point-max))
	      (buffer-string)))))
    (message tinyurl)))

(defun lorem ()
  "Insert a lorem ipsum."
  (interactive)
  (insert "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do "
          "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim"
          "ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut "
          "aliquip ex ea commodo consequat. Duis aute irure dolor in "
          "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla "
          "pariatur. Excepteur sint occaecat cupidatat non proident, sunt in "
          "culpa qui officia deserunt mollit anim id est laborum."))

(defun logcat ()
  "Open a adb logcat monitor buffer"
  (interactive)
  (let ((buffer (make-comint "logcat" "adb" nil "logcat")))
    (switch-to-buffer-other-window buffer)
    (with-current-buffer buffer
      (make-local-variable 'comint-buffer-maximum-size)
      (setq comint-buffer-maximum-size 4096))))

(provide 'rc-misc)
;; rc-misc.el ends here
