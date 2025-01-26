;;; init-style.el --- style packages configuration
;;; Commentary:

;;; Code

;; Modus-vivendi theme


;; Configure the Modus Themes' appearance
(setq modus-themes-mode-line '(borderless)
      modus-themes-paren-match '(bold intense)
      modus-themes-syntax '(alt-syntax faint)
      modus-themes-org-blocks 'gray-background)

;; Load the dark theme by default
(load-theme 'modus-vivendi t)

;; it dosen't work

;; (use-package modus-themes
;;   :ensure 
;;   :config
;;   (setq modus-themes-mode-line '(borderless))
;;   (load-theme 'modus-vivendi t)
;;  )         


(provide 'init-style)
