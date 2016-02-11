(add-hook 'dired-mode-hook 'directory//dired-mode-init)

(defun directory//dired-mode-init ()
  (dired-hide-details-mode t))
