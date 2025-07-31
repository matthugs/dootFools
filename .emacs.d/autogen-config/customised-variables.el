;; the main goals of my customized faces is to make all the magit
;; headings show up in tmux terminals, which is where I tend to do all
;; of my emacsin'
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Info-use-header-line nil)
 '(ag-arguments '("--smart-case" "--stats" "--hidden" "--ignore" ".git"))
 '(auth-sources '("~/.authinfo.gpg" "~/.netrc" "~/.authinfo"))
 '(custom-file
   (expand-file-name "autogen-config/customised-variables.el"
                     user-emacs-directory))
 '(custom-safe-themes
   '("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26"
     default))
 '(evil-search-module 'evil-search)
 '(evil-undo-system 'undo-fu)
 '(frame-background-mode 'dark)
 '(package-selected-packages '(use-package))
 '(projectile-enable-caching t)
 '(straight-check-for-modifications '(check-on-save find-when-checking) nil nil "this could have consequences if we do end up doing a lot of emacs package development; see https://github.com/radian-software/straight.el/blob/8341ae9b1bfebe5c6d99e3aef6d425ba0196be0a/README.md#my-init-time-got-slower"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-blame-heading ((t (:background "green" :foreground "black")))))

(provide 'customised-variables)
