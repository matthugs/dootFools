(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq straight-use-package-by-default t)

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
  (setq helm-candidate-number-limit 100)
  (helm-mode 1))

(use-package projectile
  :config
  (projectile-global-mode))

(use-package helm-projectile
  :config
  (helm-projectile-on))

(use-package ag)


(setq shell-command-switch "-ic")

(use-package exec-path-from-shell
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
 '(ag-arguments '("--smart-case" "--stats" "--hidden" "--ignore" ".git"))
 '(auth-sources '("~/.authinfo.gpg" "~/.netrc" "~/.authinfo"))
 '(custom-safe-themes
   '("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default))
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

