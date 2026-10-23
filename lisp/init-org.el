;;; -*- lexical-binding: t; -*-
;;; init-org.el --- org configuration
;;; Commentary:

;;; Code

;;; Настройка Babel движка Org-mode для работы с кодом
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)       ; Разрешить запуск Python
   (shell . t)        ; Разрешить запуск терминальных команд
   (emacs-lisp . t)   ; Разрешить запуск Elisp
   (gnuplot . t)))    ; Разрешить построение графиков

(provide 'init-org)
