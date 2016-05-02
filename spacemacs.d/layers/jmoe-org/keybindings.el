(add-hook 'org-mode-hook 'jmoe-org//org-mode-bindings)

(defun jmoe-org//org-mode-bindings ()
  ;; using this binding for tab-to-tab-stop (force a tab)
  (local-unset-key (kbd "<C-tab>")))
