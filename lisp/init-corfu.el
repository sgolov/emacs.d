;;; init-corfu.el  configuration corfu-packege
;;; Comentary:

;;; Code

(use-package corfu
  :ensure t
  :custom
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t)                 ;; Enable auto completion
  (corfu-separator ?\s)          ;; Orderless field separator
  (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  (corfu-preview-current nil)    ;; Disable current candidate preview
  (corfu-preselect 'prompt)      ;; Preselect the prompt
  (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  (corfu-scroll-margin 5)        ;; Use scroll margin

   :hook ((prog-mode . corfu-mode)
          (shell-mode . corfu-mode)
          (eshell-mode . corfu-mode))

  :init
  (global-corfu-mode))

(provide 'init-corfu)
