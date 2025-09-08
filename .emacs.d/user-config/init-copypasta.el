; oh me oh my get this copypasta working

(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))


(defun xsel-cut-function (text &optional push)
  (with-temp-buffer
    (insert text)
    (call-process-region (point-min) (point-max) "xsel" nil 0 nil "--clipboard" "--input")))
(defun xsel-paste-function()

  (let ((xsel-output (shell-command-to-string "xsel --clipboard --output")))
    (unless (string= (car kill-ring) xsel-output)
      xsel-output )))

(cond ((executable-find "xsel")
       (progn
         (setq x-select-enable-clipboard t)
         (setq interprogram-cut-function 'xsel-cut-function)
         (setq interprogram-paste-function 'xsel-paste-function)
         ))
      ((and (executable-find "pbpaste") (executable-find "pbcopy"))
       (progn
         (setq interprogram-cut-function 'paste-to-osx)
         (setq interprogram-paste-function 'copy-from-osx)
         )))


(defun parse-repo-path-from-url (url)
  "given a remote url for git repos return the repository path"
  (let* ((parse-attempt (url-generic-parse-url url))
         (is-compliant-url? (url-host parse-attempt)))
    (if is-compliant-url?
        (s-chop-suffix ".git" (url-filename parse-attempt))
      ;; assume we're dealing with a git-style-url
      ;; chop at the colon
      (s-chop-suffix ".git" (cadr (s-split ":" url)))
      )
    )
  )

; TODO: explore just opening the tab from emacs
(defun get-source-control-link ()
  "guess a source control link based on the current buffer's projectile root"
  (interactive)
  (let* ((remote-url (magit-get "remote" (magit-primary-remote) "url"))
         (is-gitlab? (s-contains? "gitlab.com" remote-url))
         (is-github? (s-contains? "github.com" remote-url))
         (commit (magit-commit-p (magit-headish)))
         (path-to-visited-file (s-chop-prefix (projectile-project-root) buffer-file-name))
         (line-number-of-point (number-to-string (line-number-at-pos)))
         (repo-path (parse-repo-path-from-url remote-url)))
    (if is-gitlab?
        (kill-new (concat "https://gitlab.com/" repo-path "/-/tree/" commit "/" path-to-visited-file "#L" line-number-of-point))
      (if is-github?
          (kill-new (concat "https://github.com/" repo-path "/blob/" commit "/" path-to-visited-file "#L" line-number-of-point))
  ))))


(provide 'init-copypasta)
