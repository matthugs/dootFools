(defun my-php-mode-setup ()
  "sets up styling and modes according to the Matt Hughes-approved
    way"
  (c-set-style "wf-php")
  )
(c-add-style "wf-php"
	     '("php"
	       (c-basic-offset . 2)))
	       
(use-package php-mode
	     :mode "\\.php\\'"
         :config
         (add-hook 'php-mode 'my-php-mode-setup))
(provide 'init-php)
