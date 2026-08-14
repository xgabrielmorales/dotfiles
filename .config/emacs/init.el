(setq read-process-output-max (* 1024 1024 3)) ;; 3MiB

;; High during startup to avoid collections while loading packages,
;; moderate afterwards so no single collection is long enough to be
;; felt while typing.
(setq gc-cons-threshold (* 1024 1024 100)) ;; 100 MiB
(add-hook 'emacs-startup-hook
          (lambda () (setq gc-cons-threshold (* 1024 1024 20)))) ;; 20 MiB

(require 'package)

(setq package-archives
		'(("GNU ELPA" . "https://elpa.gnu.org/packages/")
		  ("NonGNU ELPA" . "https://elpa.nongnu.org/nongnu/")
		  ("MELPA" . "https://melpa.org/packages/")))

(package-initialize)
(unless package-archive-contents
	(package-refresh-contents))

;; Native-compile packages at install time instead of deferring it to
;; the first time they are loaded.
(setq package-native-compile t)

(setq use-package-always-ensure t)

(use-package diminish)

(use-package dired
	:ensure nil
	:commands (dired dired-jump)
	:bind (("C-x C-j" . dired-jump))
	:custom
	(dired-listing-switches "-FXAhgov --group-directories-first")
	;; Reuse a single dired buffer while navigating.
	(dired-kill-when-opening-new-dired-buffer t))

(defun project-root-or-home ()
	"Root of the current project, or $HOME when outside a project."
	(if-let ((p (project-current))) (project-root p) "~/"))

