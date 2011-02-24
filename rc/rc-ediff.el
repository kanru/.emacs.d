;;; rc-ediff.el -- ediff mode settings

;; Default to unified diffs
(setq diff-switches "-u")

;; Cosmetics

(set-face-background 'vertical-border "white")
(set-face-foreground 'vertical-border "white")

(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

(provide 'rc-ediff)
;; rc-ediff.el ends here
