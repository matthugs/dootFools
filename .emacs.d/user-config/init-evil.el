(use-package evil-leader
	     :config
	     (global-evil-leader-mode 1)
	     (evil-leader/set-leader "<SPC>")
	     (evil-leader/set-key
	       "b" 'switch-to-buffer
	       "f" 'helm-projectile-find-file))
(use-package evil
	     :init
	     (setq evil-want-C-u-scroll t)
	     (setq evil-cross-lines t)
	     (setq-default evil-symbol-word-search t)
	     :config
	     (evil-mode 1)
	     (define-key evil-window-map (kbd "C-k") 'evil-window-up)
	     (define-key evil-window-map (kbd "C-j") 'evil-window-down))

(provide 'init-evil)
