(require 'init-treesit)

(add-to-list 'auto-mode-alist '("/\\.coveragerc\\'" . conf-mode))

(setq major-mode-remap-alist
      '((python-mode . python-ts-mode)))

(use-package eglot
  :ensure nil
  :hook ((python-ts-mode . eglot-ensure)))

(provide 'init-python)
