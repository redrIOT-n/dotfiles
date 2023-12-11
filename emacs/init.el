;; cleaning the startup


;;(set gc-cons-threshold '100000000)

(scroll-bar-mode -1)    ;disable scroll bar 
(tool-bar-mode -1)      ;disable tool bar 
(tooltip-mode -1)       ;disable tooltip 
(set-fringe-mode 10)    ;give some breathing room 
(menu-bar-mode -1)      ;disable menu bar 


(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)

;; visual 

;(setq visible-bell t)   ;disable visible bell 
;(set-face-attribute 'default nil :font "JetBrains Mono" :height 95 :weight 'semi-bold)
;(set-face-attribute 'default nil :font "Fira Code NF" :height 120 :weight 'bold)
;(set-face-attribute 'default nil :font "Source Code Pro" :height 130 :weight 'semi-bold)
(set-face-attribute 'default nil :font "Roboto Mono" :height 120 :weight 'normal)
;(set-face-attribute 'default nil :font "Hasklug Nerd Font" :height 120 :weight 'semi-bold)
;(set-face-attribute 'default nil :font "SpaceMono Nerd Font" :height 110)

;;line numbers
(column-number-mode)
(global-display-line-numbers-mode 1)

;;disable line numbers for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		vterm-mode-hook
		dired-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; make esc quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)


;; initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; initialize use-package
(unless (package-installed-p 'use-package)
 (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e" "ae426fc51c58ade49774264c17e666ea7f681d8cae62570630539be3d06fd964" "7ea883b13485f175d3075c72fceab701b5bf76b2076f024da50dff4107d0db25" "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "ce4234c32262924c1d2f43e6b61312634938777071f1129c7cde3ebd4a3028da" "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b" "246a9596178bb806c5f41e5b571546bb6e0f4bd41a9da0df5dfbca7ec6e2250c" default))
 '(package-selected-packages
   '(clang-format+ projectile ivy-rich ivy-avy general evil-tabs evil-collection smooth-scrolling evil which-key ghub doom-modeline doom-themes hydra counsel ivy command-log-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; packages
(use-package command-log-mode)

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history)))

