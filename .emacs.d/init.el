(setq read-process-output-max (* 1024 1024 3)) ;; 3MiB
(setq gc-cons-threshold (* 1024 1024 100)) ;; 100 MiB

(require 'package)

(setq package-archives
	  '(("GNU ELPA" . "https://elpa.gnu.org/packages/")
		("MELPA" . "https://melpa.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(use-package diminish)

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :custom (dired-listing-switches "-FXAhgov --group-directories-first")
  :config)

(use-package dired-single)

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(use-package tree-sitter)
(use-package tree-sitter-langs)

(use-package projectile
  :diminish projectile-mode
  :config	(projectile-mode)
  :bind-keymap ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/Documents/projects")
	(setq projectile-project-search-path '("~/Documents/projects"))))

(use-package helm-projectile
  :ensure t
  :after projectile helm
  :config
  (helm-projectile-on)
  (setq projectile-completion-system 'helm))

(use-package magit
  :bind (("C-c g" . magit-status)
		 ("C-c M-g" . magit-dispatch)))

(use-package git-gutter
  :diminish git-gutter-mode
  :init (global-git-gutter-mode t)
  :bind (("C-c C-g p" . git-gutter:previous-hunk)
		 ("C-c C-g n" . git-gutter:next-hunk)
		 ("C-c C-g s" . git-gutter:stage-hunk)
		 ("C-c C-g u" . git-gutter:revert-hunk)
		 ("C-c C-g i" . git-gutter:popup-hunk))
  :config
  (setq git-gutter:added-sign "+")
  (setq git-gutter:deleted-sign "x")
  (setq git-gutter:modified-sign "-")
  (setq git-gutter:window-width 2)
  (setq git-gutter:update-interval 2)
  (setq git-gutter:hide-gutter t))

(use-package editorconfig
  :hook (prog-mode . editorconfig-mode)
  :diminish editorconfig-mode)

(use-package lsp-mode
  :init (setq lsp-keymap-prefix "C-l")
  :hook (lsp-mode . xgm/lsp-mode-setup)
  :commands (lsp lsp-deferred))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-log-io nil)
  (setq lsp-use-plists t)
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-doc-show-with-cursor nil)
  (setq lsp-ui-doc-show-with-mouse nil)
  (setq lsp-ui-doc-position 'at-point))

(defun xgm/lsp-mode-setup ()
  (setq lsp-eldoc-enable-hover nil)
  (setq lsp-enable-symbol-highlighting nil)
	(setq lsp-headerline-breadcrumb-segments '(symbols))
  (lsp-headerline-breadcrumb-mode))

(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (:map company-active-map
		 ("<tab>" . company-complete-selection))
		(:map lsp-mode-map
		 ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package ace-window
  :ensure t
  :bind (("C-x o" . ace-window)))

;; No startup message
(setq inhibit-startup-message t)
;; No message in scratch buffer
(setq initial-scratch-message nil)
;; Text mode is the initial mode.
(setq initial-major-mode 'text-mode)

;; In the mode line show:
(line-number-mode)
(column-number-mode)

 ;; Replace highlighted text
(delete-selection-mode t)

;; Backup files
(setq auto-save-default nil)
(setq make-backup-files nil)

;; Synchronizes the clipboard with X11
(setq x-select-enable-clipboard t)

;; Fill column at 72
(setq-default fill-column 72)

;; No cursor in intactive windows
(setq-default cursor-in-non-selected-windows nil)

;; No confirmation for visiting non-existent files
(setq confirm-nonexistent-file-or-buffer nil)

;; Automatically open read-only files in view-mode
(setq view-read-only t)

;; Revert buffer automaticaly if changed on disk
(global-auto-revert-mode t)

;; Truncate lines
(set-default 'truncate-lines t)

;; y/n for answering yes/no questions
(fset 'yes-or-no-p 'y-or-n-p)

;; Show lines numbers only in programming modes
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Don't show *Buffer list* when opening multiple files at the same time.
;; (setq inhibit-startup-buffer-menu t)

;; Disable *Messages* buffer
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Disabled *Completions* buffer
(add-hook 'minibuffer-exit-hook
      '(lambda ()
         (let ((buffer "*Completions*"))
           (and (get-buffer buffer)
            (kill-buffer buffer)))))

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(setq default-frame-alist
  (list '(font . "JetBrainsMono Nerd Font 11")
		'(internal-border-width . 10)
		'(width  . 126) '(height . 47)
		'(vertical-scroll-bars  . nil)))

;; Show cursoline
(global-hl-line-mode t)
;; Line cursor
(set-default 'cursor-type '(bar . 2))
;; No blink cursor
(blink-cursor-mode 0)

(setq whitespace-style
	  '(face spaces tabs newline space-mark tab-mark newline-mark))
(setq whitespace-display-mappings
	  '((newline-mark 10 [182 10]) ;; Use [¶] for EOL
		(tab-mark 9 [33 9])        ;; Use [!] for tabs
		(space-mark 32 [183])))    ;; Use [·] for spaces

(use-package flatland-theme
  :ensure t
  :config
  (load-theme 'flatland t))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-icon nil)
  (setq doom-modeline-minor-modes nil))

;; How wide a tab is, default 8.
(setq-default tab-width 4)

;; Two Callable functions for enabling/disabling tabs in Emacs
(defun disable-tabs ()
  (setq indent-tabs-mode nil))

(defun enable-tabs ()
  (local-set-key (kbd "TAB") 'tab-to-tab-stop)
  (setq indent-tabs-mode t))

;; Make the backspace properly erase the tab instead of removing one
;; space at a time.
(setq backward-delete-char-untabify-method 'hungry)

;; Insert brackets, parens, quotes in pair.
(electric-pair-mode t)
;; Any matching parenthesis is highlighted.
(show-paren-mode t)
(setq show-paren-delay 0)

(autoload 'View-scroll-half-page-forward "view")
(autoload 'View-scroll-half-page-backward "view")

(global-set-key (kbd "C-v") 'View-scroll-half-page-forward)
(global-set-key (kbd "M-v") 'View-scroll-half-page-backward)

(use-package ispell
  :ensure t
  :config
  (setq ispell-program-name "/usr/bin/hunspell")
  (setq ispell-dictionary "es_CO"))

(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-r"))
(global-set-key (kbd "C-z") 'undo-only)
(global-set-key (kbd "C-r") 'undo-redo)

(global-set-key (kbd "C-x k") 'kill-current-buffer)
(global-set-key (kbd "C-x K") 'kill-buffer-and-window)

(global-unset-key (kbd "C-x d"))
(global-set-key (kbd "C-x C-d") 'ido-dired)

(defun insert-current-date () (interactive)
   (insert (shell-command-to-string "echo -n $(date +'%a, %d %b %Y')")))

(defun xgm/clean ()
  (interactive)
  (progn (mapc 'kill-buffer (buffer-list))
		 (delete-other-windows)))

(defun xgm/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
		   (format "%.2f seconds"
				   (float-time
				   (time-subtract after-init-time before-init-time)))
		   gcs-done))

(add-hook 'emacs-startup-hook #'xgm/display-startup-time)

(use-package python-mode
  :hook
  (python-mode . lsp-deferred)
  (python-mode . xgm/pylsp-setup)
  (python-mode . tree-sitter-hl-mode))

(use-package pyvenv
  :config
  (pyvenv-mode 1))

(defun xgm/pylsp-setup ()
  ;; Style checking
  (setq lsp-pylsp-plugins-pydocstyle-enabled nil)
  (setq lsp-pylsp-plugins-pycodestyle-enabled t)
  ;; Error checkers
  (setq lsp-pylsp-plugins-pylint-enabled nil)
  (setq lsp-pylsp-plugins-flake8-enabled nil)
  (setq lsp-pylsp-plugins-pyflakes-enabled t)
  ;; Code formating
  (setq lsp-pylsp-plugins-autopep8-enabled nil)
  (setq lsp-pylsp-plugins-yapf-enabled nil)
  ;; Complexity checking
  (setq lsp-pylsp-plugins-mccabe-enabled nil))

(setq c-default-style "java")

(use-package org
  :config
  (setq org-ellipsis "")
  (setq org-startup-indented nil)
  (setq org-adapt-indentation nil)
  (setq org-hide-leading-stars nil)
  (setq org-return-follows-link t)
  (setq org-startup-folded t)
  (setq org-src-window-setup 'current-window)
  (setq org-hide-emphasis-markers t)
  (setq org-image-actual-width '(500))

  ;; AGENDA
  ;; ===========

  ;; List of files to be used for agenda
  (setq org-agenda-files '("~/org/agenda/" "~/org/agenda/trabajo/"))
  (setq org-archive-location (concat org-directory "/archive.org::"))
  ;; Do not show deadlines when the item is done.
  (setq org-agenda-skip-deadline-if-done t)
  ;; Use my date format by default
  (setq-default org-display-custom-times t)
  (setq org-time-stamp-custom-formats
	'("<%a, %d %b %Y>" . "<%a, %d %b %Y %H:%M>"))
  (setq org-todo-keywords
		'((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)" "CANCELED(c@)" "ARCHIVED(a@)")
		  (sequence "TO COMPLETE(c)" "PRACTICE AGAIN(p)" "|" "UNDERSTOOD(u)"))))
