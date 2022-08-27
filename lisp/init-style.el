;;; init-style.el --- style packages configuration
;;; Commentary:

;;; Code:


;;Icons
(use-package all-the-icons
  :if (display-graphic-p)
  :ensure t
  :config
  (setq
   all-the-icons-icon-for-buffer t
   all-the-icons-icon-for-dir    t
   all-the-icons-icon-for-file   t
   all-the-icons-icon-for-mode   t
   all-the-icons-icon-for-url    t
   all-the-icons-install-fonts   t
)
  )

;;Theme
(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :config
  (load-theme 'sanityinc-tomorrow-night))

;;; init-style.el ends here
(provide 'init-style)
