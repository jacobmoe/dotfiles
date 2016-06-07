;; set C-tab to tab with quoted-insert
(global-set-key (kbd "<C-tab>") 'tab-to-tab-stop)

;; major-mode specific indent levels
(defvar default-indent-level 2)
(setq-default js-indent-level 2 js2-basic-offset 2)

(add-hook 'sh-mode-hook
          (function (lambda ()
                      (setq sh-basic-offset 2)
                      (setq sh-indentation 2)
                      (setq evil-shift-width default-indent-level))))

(add-hook 'ruby-mode-hook
          (function (lambda ()
                      (setq ruby-deep-indent-paren nil)
                      (setq evil-shift-width default-indent-level))))

(add-hook 'enh-ruby-mode-hook
          (function (lambda ()
                      (setq enh-ruby-deep-indent-paren nil)
                      (setq evil-shift-width default-indent-level))))

(add-hook 'js-mode-hook
          (function (lambda ()
                      (setq evil-shift-width js-indent-level))))

(add-hook 'js2-mode-hook
          (function (lambda ()
                      (setq evil-shift-width js-indent-level))))

(add-hook 'web-mode-hook
          (function (lambda ()
                      (setq evil-shift-width default-indent-level)
                      (setq web-mode-markup-indent-offset default-indent-level)
                      (setq web-mode-css-indent-offset default-indent-level)
                      (setq web-mode-code-indent-offset default-indent-level))))

(add-hook 'jade-mode-hook
          (function (lambda ()
                      (setq evil-shift-width default-indent-level))))

(add-hook 'haml-mode-hook
          (function (lambda ()
                      (setq evil-shift-width default-indent-level))))

(add-hook 'erb-mode-hook
          (function (lambda ()
                      (setq evil-shift-width default-indent-level))))

(add-hook 'html-mode-hook
          (function (lambda ()
                      (setq evil-shift-width default-indent-level))))

(add-hook 'css-mode-hook
          (function (lambda ()
                      (setq evil-shift-width default-indent-level))))

(add-hook 'scss-mode-hook
          (function (lambda ()
                      (setq evil-shift-width default-indent-level))))

(add-hook 'go-mode-hook
          (function (lambda ()
                      (setq evil-shift-width default-indent-level))))
