;;;; -*- Mode: emacs-lisp; indent-tabs-mode: nil -*-
;;;
;;; emacs.el --- Main Emacs initialization file.
;;;
;;; Copyright (C) 2002-2007, James Bielman  <jamesjb@jamesjb.com>
;;; All Rights Reserved.
;;;

;;;# General Configuration
;;;
;;; Setting standard Emacs options to suit my tastes.

;;; Set up various minor modes that should be enabled/disabled.
(blink-cursor-mode -1)
(column-number-mode 1)
(global-font-lock-mode 1)
(line-number-mode 1)
(show-paren-mode 1)
(transient-mark-mode 1)

;;; Set good defaults for some buffer-local variables.
(setq-default indent-tabs-mode nil)
(setq-default tab-width 8)
(setq-default show-trailing-whitespace t)

;;; Set good values for some global variables.
(setq inhibit-startup-message t)
(setq mouse-yank-at-point t)
(setq vc-follow-symlinks t)
(setq visible-bell nil)
(setq make-backup-files nil)

;;; Set personal information for things that need it.
(setq user-full-name "James Bielman")
(setq user-mail-address "jamesjb@gmail.com")

(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program "google-chrome")

;;;# Font Lock Configuration
;;;
;;; Set up the font lock mode colors for programming modes.

(set-face-foreground 'font-lock-comment-face "DarkCyan")
(set-face-foreground 'font-lock-doc-face "#ff55ff")
(set-face-foreground 'font-lock-string-face "#ff55ff")
(set-face-foreground 'font-lock-keyword-face "Yellow")
(set-face-bold-p     'font-lock-keyword-face nil)
(set-face-foreground 'font-lock-builtin-face "LightSteelBlue")
(set-face-foreground 'font-lock-function-name-face "White")
(set-face-foreground 'font-lock-variable-name-face "White")
(set-face-foreground 'font-lock-type-face "PaleGreen")
(set-face-foreground 'font-lock-constant-face "LightSteelBlue")
(set-face-foreground 'font-lock-warning-face "Red")
(set-face-bold-p     'font-lock-warning-face nil)

;;;# Libraries
;;;
;;; Load and configure some useful Emacs libraries.

;;; Install fancy buffer-switching keybindings from iswitchb.
(require 'iswitchb)
(iswitchb-mode 1)
(setq iswitchb-buffer-ignore '("^ "))

;;; Set up mouse wheel support (why isn't this the default?)
(mwheel-install)
(setq mouse-wheel-follow-mouse t)
(setq mouse-wheel-progessive-speed nil)

(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux kernel."
  (interactive)
  (c-mode)
  (c-set-style "K&R")
  (setq tab-width 8)
  (setq indent-tabs-mode t)
  (setq c-basic-offset 8))

(setq c-doc-comment-style nil)

;;; Hook to configure various aspects of CC mode.
(defun my-c-mode-common-hook ()
  (c-set-style "bsd")
  (setq c-basic-offset 4)
  (c-set-offset 'case-label '+)
  (c-set-offset 'inextern-lang 0))

;;; Add "~/lib/emacs" to the load-path if it exists.
(when (file-directory-p "~/lib/emacs")
  (add-to-list 'load-path "~/lib/emacs"))

;;; Load and configure the Slime CL interaction library.
;; (add-to-list 'load-path "~/devel/slime/")
;; (setq inferior-lisp-program "sbcl")
;; (require 'slime)
;; (slime-setup)

;;; haskell-mode setup
(when (file-readable-p "~/lib/emacs/haskell-mode/haskell-site-file.el")
  (load "~/lib/emacs/haskell-mode/haskell-site-file.el")
  (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
  (setq haskell-program-name "~/ghc/current/bin/ghci"))

;;; markdown-mode setup
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files." t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-font-lock-haddock nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
