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

  (provide 'init-copypasta)
