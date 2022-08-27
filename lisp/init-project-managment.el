;;; init-project-managment.el --- setting up project management packages
;;; Commentary:

;;; Code:

;;Projectile is a project interaction library for Emacs.
(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
 ;; (setq projectile-project-search-path '("~/Документы/projects/"))
  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map)))
;;git client
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status))
  )


(use-package flycheck
  :ensure t
  :hook (prog-mode . flycheck-mode))

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

;;Treemacs is a file and project explorer
(use-package treemacs
  :ensure t
  :defer t
  :commands treemacs
  :init
  (with-eval-after-load 'winmum
    (define-key winum-keymap (kbd "M-0")
      #'treemacs-select-window))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("<f12>"     . treemacs)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)
        ("C-x t o"   . treemacs-edit-workspaces)))

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t
  )

;;Inclusion of magit in treemacs
(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

;;to do: move hook to another file
(add-hook 'prog-mode-hook (lambda()
                            (hs-minor-mode t)
                            (yas-minor-mode t)
                            ))
(global-set-key (kbd "C-c h a") 'hs-show-all)
(global-set-key (kbd "C-c h d") 'hs-hide-all)
(global-set-key (kbd "C-c h c") 'hs-toggle-hiding)

          
;;; init-project-managment.el ends here
(provide 'init-project-managment)
