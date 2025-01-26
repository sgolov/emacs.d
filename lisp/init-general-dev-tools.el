;;; init-general-dev-tools --- configure dev tools

;;; Commentary:

;;; Code:

;;git client
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status))
  )

;;YASnippet is a template system for Emacs.
(use-package yasnippet
  :defer t
  :ensure t
  :bind(("C-c y" . yas-new-snippet))
  )

;;Snippets collection
(use-package yasnippet-snippets
  :defer t
  :ensure t)

(use-package eglot
  :ensure t
 )

(require 'project)

(add-hook 'prog-mode-hook (lambda()
                            (hs-minor-mode t)
                            (yas-minor-mode t)
                            (global-set-key (kbd "C-c h a") 'hs-show-all)
                            (global-set-key (kbd "C-c h d") 'hs-hide-all)
                            (global-set-key (kbd "C-c h c") 'hs-toggle-hiding)))

;;; init-general-dev-tools end here
(provide 'init-general-dev-tools)
