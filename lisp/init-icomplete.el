;;; init-icomplete.el --- complit configuration
;;; Commentary:

;;; Code

;;(setq icomplete-delay-completions-threshold 0)
;;(setq icomplete-max-delay-chars 0)
;;(setq icomplete-compute-delay 0)
(setq icomplete-prospects-height 1)
;;(setq icomplete-with-completion-tables t)
(setq icomplete-show-matches-on-no-input t)
(setq icomplete-hide-common-prefix nil)
;;(setq icomplete-separator " | ")
(setq icomplete-in-buffer t)
;;(setq icomplete-vertical-mode nil)
(icomplete-mode 1)

;;(fido-mode nil)

 (setq completion-styles '(basic partial-completion))

(provide 'init-icomplete)
