(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
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
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files))
  :config
  (require 'helm-config)
  (setq helm-candidate-number-limit 100)
  (helm-mode 1))

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode))

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on))

(use-package ag
  :ensure t)


(setq shell-command-switch "-ic")

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package web-mode
  :mode ("\\.mustache\\'" "\\.css\\'" "\\.scss\\'" "\\.jsx\\'" "\\.js\\'" "\\.json\\'" "\\.html\\'")
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-attr-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-indent-style 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-sql-indent-offset 2)
  (setq web-mode-content-types-alist
	'(("jsx" . "\\.js[x]?\\'")))
  (setq web-mode-engines-alist
        '(("django" . "\\.html\\'")
          ("underscore" . "\\.underscore\\'")))
)

(push (expand-file-name "emacs-color-theme-solarized" user-emacs-directory) custom-theme-load-path)
(setq color-themes '())
;;(load-theme 'solarized t)

(use-package markdown-mode
  :mode ("\\.\\(m\\(ark\\)?down\\|md\\)$" . markdown-mode)
  :config)

(use-package yasnippet
  :defer t
  :config
  (yas-reload-all)
  ;; (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  ;; (setq tab-always-indent 'complete)
  ;; (setq yas-prompt-functions '(yas-completing-prompt
  ;;                              yas-ido-prompt
  ;;                              yas-dropdown-prompt))
  ;; (define-key yas-minor-mode-map (kbd "<escape>") 'yas-exit-snippet)
  )

;; mother of god
(setq-default indent-tabs-mode nil)
(setq visible-bell t)
(setq initial-scratch-message "")
(setq inhibit-startup-message t)
;; fix for an apparent helm / helm-projectile? / tramp interoperation bug
(setq tramp-methods nil)

(menu-bar-mode -1)
(tool-bar-mode -1)

;; the main goals of my customized faces is to make all the magit
;; headings show up in tmux terminals, which is where I tend to do all
;; of my emacsin'
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-sources '("~/.authinfo.gpg" "~/.netrc" "~/.authinfo"))
 '(custom-safe-themes
   '("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default))
 '(evil-search-module 'evil-search)
 '(frame-background-mode 'dark)
 '(package-selected-packages '(use-package))
 '(projectile-enable-caching t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-blame-heading ((t (:background "green" :foreground "black")))))

