;;; init-font.el --- init font
;;; Commentary -

;; Code

;; Шрифт Liberation Mono-12
(set-frame-font "Liberation Mono-12" nil t)
;; Межстрочное интервал
(setq-default line-spacing 0.1)
;; Сглаживание и рендеринг
(add-to-list 'default-frame-alist '(font . "Liberation Mono-12:antialias=subpixel"))

(provide 'init-font)
