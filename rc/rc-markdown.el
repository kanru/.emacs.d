;;; rc-markdown.el -- Markdown Mode Settings

(autoload 'markdown-mode "~/zone2/public/emacs/markdown-mode/markdown-mode.el"
  "Major mode for editing Markdown files" t)

(add-to-list 'auto-mode-alist
             '("\\.mdwn\\'" . markdown-mode))

(provide 'rc-markdown)
;; rc-markdown.el ends here