(defun dired-root ()
	"Open dired at the project root, or $HOME when outside a project."
	(interactive)
	(let ((default-directory (project-root-or-home)))
	  (call-interactively #'dired)))

(defun find-file-root ()
	"Find a file starting at the project root, or $HOME when outside a project."
	(interactive)
	(let ((default-directory (project-root-or-home)))
	  (call-interactively #'find-file)))

(use-package vertico
	:init (vertico-mode))

;; Sort candidates by history, persisted across sessions.
(use-package savehist
	:ensure nil
	:init (savehist-mode))

(use-package orderless
	:custom
	(completion-styles '(orderless basic))
	(completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
	:init (marginalia-mode))

(use-package consult
	:bind (("C-x b" . consult-buffer)
		   ("C-x C-b" . consult-buffer)
		   ("M-y" . consult-yank-pop)
		   ("M-g g" . consult-goto-line)
		   ("M-s l" . consult-line)
		   ("M-s r" . consult-ripgrep)))

(use-package which-key
	:ensure nil
	:init (which-key-mode)
	:diminish which-key-mode
	:config
	(setq which-key-idle-delay 1))

(setq major-mode-remap-alist
	  '((python-mode . python-ts-mode)
		  (sh-mode . bash-ts-mode)))

(add-to-list 'auto-mode-alist '("\\.ya?ml\\'" . yaml-ts-mode))
(add-to-list 'auto-mode-alist '("/Dockerfile\\'" . dockerfile-ts-mode))
(add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-ts-mode))

(use-package projectile
  :diminish projectile-mode
  :config	(projectile-mode)
  :bind-keymap ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/Documents")
    (setq projectile-project-search-path '("~/Documents"))))

(use-package magit
	:bind (("C-c C-g" . magit-status)
		   ("C-c M-g" . magit-dispatch)))

(use-package diff-hl
	:init (global-diff-hl-mode)
	:hook
	;; Update the fringe while editing, without waiting for a save.
	(after-init . diff-hl-flydiff-mode)
	;; Refresh after magit commits, stages and rebases.
	(magit-pre-refresh . diff-hl-magit-pre-refresh)
	(magit-post-refresh . diff-hl-magit-post-refresh)
	:bind (("C-c g p" . diff-hl-previous-hunk)
		   ("C-c g n" . diff-hl-next-hunk)
		   ("C-c g s" . diff-hl-stage-current-hunk)
		   ("C-c g u" . diff-hl-revert-hunk)
		   ("C-c g i" . diff-hl-show-hunk)))

(use-package editorconfig
	:ensure nil
	:init (editorconfig-mode 1)
	:diminish editorconfig-mode)

(use-package eglot
	:ensure nil
	:bind (:map eglot-mode-map
				("C-c l r" . eglot-rename)
				("C-c l a" . eglot-code-actions)
				("C-c l f" . eglot-format)
				("C-c l d" . eldoc-doc-buffer))
	:custom
	;; Do not pop documentation on its own, C-c l d asks for it.
	(eldoc-echo-area-use-multiline-p nil)
	;; Shut the server down when the last buffer using it is closed.
	(eglot-autoshutdown t)
	;; Do not block on the server while typing.
	(eglot-sync-connect nil)
	:config
	(add-to-list 'eglot-server-programs
				 '((python-mode python-ts-mode) . ("zuban" "server")))
	(add-to-list 'eglot-server-programs '(nix-ts-mode . ("nil"))))

(use-package flymake
	:ensure nil
	:hook (prog-mode . flymake-mode)
	:bind (:map flymake-mode-map
				("C-c f n" . flymake-goto-next-error)
				("C-c f p" . flymake-goto-prev-error)
				("C-c f l" . flymake-show-buffer-diagnostics)))

(use-package flymake-ruff
	:hook (eglot-managed-mode . flymake-ruff-load))

(use-package apheleia
	:diminish apheleia-mode
	:init (apheleia-global-mode 1))

(use-package corfu
	:init (global-corfu-mode)
	:hook (corfu-mode . corfu-popupinfo-mode)
	:bind (:map corfu-map
				("<tab>" . corfu-complete))
	:custom
	(corfu-auto t)
	(corfu-auto-delay 0.1)
	(corfu-auto-prefix 1)
	;; Keep the popup open when nothing matches, instead of falling back
	;; to the default completion buffer.
	(corfu-quit-no-match 'separator)
	;; Wait a bit longer before showing the documentation panel.
	(corfu-popupinfo-delay '(0.5 . 0.2)))

(use-package cape
	:init
	(add-hook 'completion-at-point-functions #'cape-file)
	(add-hook 'completion-at-point-functions #'cape-dabbrev))

(use-package ace-window
	:ensure t
	:bind (("C-x o" . ace-window)))

(use-package docker
  :ensure t
  :bind ("C-c d" . docker))

(use-package eat :ensure t :demand t)
(use-package claude-code
  :vc (:url "https://github.com/stevemolitor/claude-code.el" :rev :newest)
  :after eat
  :bind-keymap ("C-c c" . claude-code-command-map)
  :config
  (claude-code-mode))

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

;; Always keep a final newline
(setq require-final-newline t)

;; Fill column at 72
(setq-default fill-column 72)

;; No cursor in intactive windows
(setq-default cursor-in-non-selected-windows nil)

;; No confirmation for visiting non-existent files
(setq confirm-nonexistent-file-or-buffer nil)

;; Automatically open read-only files in view-mode
(setq view-read-only t)

;; UTF-8 as default encoding
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)

;; Revert buffer automaticaly if changed on disk
(global-auto-revert-mode t)

;; Truncate lines
(set-default 'truncate-lines t)

;; y/n for answering yes/no questions
(setq use-short-answers t)

;; Show lines numbers only in programming modes
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Code folding (C-c @ C-c toggle, C-c @ C-M-h fold all)
(add-hook 'prog-mode-hook 'hs-minor-mode)

;; Delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

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

(add-hook 'prog-mode-hook 'whitespace-mode)

(use-package monokai-theme
	:ensure t
	:config
	(load-theme 'monokai t))

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
;; Show the opening line in a child frame when it is off-screen.
(setq show-paren-context-when-offscreen 'child-frame)

(pixel-scroll-precision-mode 1)

(autoload 'View-scroll-half-page-forward "view")
(autoload 'View-scroll-half-page-backward "view")

(global-set-key (kbd "C-v") 'View-scroll-half-page-forward)
(global-set-key (kbd "M-v") 'View-scroll-half-page-backward)

(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-r"))
(global-set-key (kbd "C-z") 'undo-only)
(global-set-key (kbd "C-r") 'undo-redo)

(global-set-key (kbd "C-x k") 'kill-current-buffer)
(global-set-key (kbd "C-x K") 'kill-buffer-and-window)

(global-unset-key (kbd "C-x d"))
(global-set-key (kbd "C-x C-d") 'dired-root)
(global-set-key (kbd "C-c C-f") 'find-file-root)

(global-set-key (kbd "C-x |") 'toggle-window-split)

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
         (next-win-buffer (window-buffer (next-window)))
         (this-win-edges (window-edges (selected-window)))
         (next-win-edges (window-edges (next-window)))
         (this-win-2nd (not (and (<= (car this-win-edges)
                     (car next-win-edges))
                     (<= (cadr this-win-edges)
                     (cadr next-win-edges)))))
         (splitter
          (if (= (car this-win-edges)
             (car (window-edges (next-window))))
          'split-window-horizontally
        'split-window-vertically)))
    (delete-other-windows)
    (let ((first-win (selected-window)))
      (funcall splitter)
      (if this-win-2nd (other-window 1))
      (set-window-buffer (selected-window) this-win-buffer)
      (set-window-buffer (next-window) next-win-buffer)
      (select-window first-win)
      (if this-win-2nd (other-window 1))))))

(defun insert-current-date ()
  "Insert the current date at point, as \"Mon, 01 Jan 2025\"."
  (interactive)
  (insert (shell-command-to-string "echo -n $(date +'%a, %d %b %Y')")))

(defun xgm/clean ()
  "Kill all buffers and delete other windows."
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

(use-package python
  :ensure nil
  :hook (python-ts-mode . eglot-ensure))

(use-package pyvenv
  :config
  (pyvenv-mode 1))

(use-package terraform-mode
  :hook (terraform-mode . eglot-ensure))

(use-package markdown-mode
  :mode "\\.md\\'"
  :custom
  (markdown-command '("cmark-gfm" "-e" "table" "-e" "strikethrough" "-e" "tasklist")))

(use-package nix-ts-mode
  :mode "\\.nix\\'"
  :hook (nix-ts-mode . eglot-ensure))

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
