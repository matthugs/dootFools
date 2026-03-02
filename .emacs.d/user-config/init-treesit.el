;; still need to M-x treesit-install-language-grammar to make use of the below
(setq treesit-language-source-alist
      '(
        (yaml "https://github.com/tree-sitter-grammars/tree-sitter-yaml.git" "v0.7.0")
        (json "https://github.com/tree-sitter/tree-sitter-json.git" "v0.24.8")))

(use-package json-ts-mode
  :mode "\\.json\\'")

(provide 'init-treesit)
