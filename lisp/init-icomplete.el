;;; init-icomplete.el --- complit configuration
;;; Commentary:

;;; Code


(defun icomplete-setup()

;;setup icomplete
(setq icomplete-prospects-height 1)
(setq icomplete-show-matches-on-no-input t)
(setq icomplete-hide-common-prefix nil)
(setq icomplete-in-buffer t)
(icomplete-mode 1)
(setq completion-styles '(basic partial-completion))

)

(icomplete-setup)

(provide 'init-icomplete)
