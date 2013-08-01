;;; rc-decor.el -- Decoration

;; Set fonts
(customize-set-variable
 'face-font-family-alternatives
 (cons '("Han" "WenQuanYi Micro Hei" "AR Heiti Light B5" "cwTexYen")
       face-font-family-alternatives))
(setq face-font-rescale-alist
      '(("WenQuanYi Micro Hei" . 1.25)
	("cwTexYen" . 1.35)
	("AR Heiti Light B5" . 1.2)))
(when (fboundp 'set-fontset-font)
  (set-fontset-font t 'han "Han")
  (set-fontset-font t 'kana "Han"))
;; Setting `face-font-rescale-alist' somehow changes the default font
;; for new frame.
(add-to-list 'frame-inherited-parameters 'font)

;; Display battery status
(setq battery-mode-line-format "[BAT %b%p]")
(display-battery-mode 1)

;; Enable syntax highlighting for older Emacsen that have it off
(global-font-lock-mode t)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; Enable ansi color
(ansi-color-for-comint-mode-on)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1))

(setq visible-bell nil
      echo-keystrokes 0.1
      font-lock-maximum-decoration t
      inhibit-startup-message t
      shift-select-mode nil
      mouse-yank-at-point t
      require-final-newline t
      truncate-partial-width-windows nil
      uniquify-buffer-name-style 'forward
      whitespace-line-column 80
      ediff-window-setup-function 'ediff-setup-windows-plain
      xterm-mouse-mode t)

(provide 'rc-decor)
;; rc-decor.el ends here
