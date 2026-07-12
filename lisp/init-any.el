;;; init-any.el --- any packages
;;; Commentary: -

;;; Code


(use-package gnuplot
:ensure t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '( (gnuplot . t)     ; Включает Gnuplot
    (python . t)      ; Включает Python (если нужен)
    (emacs-lisp . t)  ; Включает запуск Elisp
  ))

(provide 'init-any)
