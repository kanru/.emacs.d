;;; rc-ibuffer.el -- IBuffer Mode Settings

(require 'ibuffer)

(setq ibuffer-projectile-prefix ""
      my-ibuffer-default-groups
      `(("journal" (filename . "journal/[0-9]+.txt$"))))
(add-hook 'ibuffer-hook
	  (lambda ()
            (setq ibuffer-saved-filter-groups
                  `(("default"
                     ,@my-ibuffer-default-groups
                     ,@(ibuffer-projectile-generate-filter-groups))))
	    (ibuffer-switch-to-saved-filter-groups "default")))

(add-to-list 'ibuffer-fontification-alist
             '(99 (not (verify-visited-file-modtime))
                  font-lock-warning-face) t)

(provide 'rc-ibuffer)
;; rc-ibuffer.el ends here
