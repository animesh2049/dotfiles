(setenv "GOPATH" "/home/animesh/go")
(add-to-list 'exec-path "/home/animesh/go/bin")
(add-to-list 'exec-path "/usr/local/go/bin")
(exec-path-from-shell-copy-env "PATH")

(use-package go-mode
  :config
  (use-package go-projectile)
  (use-package go-autocomplete)
  (use-package godoctor)
  (use-package flymake-go)

  ;; golint support
  (let ((golint-path (concat (expand-file-name "~/go")
                 "/src/github.com/golang/lint/misc/emacs")))
    (if (not (file-exists-p golint-path))
    (progn
      (start-process "go-get-golint" nil
             "go" "get" "-u" "github.com/golang/lint/golint")))
    (add-to-list 'load-path golint-path)
    (require 'golint))

  ;; go-expanderr support
  (let ((go-expanderr-path (concat (expand-file-name "~/go")
                 "/src/github.com/stapelberg/expanderr/lisp/go-expanderr.el")))
    (if (not (file-exists-p go-expanderr-path))
    (progn
      (start-process "go-get-expanderr" nil
             "go" "get" "-u" "github.com/stapelberg/expanderr")))
    (load "~/go/src/github.com/stapelberg/expanderr/lisp/go-expanderr.el"))


  (defun my-go-mode-hook ()
    (setq gofmt-command "goimports")
    (subword-mode t)
    (setq tab-width 4)
    (add-hook 'before-save-hook 'gofmt-before-save)
    (auto-complete-mode nil)
    (with-eval-after-load 'go-mode
      (require 'go-autocomplete)
      (require 'godoctor)
      (require 'go-guru)
      (require 'go-eldoc)
      (require 'flymake-go)
      (go-eldoc-setup)
      (go-guru-hl-identifier-mode)
      (local-set-key (kbd "M-.") 'godef-jump)
      (local-set-key (kbd "M-*") 'godef-jump-other-window)
      (local-set-key (kbd "M-p") 'compile)
      (local-set-key (kbd "M-p") 'recompile)
      (local-set-key (kbd "M-]") 'next-error)
      (local-set-key (kbd "M-[") 'previous-error)
      (if (not (string-match "go" compile-command))
	  (set (make-local-variable 'compile-command)
	       "go build -v && go test -v && go vet"))
      ))
  (add-hook 'go-mode-hook 'my-go-mode-hook))
