(require 'init-treesit)

(add-to-list 'auto-mode-alist '("/\\.coveragerc\\'" . conf-mode))

(setq major-mode-remap-alist
      '((python-mode . python-ts-mode)))

(provide 'init-python)
