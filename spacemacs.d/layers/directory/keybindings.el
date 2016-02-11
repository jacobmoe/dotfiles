(add-hook 'dired-mode-hook 'directory//dired-mode-bindings)

(defun directory//dired-mode-bindings ()
  (define-key dired-mode-map (kbd "<tab>") 'dired-subtree-toggle)
  (define-key dired-mode-map (kbd "q") 'dired-subtree-remove))
