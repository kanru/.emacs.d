(add-to-list 'load-path (expand-file-name "~/zone2/public/emacs/gnus/lisp"))

(setq gnus-home-directory (locate-user-emacs-file "gnus")
      gnus-init-file      (locate-user-emacs-file "gnus")
      message-directory   (expand-file-name "Mail/" gnus-home-directory))

(require 'gnus-load nil t)

(defun gnus-treat-simplified-chinese ()
  "Convert Simplified Chinese to Traditional Chinese using opencc."
  (interactive)
  (gnus-with-article-buffer
    (article-goto-body)
    (let ((opencc (executable-find "opencc")))
       (when opencc
         (shell-command-on-region (point) (point-max) opencc t t)))))

(provide 'rc-gnus)
