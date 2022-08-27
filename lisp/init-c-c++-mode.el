;;; init-c-c++-mode.el --- c/c++ modes configuration
;;; Commentary:

;; Need to install: clang,cmake and irony-server.
;; Irony server: M-x irony-install-server RET.

;;; Code:


(use-package irony
  :ensure t
  :hook (c++-mode . irony-mode)
  (c-mode . irony-mode)
  (irony-mode . irony-cdb-autosetup-compile-options)
  )

(use-package company-irony
  :ensure t
  :config
  (add-to-list 'company-backends 'company-irony))

(use-package irony-eldoc
  :ensure t
  :hook  (irony-mode . irony-eldoc))

(use-package flycheck-irony
  :ensure t
  :after (flycheck)
  :hook (flycheck-mode-hook . flycheck-irony-mode-hook)
  )


;;; init-c-c++-mode.el ends here
(provide 'init-c-c++-mode)
