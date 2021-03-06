(setq gnus-home-directory (locate-user-emacs-file "gnus")
      gnus-init-file      (locate-user-emacs-file "gnus")
      message-directory   (expand-file-name "Mail/" gnus-home-directory))

(require 'gnus)

(defun gnus-treat-simplified-chinese ()
  "Convert Simplified Chinese to Traditional Chinese using opencc."
  (interactive)
  (gnus-with-article-buffer
    (article-goto-body)
    (let ((opencc (executable-find "opencc")))
       (when opencc
         (shell-command-on-region (point) (point-max) opencc t t)))))

(defun my-gnus-group-exit (&optional really-exit)
  (interactive "P")
  (if really-exit
      (gnus-group-exit)
    (bury-buffer)))

(define-key gnus-group-mode-map (kbd "q") 'my-gnus-group-exit)

(provide 'rc-gnus)
