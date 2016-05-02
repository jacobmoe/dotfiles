(add-hook 'org-mode-hook 'jmoe-org//org-mode-init)

(defun jmoe-org//org-mode-init ()
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((R . t)
     (emacs-lisp . t)
     (latex . t)
     (ledger . t)
     (ruby . t)
     (sh . t)
     (sql . nil))))
