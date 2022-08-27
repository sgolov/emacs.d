;;; init-generic.el --- generic packages configuration
;;; Commentary:

;;; Code:


;;Vertico is an interactive interface for completion in Emacs.
(use-package vertico
  :ensure t
  :config
  (vertico-mode t)
  (vertico-grid-mode t)
  (vertico-indexed-mode t)
  (setq read-file-name-completion-ignore-case t
        read-buffer-completion-ignore-case t
        completion-ignore-case t)
  )
;; key support
(use-package which-key
  :ensure t
  :config
  (which-key-mode t))

;;Company is a text completion framework for Emacs.
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.5)
  (setq company-show-quick-access t)
  (setq company-tooltip-limit 10)
  (setq company-minimum-prefix-length 2)
  (setq company-tooltip-align-annotations t)
  (setq company-tooltip-flip-when-above t)
  (global-company-mode)
  :bind
  (("M-/" . company-complete)))


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

;;Startup screen - dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-items '((recents  . 3)
                          (bookmarks . 3)))
  (with-eval-after-load 'projectile
    (add-to-list 'dashboard-items  '(projects . 3)))
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  )



;;; init-generic.el ends here
(provide 'init-generic)
