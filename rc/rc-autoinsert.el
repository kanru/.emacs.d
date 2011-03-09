;;; rc-autoinsert.el

(add-hook 'find-file-hooks 'auto-insert)
(setq auto-insert-directory (locate-user-emacs-file "insert"))
(setq auto-insert 'other)
(setq auto-insert-query nil)

;;(define-auto-insert)


(provide 'rc-autoinsert)
;;; rc-autoinsert.el ends here
