(add-to-list 'load-path (expand-file-name "~/src/mirror/emacs-jabber/build"))
(require 'jabber-autoloads nil t)

(setq jabber-account-list
      '(("ckanru@gmail.com"
         (:network-server . "talk.google.com")
         (:connection-type . ssl))
        ("kanru@chat.facebook.com")))

(provide 'rc-jabber)
