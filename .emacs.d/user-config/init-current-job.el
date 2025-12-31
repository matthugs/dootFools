(require 'init-evil)
(require 'init-copypasta)

(defun get-qlik-reload-history ()
  "guess a link to qlik reload logs for the app described by config in current buffer"
  (interactive)
  (let* ((buffer-json (json-parse-string (buffer-string)))
         (qlik-item-id (gethash "qlik_item_id" buffer-json))
         (qlik-tenant (gethash "qlik_tenant" buffer-json)))
    (kill-new (concat "https://" qlik-tenant ".us.qlikcloud.com/item/" qlik-item-id "/history"))))


(transient-define-prefix copypasta ()
  "copy useful information based on point"
  [("g" "github/-lab link" get-source-control-link)
   ("qr" "qlik reload history" get-qlik-reload-history)
   ])
;; might consider doing separate groups for what information we take as input, whereas things like the gitlab link take several details
;; also possible we could use the presentation to emphasize "hey here's all the details we'd be using"
;; but does transient have a way of actually using those details? I.e. taking them as the inputs rather than getting them the way I have already written e.g. 'get-source-control-link?
;; b/c if so & I can rewrite them as more pure functions with the logic of how to get their inputs baked into transient, that could be very nice

(evil-leader/set-key
  "c" 'copypasta)



(provide 'init-current-job)
