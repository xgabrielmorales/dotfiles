;; Require and initialize 'package'.
(require 'package)

;; Add 'melp' a to 'package-archives'.
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
(package-initialize)

(use-package ido
  :config
  ;; This makes ido work vertically
  (use-package ido-vertical-mode
    :ensure t
    :config
    (ido-vertical-mode 1))

  (setq ido-enable-flex-matching nil)
  (setq ido-default-buffer-method 'selected-window)

  ;; IGNORE BUFFERS
  (setq my-unignored-buffers '(""))
  (defun my-ido-ignore-func (name)
    (and (string-match "^\*" name)
         (not (member name my-unignored-buffers))))

  (setq ido-ignore-buffers '("\\` " my-ido-ignore-func))

  (ido-mode t))

(global-set-key (kbd "C-x b")   'ibuffer)
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)

(use-package dired
  :ensure nil
  :hook
  (dired-mode . (lambda () (define-key dired-mode-map (kbd "^")
                             (lambda () (interactive) (find-alternate-file "..")))))
  :init
  (put 'dired-find-alternate-file 'disabled nil)

  :custom ((dired-listing-switches "-XAhgo --group-directories-first")))

(use-package which-key
  :ensure t
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 3))

(use-package tex
  :ensure auctex
  :hook
  (LaTeX-mode . auto-fill-mode)
  (TeX-after-compilation-finished-functions . TeX-revert-document-buffer)
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  ;; AUCTeX will ask for the master file
  (setq-default TeX-master nil)
  (setq TeX-view-program-selection '((output-pdf "PDF Tools"))))

(use-package pdf-tools
  :ensure t
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :config
  (pdf-tools-install)
  ;; Open PDFs scalen to fit page
  (setq-default pdf-view-display-size 'fit-width))

;; Git integration for Emacs
(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package git-gutter
  :bind (("C-x C-g p" . git-gutter:previous-hunk)
         ("C-x C-g n" . git-gutter:next-hunk)
         ("C-x C-g s" . git-gutter:stage-hunk)
         ("C-x C-g u" . git-gutter:revert-hunk)
         ("C-x C-g i" . git-gutter:popup-hunk))
  :hook ((prog-mode . git-gutter-mode)
         (text-mode . git-gutter-mode))
  :config
  (setq git-gutter:added-sign "")
  (setq git-gutter:deleted-sign "")
  (setq git-gutter:modified-sign "")
  (setq git-gutter:window-width 2))

(use-package elpy
  :ensure t
  :hook
  (elpy-mode . (lambda() (highlight-indentation-mode 0)))
  :init
  (elpy-enable))

;; FUNDAMENTAL
;; ===========

(setq inhibit-startup-message t)     ;; No startup message
(setq initial-scratch-message nil)   ;; No message in scratch buffer
(setq initial-major-mode 'text-mode) ;; Text mode is the initial mode.

(global-hl-line-mode t) ;; Show cursoline
(column-number-mode t)  ;; Show column number in the mode line
(blink-cursor-mode 0)   ;; No blink cursor

(delete-selection-mode t) ;; Replace highlighted text

(setq auto-save-default nil) ;; Do not autosave
(setq make-backup-files nil) ;; Do not backup files

;; Synchronizes the clipboard with X11
(setq x-select-enable-clipboard t)

;; Fill column at 72
(setq-default fill-column 72)

;; No cursor in intactive windows
(setq cursor-in-non-selected-windows nil)

;; No confirmation for visiting non-existent files
(setq confirm-nonexistent-file-or-buffer nil)

;; Automatically open read-only files in view-mode
(setq view-read-only t)

;; y/n for answering yes/no questions
(fset 'yes-or-no-p 'y-or-n-p)

;; Delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; Show lines numbers only in programming modes
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; APPEARANCE
;; ===========

(menu-bar-mode   0) ;; Disable tool bar
(tool-bar-mode   0) ;; Disable menu bar
(scroll-bar-mode 0) ;; Disable scroll bar

(setq default-frame-alist
      (list '(font . "Roboto Mono Light 11")
            '(internal-border-width . 10)
            '(vertical-scroll-bars  . nil)))

;; THEME
(use-package tango-plus-theme
  :ensure t
  :config
  (load-theme 'tango-plus t))

;; MOOD LINE
(use-package mood-line
  :ensure t
  :config
  (mood-line-mode))

;; INDENTATION
;; ===========

;; Our Custom Variable
(setq custom-tab-width 4)

;; Two Callable functions for enabling/disabling tabs in Emacs
(defun disable-tabs ()
  (setq indent-tabs-mode nil))

(defun enable-tabs ()
  (local-set-key (kbd "TAB") 'tab-to-tab-stop)
  (setq indent-tabs-mode t)
  (setq tab-width custom-tab-width))

;; Hooks to Enable Tabs
(add-hook 'c++-mode-hook        'enable-tabs)
(add-hook 'c-mode-hook          'enable-tabs)
;; Hooks to Disable Tabs
(add-hook 'lisp-mode-hook       'disable-tabs)
(add-hook 'python-mode-hook     'disable-tabs)
(add-hook 'emacs-lisp-mode-hook 'disable-tabs)

;; Make the backspace properly erase the tab instead of removing one
;; space at a time.
(setq backward-delete-char-untabify-method 'hungry)

;; Indentation config for C/C++
(setq c-default-style "java")

;; Insert brackets, parens, quotes in pair.
(electric-pair-mode t)
;; Any matching parenthesis is highlighted.
(show-paren-mode t)
;; Delay before displaying a matching parenthesis.
(setq show-paren-delay 0)

;; SCROLLING
;; ===========

(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)

(autoload 'View-scroll-half-page-forward "view")
(autoload 'View-scroll-half-page-backward "view")

(global-set-key (kbd "C-v") 'View-scroll-half-page-forward)
(global-set-key (kbd "M-v") 'View-scroll-half-page-backward)

;; SPELL CHECK
;; ===========

(use-package ispell
  :ensure t
  :preface
  (defun flyspell-spanish ()
    (interactive)
    (ispell-change-dictionary "es_CO"))
  (defun flyspell-english ()
    (interactive)
    (ispell-change-dictionary "en_US"))
  :config
  (setq ispell-program-name "/usr/bin/hunspell")
  (setq ispell-dictionary "es_CO"))

;; BINDINGS
;; ===========

;; Undo
(global-set-key (kbd "C-z") 'undo-only)
;; Prevent accidents
(global-unset-key (kbd "C-x C-c"))
;; Kill current buffer (inseat of asking first buffer name)
(global-set-key (kbd "C-x k") 'kill-current-buffer)

(defun insert-current-date () (interactive)
       (insert (shell-command-to-string "echo -n $(date +'%a, %d %b %Y')")))

(use-package org
  :config
  (setq org-ellipsis "")
  (setq org-startup-indented t)
  (setq org-hide-leading-stars t)
  (setq org-return-follows-link t)
  (setq org-startup-folded t)
  (setq org-src-window-setup t)

  ;; AGENDA
  ;; ===========
  ;; List of files or directories to be used for agenda
  (setq org-agenda-files '("~/Org/Agenda/"))
  ;; Max number of days to show in agenda (Two Weeks)
  (setq org-agenda-span 14)
  ;; A week starts on the current day
  (setq org-agenda-start-on-weekday nil)
  ;; Use 12-hour clock instead of 24-hour in agenda view
  (setq org-agenda-timegrid-use-ampm t)

  ;; Use my date format by default
  (setq-default org-display-custom-times t)
  (setq org-time-stamp-custom-formats
	'("<%a, %d %b %Y>" . "<%a, %d %b %Y %H:%M>")))
