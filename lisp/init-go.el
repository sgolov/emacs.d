;;; init-go.el --- go mode configuration
;;; Commentary:

;;; Code:

(use-package go-mode
  :ensure t
  :init
  (autoload 'go-mode "go-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
  )

(provide 'init-go)
