;;; -*- lexical-binding: t; -*-
;;; init-general.el --- general packages configuration
;;; Commentary:

;;; Code:

;; key support
(use-package which-key
  :ensure nil
  :config
(which-key-mode t))

;;git client
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status))
  )

(use-package eglot
  :ensure nil
  :config 
  (setq eglot-autoshutdown t) 
  (setq eglot-extend-to-xref t)   
 )

(use-package speedbar
  :ensure nil
  :custom 
  (speedbar-prefer-window t)
  (speedbar-window-default-width 35)
  (speedbar-window-max-width 35)
  :bind
  (("<f8>" . speedbar-window)
    ("S-<f8>" . speedbar-get-focus))
)

(use-package treesit
  :ensure nil
  :custom
  (treesit-enabled-modes t) 
  (treesit-auto-install-grammar 'ask)
  (treesit-font-lock-level 3)
)

(defun my/toggle-treesit-level ()
  "Циклически переключает уровень подсветки Tree-sitter (от 1 до 4)."
  (interactive)
  (let ((next-level (if (= treesit-font-lock-level 4) 1 (1+ treesit-font-lock-level))))
    (setq treesit-font-lock-level next-level)
    (treesit-font-lock-recompute-features)
    (font-lock-flush)
    (font-lock-ensure)
    (message "Уровень подсветки Tree-sitter изменен на: %d" next-level))
)

(global-set-key (kbd "C-c t L") #'my/toggle-treesit-level)

(require 'project)
;; переменная my-cache-dir дб определена в init
(setq project-list-file (expand-file-name "projects" my-cache-dir))

(add-hook 'prog-mode-hook (lambda()
                            (hs-minor-mode t)
                            (global-set-key (kbd "C-c h a") 'hs-show-all)
                            (global-set-key (kbd "C-c h d") 'hs-hide-all)
                            (global-set-key (kbd "C-c h c") 'hs-toggle-hiding)))


;;; init-general-package.el ends here
(provide 'init-general)
