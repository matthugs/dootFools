(use-package yaml-mode
  :config (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))
(use-package yaml-pro
  :config (progn
            (add-hook 'yaml-mode-hook 'yaml-pro-ts-mode 1)
            ;; still need to M-x treesit-install-language-grammar to make use of the below
            (setq treesit-language-source-alist
                  '((yaml "https://github.com/tree-sitter-grammars/tree-sitter-yaml.git" "v0.7.0"))
                  )
            )
  )


(provide 'init-yaml)
