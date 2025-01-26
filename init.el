;;; init.el --- Emacs configuration 
;;;Commentary:

;; Emacs version 28.2.

;;; Code:

;UTF-8
(set-default-coding-systems 'utf-8)

;; User Info
(setq user-full-name "Sergey Golov"
  user-mail-addres "serg.golov2019@yandex.ru")

;; Always load newest byte code
(setq load-prefer-newer t)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; Custom file path
(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;;store all backup and autosave files in the tmp dir;
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; enable y/n answers
(fset #'yes-or-no-p #'y-or-n-p)

;; disable startup screen
(setq inhibit-startup-screen 't)

;; Don't pop up UI dialogs when prompting
(setq use-dialog-box nil)

;; Remembering recently edited files
(recentf-mode 1)

;; Save what you enter into minibuffer prompts
(setq history-length 30)
(savehist-mode 1)

;; Remember and restore the last cursor location of opened files
(save-place-mode 1)
  
;; menu bar,tool bar and scroll bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; line number mode
(setq line-nuber-mode t)
(setq column-number-mode t)
(global-display-line-numbers-mode 1)

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

(require 'init-icomplete)
(require 'init-style)
(require 'init-general-package)
(require 'init-general-dev-tools)
(require 'init-go)
(require 'init-corfu)

;;(put 'downcase-region 'disabled nil)
;;(put 'narrow-to-region 'disabled nil)

(provide 'init)

