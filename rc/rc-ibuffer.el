;;; rc-ibuffer.el -- IBuffer Mode Settings

(require 'ibuffer)

(setq my-ibuffer-default-groups
      `(("mozilla" (or (filename . ,(expand-file-name "~/mozilla"))))
        ("journal" (filename . "journal/[0-9]+.txt$"))))
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
