;;; init-zig.el --- init zig mode
;;; Commentary: -

;;; Code

(use-package zig-mode
  :ensure t
  :init
  (autoload 'zig-mode "zig-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.\\(zig\\|zon\\)\\'" . zig-mode))
)

(provide 'init-zig)
