;;; rc-yasnippet.el -- Yasnippet Mode Settings

(add-to-list 'load-path (expand-file-name "~/src/mirror/yasnippet"))
(require 'yasnippet nil t)

(eval-after-load 'yasnippet
  `(progn
     (setq yas/root-directory '(,(locate-user-emacs-file "snippets")
				"~/src/mirror/yasnippet/snippets")
	   yas/prompt-functions '(yas/dropdown-prompt
				  yas/x-prompt
				  yas/completing-prompt
				  yas/ido-prompt
				  yas/no-prompt))
     (mapc 'yas/load-directory yas/root-directory)
     (yas/global-mode 1)))

(provide 'rc-yasnippet)
;; rc-yasnippet.el ends here
