;;; init.el --- Emacs configuration
;;; Commentary:

;; The Emacs configuration is divided into modules.
;; This file contains the basic configuration and
;; connection of other modules
                                    
;; Emacs version 28.1.

;;; Code:

;; User Info
(setq user-full-name "Sergey Golov"
  user-mail-addres "serg.golov2019@yandex.ru")

;; Always load newest byte code
(setq load-prefer-newer t)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; Set custom file path
(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;;store all backup and autosave files in the backups dir;
(setq backup-directory-alist
      '((".*" . "~/.emacs.d/backups/")))

(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/backups/" t)))

;; enable y/n answers
(fset #'yes-or-no-p #'y-or-n-p)

;; disable startup screen
(setq inhibit-startup-screen 't)
  
;; menu bar,tool bar and scroll bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; line number mode
(setq line-nuber-mode t)
(setq column-number-mode t)
(global-linum-mode 1)

;; don't use tabs to indent, tab with = 4
(setq-default indent-tabs-mode nil  tab-width     4)

;; smart tab behavior - indent or complete
(setq tab-always-indent 'complete)

;; Wrap lines at 80 characters
(setq-default fill-column 80)

;; prepare "package"
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(setq package-user-dir
      (expand-file-name "elpa" user-emacs-directory))
(package-initialize)

;; prepare "use-package"
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-verbose t)

;; path to init modules
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-style)
(require 'init-general-package)
(require 'init-general-dev-tools)
(require 'init-corfu)
;;(put 'downcase-region 'disabled nil)
;;(put 'narrow-to-region 'disabled nil)

(provide 'init)

