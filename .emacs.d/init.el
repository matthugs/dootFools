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
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files))
  :config
  (require 'helm-config)
  (setq helm-candidate-number-limit 100)
  (helm-mode 1))

(use-package projectile
  :config
  (projectile-global-mode))

(use-package helm-projectile
  :config
  (helm-projectile-on))

(use-package web-mode
  :mode ("\\.mustache\\'" "\\.css\\'" "\\.scss\\'" "\\.jsx\\'" "\\.js\\'" "\\.json\\'")
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-indent-style 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-sql-indent-offset 2)
  (setq web-mode-content-types-alist
	'(("jsx" . "\\.js[x]?\\'"))))

(setq color-themes '())
(use-package color-theme-solarized
  :config
  (load-theme 'solarized t))

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
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(evil-search-module (quote evil-search))
 '(frame-background-mode (quote dark))
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-blame-heading ((t (:background "green" :foreground "black")))))


(defun set-pt-number-from-magit (value)
  (interactive "sProject Tracker number:")
    (magit-set value (project-tracker-number-config-for-branch))
  )

(defun grab-pt-number-from-magit ()
  (interactive)
    (magit-get (project-tracker-number-config-for-branch))
  )

(defun project-tracker-number-config-for-branch ()
  (format "branch.%s.project-tracker-number" (magit-branch-config-branch))
  )
