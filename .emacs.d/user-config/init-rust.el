(use-package lsp-mode)
(use-package rustic
  :custom
  (rustic-analyzer-command '("rustup" "run" "stable" "rust-analyzer")))

(provide 'init-rust)
