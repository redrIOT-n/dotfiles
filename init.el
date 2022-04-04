;; cleaning the startup
;;(setq inhibit-startup-message t)

;;(set gc-cons-threshold '100000000)

(scroll-bar-mode -1)    ;disable scroll bar 
(tool-bar-mode -1)      ;disable tool bar 
(tooltip-mode -1)       ;disable tooltip 
(set-fringe-mode 10)    ;give some breathing room 
(menu-bar-mode -1)      ;disable menu bar 


;; visual 

;(setq visible-bell t)   ;disable visible bell 
(set-face-attribute 'default nil :font "JetBrains Mono" :height 80 :weight 'semi-bold)

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
   '("246a9596178bb806c5f41e5b571546bb6e0f4bd41a9da0df5dfbca7ec6e2250c" default))
 '(package-selected-packages
   '(clang-format+ projectile ivy-rich ivy-avy general evil-tabs evil-collection smooth-scrolling evil which-key rainbow-delimiters rainbow-delimeters ghub doom-modeline doom-themes hydra counsel ivy command-log-mode use-package)))
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
  :init (load-theme 'doom-one-light t))
  
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

(add-to-list 'load-path "~/repos/zen-mode/")
(require 'zen-mode)

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

(add-to-list 'load-path "~/repos/evil-leader/")
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
 "." #'counsel-find-file)

(with-eval-after-load 'lsp-mode
  (evil-leader/set-key
	"l" #'lsp-command-map)
    "p" #'projectile-command-map)

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
 :commands (lsp lsp-deferred)
;; :hook (lsp-mode . efs/lsp-mode-setup)
 :init 
 (setq lsp-keymap-prefix "C-l")
 :config 
 (lsp-enable-which-key-integration t))

(use-package lsp-ui)
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


;; user defined functions

;; refactoring - converting to underscore
(defun to-underscore () (interactive)
	   (progn (replace-regexp "\\([A-Z]\\)" "_\\1" nil (region-beginning) (region-end))
			  (downcase-region (region-beginning) (region-end))))
