(setq inhibit-startup-message t)
(setq backup-directory-alist `(("." . "~/.saves")))

(scroll-bar-mode -1)  ;; Disable visible scrollbar
(tool-bar-mode -1)    ;; Disable the toolbar
(tooltip-mode -1)     ;; Disable tooltips
(set-fringe-mode 10)  
(menu-bar-mode -1)    ;; Disable menu bar
(setq ring-bell-function 'ignore)
(desktop-save-mode 1)
(show-paren-mode t)
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)
(column-number-mode)
(global-display-line-numbers-mode t)

(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda() (display-line-numbers-mode 0))))

;;(setq visible-bell t) ;; Enable visual bell

(set-face-attribute 'default nil :font "Fira Code Retina" :height 130)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package ivy
  :diminish ivy-mode
  :bind (("C-s" . swiper))
  :init
  (ivy-mode 1))

;;(use-package rainbow-delimiters
;;  :hook (prog-mode . rainbow-delimiters-mode))

(use-package autopair
  :diminish autopair-mode
  :init (autopair-global-mode t))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package ivy-rich
  :diminish ivy-rich-mode
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :diminish counsel-mode
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . counsel-minibuffer-history)))

(use-package atom-one-dark-theme
  :init (load-theme 'atom-one-dark t)) ;; Load tango dark theme

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/go/src/")
    (setq projectile-project-search-path '("~/go/src/")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :diminish counsel-projectile-mode
  :config (counsel-projectile-mode))

(use-package magit
  :custom
  (magit-display-buffer-function #'maggit-display-buffer-same-except-diff-v1))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package auto-complete
  :init (global-auto-complete-mode t))

;; Keybindings
(global-set-key (kbd "S-SPC") 'backward-delete-char-untabify)
(global-set-key (kbd "M-k") 'kill-whole-line)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (go-eldoc go-guru flymake-go go-autocomplete auto-complete auto-complete-mode goflymake go-mode helpful which-key use-package rainbow-delimiters magit ivy-rich counsel-projectile autopair atom-one-dark-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(load-file "~/.emacs.d/cpp_conf.el")
(load-file "~/.emacs.d/go_conf.el")
