;;; rc-ibuffer.el -- IBuffer Mode Settings

(require 'ibuffer)

(setq ibuffer-saved-filter-groups
      `(("default"
         ("mozilla" (or (filename . ,(expand-file-name "~/mozilla"))))
         ("journal" (filename . "journal/[0-9]+.txt$"))
         ,@(ibuffer-projectile-generate-filter-groups))))
(add-hook 'ibuffer-mode-hook
	  (lambda ()
	    (ibuffer-switch-to-saved-filter-groups "default")))

(add-to-list 'ibuffer-fontification-alist
             '(99 (not (verify-visited-file-modtime))
                  font-lock-warning-face) t)

(provide 'rc-ibuffer)
;; rc-ibuffer.el ends here
