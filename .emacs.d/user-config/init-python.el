;;; ...  -*- lexical-binding: t -*-
(require 'init-treesit)

(add-to-list 'auto-mode-alist '("/\\.coveragerc\\'" . conf-mode))

(setq major-mode-remap-alist
      '((python-mode . python-ts-mode)))

(add-hook 'python-ts-mode-hook #'eglot-ensure)

(provide 'init-python)
