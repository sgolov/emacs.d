;;; -*- lexical-binding: t; -*-
;;; init-icomplete.el --- complit configuration
;;; Commentary:

;;; Code

(use-package icomplete
  :ensure nil
  :defer t
  :init 
  (icomplete-mode 1)
  :config
  (icomplete-vertical-mode 1)
  (setq icomplete-prospects-height 1)
  (setq icomplete-show-matches-on-no-input t)
  (setq icomplete-hide-common-prefix nil)
  (setq icomplete-in-buffer t)
  (setq completion-styles '(basic partial-completion))
  (setq read-buffer-completion-ignore-case t)
  (setq read-file-name-completion-ignore-case t)
  (advice-add 'completion-at-point :after #'minibuffer-hide-completions)
)

(provide 'init-icomplete)
