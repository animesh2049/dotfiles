(setenv "GOPATH" "/home/animesh/go")
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
					; Call gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
					; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
	   "go build -v && go test -v && go vet"))
					; godef jump key bindings
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'godef-jump-other-window)
  (local-set-key (kbd "M-p") 'compile)
  (local-set-key (kbd "M-p") 'recompile)
  (local-set-key (kbd "M-]") 'next-error)
  (local-set-key (kbd "M-[") 'previous-error)
  (go-guru-hl-identifier-mode)
  (go-eldoc-setup)
 )

(add-hook 'go-mode-hook 'my-go-mode-hook)

(require 'go-guru)
(desktop-save-mode 1)

(use-package flymake-go)
