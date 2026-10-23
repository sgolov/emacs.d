;;; -*- lexical-binding: t; -*-
;;; init-icomplete.el --- complit configuration
;;; Commentary:

;;; Code

(use-package icomplete
  :ensure nil
  :defer t
  :init 
  (icomplete-mode 1)
  :custom
  (icomplete-prospects-height 1)
  (icomplete-show-matches-on-no-input t)
  (icomplete-hide-common-prefix nil)
  (icomplete-in-buffer t)
  (completion-styles '(basic partial-completion))
  (read-buffer-completion-ignore-case t)
  (read-file-name-completion-ignore-case t)

  :bind 
  ;; Переназначаем клавиши ТАК, чтобы они работали именно внутри вертикального меню:
  (:map icomplete-minibuffer-map
      ;;  ("TAB" . icomplete-force-complete)           ; Умное автодополнение без исчезновения строк
        ("RET" . icomplete-force-complete-and-exit)  ; Выбрать вариант и нажать Enter
  )
)
(provide 'init-icomplete)
