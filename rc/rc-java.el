;;; rc-java.el -- Java mode settings

(defun my-java-setup ()
  (c-set-offset 'arglist-intro '+))
(add-hook 'java-mode-hook 'my-java-setup)

(provide 'rc-java)
;; rc-java.el ends here
