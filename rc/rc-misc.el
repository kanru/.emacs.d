;;; rc-misc.el -- Misc Settings

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

;; Allow M-TAB in org-mode
(setq flyspell-use-meta-tab nil)

;; Save a list of recent files visited.
(recentf-mode 1)

(setq save-place-file (locate-user-emacs-file "places.el"))

(add-to-list 'safe-local-variable-values '(lexical-binding . t))
(add-to-list 'safe-local-variable-values '(whitespace-line-column . 80))

;; Hippie expand: at times perhaps too hip
(delete 'try-expand-line hippie-expand-try-functions-list)
(delete 'try-expand-list hippie-expand-try-functions-list)

;; ido-mode is like magic pixie dust!
(when (> emacs-major-version 21)
  (ido-mode t)
  (ido-everywhere 1)
  (setq ido-enable-prefix nil
        ido-enable-flex-matching t
        ido-create-new-buffer 'always
        ido-use-filename-at-point 'guess
        ido-max-prospects 10))

(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines t)
(set-default 'imenu-auto-rescan t)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)
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
(eval-after-load 'undo-tree
  '(global-undo-tree-mode))

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

(provide 'rc-misc)
;; rc-misc.el ends here
