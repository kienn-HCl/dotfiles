; GUIのボタンで追加された設定の保存場所を変更
(setq custom-file (locate-user-emacs-file "cutom.el"))
(load custom-file :no-error-if-file-is-missing)

(global-hl-line-mode t)
(setq-default show-trailing-whitespace t)

(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(setq ring-bell-function 'ignore)

;(setq auto-save-default nil)

(setq backup-directory-alist '((".*" . "~/.cache/emacs/backup")))

(global-auto-revert-mode 1)

(setq scroll-conservatively 1)

(require 'package)
(package-initialize)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

; use-packageの設定
(when (< emacs-major-version 29)
  (unless (package-installed-p 'use-package)
    (unless package-archive-contents
      (package-refresh-contents))
    (package-install 'use-package)))

; 開発者向けの警告メッセージを非表示
(add-to-list 'display-buffer-alist
	     '("\\`\\*\\(Warnings\\|Compile-Log\\)\\*\\'"
	       (display-buffer-no-window)
	       (allow-no-window . t)))

; 文字選択にしているときに文字入力があったら選択文字を削除して挿入
(use-package delsel
  :ensure nil
  :hook
  (after-init . delete-selection-mode))

; 見た目関連
(use-package gruvbox-theme
  :ensure nil
  :config
  (load-theme 'gruvbox-light-medium :no-confirm-loading))

(use-package whitespace
  :ensure nil
  :config
  (setq whitespace-display-mappings
	'((tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))
  (setq whitespace-style '(face tabs tab-mark))
  (global-whitespace-mode 1)
  (setq whitespace-style '(face trailing tabs tab-mark)))

(use-package rainbow-delimiters
  :ensure nil
  :hook
  (prog-mode . rainbow-delimiters-mode))

; font
(use-package nerd-icons
  :ensure nil)
(use-package nerd-icons-completion
  :ensure nil
  :after marginalia
  :config
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))
(use-package nerd-icons-corfu
  :ensure nil
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))
(use-package nerd-icons-dired
  :ensure nil
  :hook
  (dired-mode . nerd-icons-dired-mode))

; minibuffer etc
(use-package vertico
  :ensure nil
  :hook (after-init . vertico-mode))
(use-package marginalia
  :ensure nil
  :hook (after-init . marginalia-mode))
(use-package orderless
  :ensure nil
  :config
  (setq completion-styles '(orderless basic))
  (setq completion-category-defaults nil)
  (setq completion-category-overrides nil))
(use-package savehist
  :ensure nil
  :hook (after-init . savehist-mode))
(use-package corfu
  :ensure nil
  :hook (after-init . global-corfu-mode)
  :bind (:map corfu-map ("<tab>" . corfu-complete))
  :config
  (setq tab-always-indent 'complete)
  (setq corfu-preview-current nil)
  (setq corfu-min-width 20)

  (setq corfu-popupinfo-delay '(1.25 . 0.5))
  (corfu-popupinfo-mode 1)

  (with-eval-after-load 'savehist
    (corfu-history-mode 1)
    (add-to-list 'savehist-additional-variables 'corfu-history)))

; dired file manager
(use-package dired
  :ensure nil
  :commands (dired)
  :hook
  (;(dired-mode . dired-hide-details-mode)
   (dired-mode . hl-line-mode))
  :config
  (setq dired-recursive-copies 'always)
  (setq dired-recursive-deletes 'always)
  (setq delete-by-moving-to-trash t)
  (setq dired-dwim-target t))
(use-package dired-subtree
  :ensure nil
  :after dired
  :bind
  ( :map dired-mode-map
    ("<Tab>" . dired-subtree-toggle)
    ("Tab" . dired-subtree-toggle)
    ("<backtab>" . dired-subtree-remove)
    ("S-TAB" . dired-subtree-remove))
  :config
  (setq dired-subtree-use-backgrounds nil))
(use-package trashed
  :ensure nil
  :commands (trashed)
  :config
  (setq trashed-action-confirm 'y-or-n-p)
  (setq trashed-use-header-line t)
  (setq trashed-sort-key '("Date deleted" . t))
  (setq trashed-date-format "%Y-%m-%d %H:%M:%S"))

(use-package which-key
  :hook
  (after-init . which-key-mode))

(use-package undo-tree
  :ensure nil
  :hook
  (after-init . global-undo-tree-mode)
  :config
  (setq undo-tree-visualizer-diff t
	undo-tree-visualizer-timestamps t
	undo-limit 800000
	undo-strong-limit 12000000
	undo-outer-limit 120000000
	undo-tree-history-directory-alist '(("." . "~/.cache/emacs/undo"))))

(use-package key-chord
  :ensure nil
  :hook
  (after-init . key-chord-mode))

(use-package evil
  :ensure nil
  :hook
  (after-init . evil-mode)
  :config
  (evil-set-undo-system 'undo-tree)
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  (evil-define-key 'normal 'global (kbd "<leader> u") 'undo-tree-visualize)
  (evil-define-key 'normal lsp-mode-map
                   (kbd "gr") 'lsp-find-references
                   (kbd "<leader> a") 'lsp-execute-code-action
                   (kbd "<leader> n") 'lsp-rename
                   (kbd "gI") 'lsp-find-implementation
                   (kbd "<leader> f b") 'lsp-format-buffer)
  (defun lsp-describe-and-jump ()
  "Show hover documentation and jump to *lsp-help* buffer."
  (interactive)
  (lsp-describe-thing-at-point)
  (let ((help-buffer "*lsp-help*"))
    (when (get-buffer help-buffer)
      (switch-to-buffer-other-window help-buffer))))

  (evil-define-key 'normal 'global (kbd "K")
    (if (>= emacs-major-version 31)
        #'eldoc-box-help-at-point
        #'ek/lsp-describe-and-jump))
  (evil-define-key 'normal 'global (kbd "gcc")
                   (lambda ()
                     (interactive)
                     (if (not (use-region-p))
                         (comment-or-uncomment-region (line-beginning-position) (line-end-position)))))
  (evil-define-key 'visual 'global (kbd "gc")
                   (lambda ()
                     (interactive)
                     (if (use-region-p)
                         (comment-or-uncomment-region (region-beginning) (region-end))))))

(use-package evil-surround
  :ensure nil
  :hook
  (evil-mode . global-evil-surround-mode))

(use-package evil-matchit
  :ensure nil
  :hook
  (evil-mode . global-evil-matchit-mode))

(use-package magit
  :ensure nil
  :bind
  (("C-x g" . mgit-status)
   ("C-x M-g" . magit-dispatch-pupup))
  :config
  (defun mu-magit-kill-buffers ()
    "Restore window configuration and kill all Magit buffers."
    (interactive)
    (let ((buffers (magit-mode-get-buffers)))
      (magit-restore-window-configuration)
      (mapc #'kill-buffer buffers)))
  (bind-key "q" #'mu-magit-kill-buffers magit-status-mode-map))

(use-package org
  :ensure nil
  :config
  (setq org-directory "~/org")
  (setq org-default-notes-file "notes.org")
  (setq org-startup-truncade nil))
(use-package org-capture
  :ensure nil
  :after org
  :config
  (setq org-capture-templates
	'(("m" "Memo" entry (file+datetree "~/org/memo.org")
	   "* %<%H:%M:%S>\n%?\n")
	  ("t" "Todo" entry (file+headline "~/org/task.org" "Tasks")
	   "** TODO %? \n")
	  ("s" "Schedule" entry (file+headline "~/org/task.org" "Tasks")
           "** TODO %? \n SCHEDULED: %^t \n")))
  :bind
  (("C-c c" . org-capture)))
(use-package org-agenda
  :ensure nil
  :after org
  :config
  (setq org-agenda-files (list org-directory))
  :bind
  (("C-c a" . org-agenda)))

(use-package eglot
  :ensure nil
  :bind
  (:map eglot-mode-map
        ("C-c r" . 'eglot-rename)
        ("C-c f" . 'eglot-format)
        ("C-c a" . 'eglot-code-actions)
        ("C-c o" . 'eglot-code-action-organize-imports)
        ("C-c q" . 'eglot-code-action-quickfix)
        ("C-c e" . 'eglot-code-action-extract)
        ("C-c i" . 'eglot-code-action-inline)
        ("C-c w" . 'eglot-code-action-rewrite)
        ("C-c m" . 'eglot-inlay-hints-mode)
        ("C-c h" . 'eldoc))
  :hook
  ((c-mode c++-mode latex-mode tex-mode) . eglot-ensure))
(use-package company
  :ensure nil
  :init
  (global-company-mode)
  :config
  (setq company-idle-delay 0.3)
  (setq company-minimum-prefix-length 1)
  (setq company-transformers '(company-sort-by-occurrence))
  :bind
  (("M-<tab>" . company-complete)
   :map company-active-map
              ("C-n". company-select-next)
              ("C-p". company-select-previous)
              ("M-<". company-select-first)
              ("M->". company-select-last)))
