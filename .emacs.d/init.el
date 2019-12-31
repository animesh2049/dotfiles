;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'package-archives
	     '("melpa" .  "http://melpa.milkbox.net/packages/") t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (markdown-mode go-eldoc go-dlv git-blamed diff-hl multiple-cursors autopair neotree go-autocomplete auto-complete exec-path-from-shell go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setenv "GOPATH" "/home/animesh/go")
(setenv "work" "/home/animesh/go/src/github.com/dgraph-io/dgraph")
(add-to-list 'exec-path "/home/animesh/go/bin")
(add-to-list 'exec-path "/usr/local/go/bin")
(exec-path-from-shell-copy-env "PATH")
(add-hook 'before-save-hook 'gofmt-before-save)

(defun auto-complete-for-go ()
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)

(with-eval-after-load 'go-mode
   (require 'go-autocomplete))

(defun my-go-mode-hook ()
  ; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'godef-jump-other-window)
  (local-set-key (kbd "M-p") 'compile)            ; Invoke compiler
  (local-set-key (kbd "M-P") 'recompile)          ; Redo most recent compile cmd
  (local-set-key (kbd "M-]") 'next-error)         ; Go to next error (or msg)
  (local-set-key (kbd "M-[") 'previous-error)     ; Go to previous error or msg
  (go-guru-hl-identifier-mode)
  (go-eldoc-setup)
)
(add-hook 'go-mode-hook 'my-go-mode-hook)

(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-x C-s") 'isearch-forward)
(global-set-key (kbd "S-SPC") 'backward-delete-char-untabify)
(global-set-key (kbd "M-k") 'kill-whole-line)
(global-set-key (kbd "S-SPC") 'backward-delete-char-untabify)

(require 'auto-complete)
(global-auto-complete-mode t)
(global-linum-mode t)
(column-number-mode)
(require 'autopair)
(autopair-global-mode)
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'go-guru)
(diff-hl-flydiff-mode)
(desktop-save-mode 1)

(setq backup-directory-alist `(("." . "~/.saves")))
(ac-config-default)
(tool-bar-mode -1)                  ; Disable the button bar atop screen
(scroll-bar-mode -1)                ; Disable scroll bar
(setq inhibit-startup-screen t)     ; Disable startup screen with graphics
(set-default-font "Monaco 12")      ; Set font and size
(setq ring-bell-function 'ignore)   ; Disable super annoying audio bell
(show-paren-mode t)
(neotree)
(neotree-dir "/home/animesh/go/src/github.com/dgraph-io/dgraph")
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
;; (setq scroll-conservatively 0)
(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)
(require 'whitespace)
(setq whitespace-line-column 100) ;; limit line length
(setq whitespace-style '(face lines-tail))

(add-hook 'prog-mode-hook 'whitespace-mode)
(global-auto-revert-mode t)
