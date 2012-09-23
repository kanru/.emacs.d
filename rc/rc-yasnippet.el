;;; rc-yasnippet.el -- Yasnippet Mode Settings

(add-to-list 'load-path (expand-file-name "~/zone2/public/emacs/yasnippet"))
(require 'yasnippet nil t)

(eval-after-load 'yasnippet
  '(progn
     (setq yas-prompt-functions '(yas-ido-prompt))
     (yas-global-mode 1)))

(provide 'rc-yasnippet)
;; rc-yasnippet.el ends here
