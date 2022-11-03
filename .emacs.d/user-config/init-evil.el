;; for whatever reason, this must-happen-before-evil-is-loaded config
;; cannot simply be placed in the :init of evil's declaration.
(setq evil-want-C-u-scroll t)
(use-package evil-leader
	     :config
	     (global-evil-leader-mode 1)
	     (evil-leader/set-leader "<SPC>")
	     (evil-leader/set-key
	       "b" 'helm-projectile-switch-to-buffer
	       "g" 'ggtags-find-tag-dwim
	       "md" 'magit-dispatch-popup
	       "ms" 'magit-status
	       "mb" 'magit-blame-addition
	       "f" 'helm-projectile-find-file))
(use-package evil
	     :init
	     (setq evil-cross-lines t)
	     (setq evil-undo-system 'undo-fu)
	     (setq-default evil-symbol-word-search t)
	     :config
	     (evil-mode 1)
	     (define-key evil-window-map (kbd "C-k") 'evil-window-up)
	     (define-key evil-window-map (kbd "C-h") 'evil-window-left)
	     (define-key evil-window-map (kbd "C-l") 'evil-window-right)
	     (define-key evil-window-map (kbd "C-j") 'evil-window-down))

(use-package undo-fu)
(use-package evil-matchit)

(provide 'init-evil)
