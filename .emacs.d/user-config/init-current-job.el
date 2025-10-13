
(defun get-qlik-reload-history ()
  "guess a link to qlik reload logs for the app described by config in current buffer"
  (interactive)
  (let* ((buffer-json (json-parse-string (buffer-string)))
         (qlik-item-id (gethash "qlik_item_id" buffer-json))
         (qlik-tenant (gethash "qlik_tenant" buffer-json)))
    (kill-new (concat "https://" qlik-tenant ".us.qlikcloud.com/item/" qlik-item-id "/history"))))

(provide 'init-current-job)
