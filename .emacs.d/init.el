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
(add-to-list 'load-path (expand-file-name "autogen-config" user-emacs-directory))

(straight-use-package 'use-package)
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

(require 'customised-variables)
