(add-hook 'ruby-mode-hook 'jmoe-ruby//ruby-mode-init)
(add-hook 'enh-ruby-mode-hook 'jmoe-ruby//enh-ruby-mode-init)

(defun jmoe-ruby//ruby-mode-init ()
  (setq ruby-insert-encoding-magic-comment nil))

(defun jmoe-ruby//enh-mode-mode-init ()
  (remove-hook 'before-save-hook 'enh-ruby-mode-set-encoding t))

