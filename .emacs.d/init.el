(require 'package)
(push '("melpa" . "http://melpa.milkbox.net/packages/")
      package-archives)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-always-ensure t)

(add-to-list 'load-path (expand-file-name "user-config" user-emacs-directory))

(require 'use-package)
(require 'init-magit)
(require 'init-evil)
(require 'init-php)
(require 'init-copypasta)

(use-package helm
  :demand t
  :config
  (helm-mode 1))

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode))

(use-package helm-projectile
  :config
  (helm-projectile-on))

(use-package web-mode
  :mode ("\\.mustache\\'" "\\.scss\\'")
  :config
  (setq web-mode-markup-indent-offset 2)
 (setq web-mode-code-indent-offset 2)
 (setq web-mode-indent-style 2)
 (setq web-mode-markup-indent-offset 2)
 (setq web-mode-sql-indent-offset 2))

;; mother of god
(setq-default indent-tabs-mode nil)
(menu-bar-mode -1)
(tool-bar-mode -1)

(defun my-javascript-mode-hook ()
  (message "stupid")
  (setq js-indent-level 2)
  )
(add-hook 'js-mode-hook 'my-javascript-mode-hook)

;; the main goals of my customized faces is to make all the magit
;; headings show up in tmux terminals, which is where I tend to do all
;; of my emacsin'
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-blame-heading ((t (:background "green" :foreground "black")))))
