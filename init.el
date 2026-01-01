;;; init.el --- Rework emacs configuration
;;; Commentary:

;; Emacs version 30.1

;;; Code

;; Мои переменные
(defvar my-cache-dir (expand-file-name ".my-cache" user-emacs-directory))

;; Создать католог ".my-cache" если он не сущесвует 
(unless (file-exists-p my-cache-dir)
  (make-directory my-cache-dir))

;; Задать путь к "custom.el"
(setq custom-file
      (expand-file-name "custom.el" my-cache-dir))

;; Загрузить "custom.el
(when (file-exists-p custom-file)
  (load custom-file))

;; Переопределить пути для бэкапов, автосохранений и сессий
;; Создаем локальные переменные с помощью let
(let ((backup-dir (expand-file-name "backups" my-cache-dir))
      (autosave-dir (expand-file-name "auto-save-list" my-cache-dir))
      (session-dir (expand-file-name "sessions" my-cache-dir)))

  ;; Создать каталоги для бэкапов, автосохранений и сессий
  (unless (file-exists-p backup-dir)
    (make-directory backup-dir t))

  (unless (file-exists-p autosave-dir)
    (make-directory autosave-dir t))

  (unless (file-exists-p session-dir)
    (make-directory session-dir)
    )

  ;; Переопределение путей
  (setq backup-directory-alist `((".*" . ,backup-dir)))
  (setq auto-save-file-name-transforms `((".*" ,autosave-dir) (nil . t)))
  (setq emacs-session-filename session-dir)

  )

;; Разрешить множественное создание бэкап-файлов 
(setq version-control t)
;; Количество старых версий(первых)
(setq kept-old-versions 1)
;; Количество новых версий
(setq kept-new-versions 9)
;; Удалять старые версии автоматически
(setq delete-old-versions t)

;; Удалять файлы автосохранения при успешном сохранении основного файла
;; (setq delete--files t)

;; Сохранить историю минибуфера 
(setq savehist-file (expand-file-name "history" my-cache-dir))
(setq history-length 30)
(savehist-mode 1)

;; Сохранить историю посещения файлов
(setq recentf-save-file (expand-file-name "recentf" my-cache-dir))
(recentf-mode 1)

;; Сохранить положение курсора в файлах 
(setq save-place-file (expand-file-name "places" my-cache-dir))
(save-place-mode 1)

;; Файл с закладками перенесен в "my-cache-dir"
(setq bookmark-default-file (expand-file-name "bookmark" my-cache-dir))
;; Сохранять закладки после каждого изменения
(setq bookmark-save-flag 1)

;; Подключить режим "desktop" (сохраняет буферы, открытые файлы, окна
;; режимы для последущего востановления)
;; переопределен путь для файла "desktop"
;; Сразу загрузятся только 10 буферов (остальные подгрузятся в фоновом режиме)
(require 'desktop)
(setq desktop-path (list my-cache-dir)
      desktop-dirname my-cache-dir
      desktop-base-file-name ".emacs.desktop"
      desktop-base-lock-name "emacs.desktop.lock"
      desktop-restore-eager 10
      desktop-save-mode t)

(desktop-save-mode 1)

;; user-full-name получает имя из переменной окружения NAME
;; либо с помощью UID (если не получится вернет "unknown")
;; поэтому задаю либо NAME либо sglv
(setq user-full-name (or (getenv "NAME") "sglv"))
 

;; Всегда загружать новый байт-код
(setq load-perfer-newer t
      ;; Сокращение частоты сбора мусора
      ;; Сбор муссора при 50MB (Значение поумолчанию 0.76MB)
      gc-cons-threshold 50000000)

;; Замена yes/no на y/n
(fset #'yes-or-no-p #'y-or-n-p)

(setq
      ;; Отключен стартовый экран
      inhibit-startup-screen 't
      ;; Отключены диалоговые окна
      use-dialog-box nil
      ;; Отображение номера строки в "mode-line"
      line-nuber-mode t
      ;; Отображение номера колонки в "mode-line"
      column-number-mode t
      ;; Удалять файлы в корзину
      delete-by-moving-to-trash t 
      )    

;; Количество символов в режиме "fill-column"
(setq-default fill-column 80)
;; Относительные номера строк
(setq-default display-line-numbers 'relative)

;; Таб = 4 пробела
(setq-default indent-tabs-mode nil tab-width    4)
;; Поведение кнопки таб (при nil всегда отступ)
(setq tab-always-indent nil)        

(electric-indent-mode -1)

;; удалить выделенный регион при наборе символов
(delete-selection-mode t)

;; Отключить C-z
(global-set-key (kbd "C-z") nil)

;; Размер фрейма в пикселях 
(setq frame-resize-pixelwise t) 

;; Отключить
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Подключение package (пакетный менеджер)
(require 'package)
;; Католог для внешних пакетов
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))

;; Добавить ресурсы с внешними пакетами
(unless (assoc-default "gnu" package-archives)
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t))
(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))
(unless (assoc-default "nongnu" package-archives)
  (add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/") t))

;; Приоритет внешних ресурсосв 
(setq package-archive-priorities
      '(("gnu" . 10)
        ("nongnu" . 9)
        ("melpa" . 1)))

(package-initialize 1)

;; Высокоуровневый пакетный менеджер работает поверх package
(require 'use-package)

;; Директория для lisp модулей
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-icomplete)
(require 'init-theme)
(require 'init-general)
;;(require 'init-go)

(provide 'init)