;; doom themes
(use-package doom-themes
  :init (load-theme 'doom-one))
  
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  (setq doom-modeline-github nil)
  (setq doom-modeline-minor-modes nil)
  (setq doom-modeline-minor-mode-icon t)
  (setq doom-modeline-project-detection 'auto)
  (setq doom-modeline-lsp t))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package hl-todo)
(use-package treemacs)

;;(add-to-list 'load-path "~/repos/zen-mode/")
;;(require 'zen-mode)


;;(use-package clang-format+)
(use-package vterm)

;which key
(use-package which-key
  :init (which-key-mode)
  :diminish 
  :config
  (setq which-key--idle-delay 0.1))

;ivy
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :diminish
  :init
  (ivy-rich-mode 1)
  :config
  (setq ivy-format-function #'ivy-format-function-line))
;;  (setq ivy-rich--display-transformers-list
;;        (plist-put ivy-rich--display-transformers-list
;;                   'ivy-switch-buffer
;;                   '(:columns
;;                     ((ivy-rich-candidate (:width 40))
;;                      (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right)); return the buffer indicators
;;                      (ivy-rich-switch-buffer-major-mode (:width 12 :face warning))          ; return the major mode info
;;                      (ivy-rich-switch-buffer-project (:width 15 :face success))             ; return project name using `projectile'
;;                      (ivy-rich-switch-buffer-path (:width (lambda (x) (ivy-rich-switch-buffer-shorten-path x (ivy-rich-minibuffer-width 0.3))))))  ; return file path relative to project root or `default-directory' if project is nil
;;                     :predicate
;;                     (lambda (cand)
;;                       (if-let ((buffer (get-buffer cand)))
;;                           ;; Don't mess with EXWM buffers
;;                           (with-current-buffer buffer
;;                             (not (derived-mode-p 'exwm-mode)))))))))

(use-package smooth-scrolling
 :ensure t 
 :init 
 :config 
 (smooth-scrolling-mode 1))

(smooth-scrolling-mode 1)
(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

(use-package general
  :config
  (general-evil-setup t)

  (general-create-definer rune/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC"))

(rune/leader-keys
  "t"  '(:ignore t :which-key "toggles")
  "tt" '(counsel-load-theme :which-key "choose theme")
  "tz" '(zen-mode :which-key "zen-mode")
  "tv" '(vterm :which-key "open vterm")
  "te" '(eshell :which-key "open eshell")
  "ts" '(tree-sitter-debug-mode :which-key "tree-sitter syntax tree")
  "th" '(tree-sitter-hl-mode :which-key "tree-sitter highlighting")
  "b"  '(:ignore b :which-key "buffers")
  "bb" '(counsel-switch-buffer :which-key "switch buffer")
  "bB" '(ibuffer :which-key "list-buffers")
  "m"  '(:ignore m :which-key "bookmarks")
  "mm" '(counsel-bookmark :which-key "bookmark")
  "ms" '(bookmark-set :which-key "bookmark-set")
  "mj" '(bookmark-jump :which-key "bookmark-jump")
  "w"  '(evil-window-map :which-key "windows"))
;;  "p"  '(projectile-command-map :which-key "projects")
;;  "l"  '(lsp-keymap-prefix :which-key "lsp-mode"))

  
(defun rune/evil-hook ()
  (dolist (mode '(custom-mode
                  eshell-mode
                  git-rebase-mode
                  erc-mode
                  circe-server-mode
                  circe-chat-mode
                  circe-query-mode
                  sauron-mode
                  term-mode))
   (add-to-list 'evil-emacs-state-modes mode)))


(setq-default tab-width 4
			  c-basic-offset 4
			  indent-tabs-mode t)

;;(add-hook 'c-mode-common-hook '(lambda () (c-toggle-auto-state 0)))

(use-package smart-tabs-mode
 :ensure t 
 :commands (smart-tabs-mode)
 :config
 (smart-tabs-insinuate 'c 'c++ 'java 'python))



(use-package evil 
 :ensure t 
 :init 
 (setq evil-want-keybinding nil)
 (setq evil-want-integration t)
 (setq evil-want-fine-undo 'fine)
 (setq evil-shift-width 4)
 (setq evil-auto-indent t)
 (setq evil-tab-width 4)
 (setq evil-tabs-mode t)
 (setq evil-tab-stop 4)
 :config
 (evil-mode 1)
 (evil-set-initial-state 'dashboard-mode 'normal)
 ;; ;; window mapping 
 (define-key evil-window-map (kbd "<left>") 'evil-window-left)
 (define-key evil-window-map (kbd "<right>") 'evil-window-right)
 (define-key evil-window-map (kbd "<up>") 'evil-window-up)
 (define-key evil-window-map (kbd "<down>") 'evil-window-down))

(add-to-list 'load-path "~/Packages/evil-leader/")
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
 "." #'counsel-find-file)

;;(defvar my-leader-map (make-sparse-keymap)
;;  "Keymap for \"leader key\" shortcuts.")

;;(general-nmap
;;  :prefix "b"
;;  :prefix-map 'buffer
;;    "." #'counsel-find-file
;;    "bB" #'list-buffers
;;    "bb" #'counsel-switch-buffer
;;    "bm" #'counsel-bookmark
;;    "w" #'evil-window-map
;;    "t" #'list-tags)

(use-package evil-collection
 :after evil 
 :ensure t 
 :config 
 (evil-collection-init))

(use-package evil-tabs
 :after evil 
 :ensure t 
 :config 
 (global-evil-tabs-mode t))

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-p" . projectile-command-map)
  :init
  (when (file-directory-p "~/repos/")
    (setq projectile-project-search-path '("~/repos/")))
  (setq projectile-switch-project-action #'projectile-dired))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(use-package tree-sitter)
(use-package tree-sitter-langs)

;; lsp mode 
(use-package lsp-mode
  :ensure t
  :commands lsp
  :custom
  ;; what to use when checking on-save. "check" is default, I prefer clippy
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.6)
  ;; enable / disable the hints as you prefer:
  (lsp-rust-analyzer-server-display-inlay-hints t)
  (lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
  (lsp-rust-analyzer-display-chaining-hints t)
  (lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
  (lsp-rust-analyzer-display-closure-return-type-hints t)
  (lsp-rust-analyzer-display-parameter-hints nil)
  (lsp-rust-analyzer-display-reborrow-hints nil)
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  (add-hook 'lsp-mode-hook 'lsp-ivy)
  (add-hook 'lsp-mode-hook 'lsp-treemacs))


(with-eval-after-load 'lsp-mode
  (evil-leader/set-key
	"l" #'lsp-command-map)
    "p" #'projectile-command-map)

(with-eval-after-load 'lsp-mode
  (lsp-completion-mode 1))


(use-package lsp-ui
  :ensure
  :commands lsp-ui-mode)
;;  :custom
;;  (lsp-ui-peek-always-show f)
;;  (lsp-ui-sideline-show-hover f)
;;  (lsp-ui-doc-enable nil))

(use-package lsp-ivy)
(use-package lsp-treemacs)
(use-package yasnippet)
(use-package dap-mode)

(use-package company
  :after lsp-mode
  :hook (prog-mode . company-mode)
  :bind (:map company-active-map
	      ("<RET>" . company-complete-selection))		    
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package company-box
  :hook (company-mode . company-box-mode))

(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      lsp-display-delay 0.1)

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode))

;; installing tide
(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))

;; rust
(use-package rustic
  :ensure
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status)
              ("C-c C-c e" . lsp-rust-analyzer-expand-macro)
              ("C-c C-c d" . dap-hydra)
              ("C-c C-c h" . lsp-ui-doc-glance))
  :config
  ;; uncomment for less flashiness
  ;; (setq lsp-eldoc-hook nil)
  ;; (setq lsp-enable-symbol-highlighting nil)
  ;; (setq lsp-signature-auto-activate nil)

  ;; comment to disable rustfmt on save
  (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook))

(defun rk/rustic-mode-hook ()
  ;; so that run C-c C-c C-r works without having to confirm, but don't try to
  ;; save rust buffers that are not file visiting. Once
  ;; https://github.com/brotzeit/rustic/issues/253 has been resolved this should
  ;; no longer be necessary.
  (when buffer-file-name
    (setq-local buffer-save-without-query t))
  (add-hook 'before-save-hook 'lsp-format-buffer nil t))

;; vala
(add-to-list 'load-path "/home/rxored/Packages/vala-mode/")
(autoload 'vala-mode "vala-mode" "Major mode for editing Vala code." t)
(add-to-list 'auto-mode-alist '("\\.vala$" . vala-mode))
(add-to-list 'auto-mode-alist '("\\.vapi$" . vala-mode))
(add-to-list 'file-coding-system-alist '("\\.vala$" . utf-8))
(add-to-list 'file-coding-system-alist '("\\.vapi$" . utf-8))


;; go
(add-to-list 'load-path "/home/rxored/Packages/go-mode.el")
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

;; Go - lsp-mode
;; Set up before-save hooks to format buffer and add/delete imports.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; Start LSP Mode and YASnippet mode
(add-hook 'go-mode-hook #'lsp-deferred)
(add-hook 'go-mode-hook #'yas-minor-mode)

;; elixir

(use-package elixir-mode
  :ensure t
  :init  
  (add-hook 'elixir-mode-hook
            (lambda ()
              (push '(">=" . ?\u2265) prettify-symbols-alist)
              (push '("<=" . ?\u2264) prettify-symbols-alist)
              (push '("!=" . ?\u2260) prettify-symbols-alist)
              (push '("==" . ?\u2A75) prettify-symbols-alist)
              (push '("=~" . ?\u2245) prettify-symbols-alist)
              (push '("<-" . ?\u2190) prettify-symbols-alist)
              (push '("->" . ?\u2192) prettify-symbols-alist)
              (push '("<-" . ?\u2190) prettify-symbols-alist)
              (push '("|>" . ?\u25B7) prettify-symbols-alist))))

(use-package reformatter
  :ensure t
  :config
  ; Adds a reformatter configuration called "+elixir-format"
  ; This uses "mix format -"
  (reformatter-define +elixir-format
    :program "mix"
    :args '("format" "-"))
  ; defines a function that looks for the .formatter.exs file used by mix format
  (defun +set-default-directory-to-mix-project-root (original-fun &rest args)
    (if-let* ((mix-project-root (and buffer-file-name
                                     (locate-dominating-file buffer-file-name
                                                             ".formatter.exs"))))
        (let ((default-directory mix-project-root))
          (apply original-fun args))
      (apply original-fun args)))
  ; adds an advice to the generated function +elxir-format-region that sets the proper root dir
  ; mix format needs to be run from the root directory otherwise it wont use the formatter configuration
  (advice-add '+elixir-format-region :around #'+set-default-directory-to-mix-project-root)
  ; Adds a hook to the major-mode that will add the generated function +elixir-format-on-save-mode
  ; So, every time we save an elixir file it will try to find a .formatter.exs and then run mix format from
  ; that file's directory
  (add-hook 'elixir-mode-hook #'+elixir-format-on-save-mode))
