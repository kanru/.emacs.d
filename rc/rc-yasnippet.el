;;; rc-yasnippet.el -- Yasnippet Mode Settings

(require 'yasnippet nil t)

(eval-after-load 'yasnippet
  '(progn
     (setq yas-prompt-functions '(yas-ido-prompt))
     (add-hook 'prog-mode-hook 'yas-minor-mode)))

(provide 'rc-yasnippet)
;; rc-yasnippet.el ends here
