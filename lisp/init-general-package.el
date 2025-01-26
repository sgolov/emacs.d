;;; init-general-package.el --- general packages configuration
;;; Commentary:

;;; Code:


;;Vertico is an interactive interface for completion in Emacs.
;; (use-package vertico
;;   :ensure t
;;   :config
;;   (vertico-mode t)
;;   (vertico-grid-mode t)
;;   (vertico-indexed-mode t)
;;   (setq read-file-name-completion-ignore-case t
;;         read-buffer-completion-ignore-case t
;;         completion-ignore-case t)
;;   )

;;Navigate your windows and frames using numbers
(use-package winum
  :ensure t
  :init
  (setq winum-keymap
    (let ((map (make-sparse-keymap)))
      (define-key map (kbd "M-1") 'winum-select-window-1)
      (define-key map (kbd "M-2") 'winum-select-window-2)
      (define-key map (kbd "M-3") 'winum-select-window-3)
      (define-key map (kbd "M-4") 'winum-select-window-4)
      (define-key map (kbd "M-5") 'winum-select-window-5)
      (define-key map (kbd "M-6") 'winum-select-window-6)
      (define-key map (kbd "M-7") 'winum-select-window-7)
      (define-key map (kbd "M-8") 'winum-select-window-8)
      map))
  (winum-mode)
  )

;; key support
(use-package which-key
  :ensure t
  :config
  (which-key-mode t))

;;; init-general-package.el ends here
(provide 'init-general-package)
