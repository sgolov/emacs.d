;;; init-general.el --- general packages configuration
;;; Commentary:

;;; Code:

;; key support
(use-package which-key
  :ensure t
  :config
  (which-key-mode t))

;;git client
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status))
  )

(use-package eglot
  :ensure t
  :config 
  (setq eglot-autoshutdown t) 
  (setq eglot-extend-to-xref t)   
 )

(require 'project)
;; переменная my-cache-dir дб определена в init
;; (setq project-list-file (expand-file-name "projects" my-cache-dir))

(add-hook 'prog-mode-hook (lambda()
                            (hs-minor-mode t)
                            (yas-minor-mode t)
                            (global-set-key (kbd "C-c h a") 'hs-show-all)
                            (global-set-key (kbd "C-c h d") 'hs-hide-all)
                            (global-set-key (kbd "C-c h c") 'hs-toggle-hiding)))


;;; init-general-package.el ends here
(provide 'init-general)
