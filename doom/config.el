;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "rxOred"
      user-mail-address "rxored@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)
(setq doom-theme 'doom-one)

;;(setq doom-font (font-spec :family "Hurmit Nerd Font" :size 11 :weight 'semi-bold)
;;(setq doom-font (font-spec :family "Source Code Pro" :size 11 :weight 'semi-bold)
;;(setq doom-font (font-spec :family "Hack Nerd Font" :size 11 :weight 'bold)
;;(setq doom-font (font-spec :family "Roboto Mono Medium for Powerline" :size 11 :weight 'semi-bold)
(setq doom-font (font-spec :family "JetBrains Mono" :size 11 :weight 'semi-bold)
;;(setq doom-font (font-spec :family "Space Mono for Powerline" :size 11 :weight 'light)
      doom-variable-pitch-font (font-spec :family "sans" :size 11))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(custom-set-faces!
  '(font-lock-comment-face :bold)
  `(font-lock-keyword-face :bold))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(add-hook! 'org-mode-hook' #'mixed-pitch-mode)
(add-hook! 'org-mode-hook' #'solaire-mode)
;;(setq mixed-pitch-variable-pitch-cursor nil)

(after! evil
  (setq evil-magic nil))

;; Takes a major-mode, a quoted hook function or a list of either
(add-hook! python-mode
  (setq python-shell-interpreter "bpython"))

;; These are equivalent
(setq-hook! 'python-mode-hook python-indent-offset 2)
(setq-hook! python-mode python-indent-offset 2)

(use-package! hl-todo
  ;; if you omit :defer, :hook, :commands, or :after, then the package is loaded
  ;; immediately. By using :hook here, the `hl-todo` package won't be loaded
  ;; until prog-mode-hook is triggered (by activating a major mode derived from
  ;; it, e.g. python-mode)
  :hook (prog-mode . hl-todo-mode)
  :init
  ;; code here will run immediately
  :config
  ;; code here will run after the package is loaded
  (setq hl-todo-highlight-punctuation ":"))

(map! :map evil-window-map
      "SPC" #'rotate-layout
      ;; Navigation
      "<left>"     #'evil-window-left
      "<down>"     #'evil-window-down
      "<up>"       #'evil-window-up
      "<right>"    #'evil-window-right
      ;; Swapping windows
      "C-<left>"       #'+evil/window-move-left
      "C-<down>"       #'+evil/window-move-down
      "C-<up>"         #'+evil/window-move-up
      "C-<right>"      #'+evil/window-move-right)

;;(after! eglot
;;  :config
;;  (set-eglot-client! 'cc-mode '("clangd" "-j=3" "--clang-tidy"))
;;)
(setq lsp-clients-clangd-args '("-j=3"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"
                                "--header-insertion-decorators=0"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))

;;(let ((map company-active-map))
;;   (define-key map (kbd "<tab>") 'company-complete-selection)
;;   (define-key map (kbd "RET") 'nil))

(map! :mode company-tng
      :desc "complete selection"
      "RET" #'company-complete-selection)
