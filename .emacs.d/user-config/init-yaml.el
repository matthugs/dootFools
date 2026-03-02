(use-package yaml-mode
  :mode "\\.yml\\'")
(use-package yaml-pro
  :config (add-hook 'yaml-mode-hook 'yaml-pro-ts-mode 1))


(provide 'init-yaml)
