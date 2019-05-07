(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-scratch-message nil)
 '(js3-allow-keywords-as-property-names nil)
 '(js3-auto-indent-p nil)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(package-selected-packages
   (quote
    (multiple-cursors fuzzy auto-complete drag-stuff autopair)))
 '(show-paren-mode t)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans" :foundry "PfEd" :slant normal :weight normal :height 158 :width normal)))))

(add-to-list 'load-path "~/.emacs.d/elpa/drag-stuff-20161107.2349")
(require 'drag-stuff)
(drag-stuff-global-mode t)
(global-set-key (kbd "M-p") 'drag-stuff-up)
(global-set-key (kbd "M-n") 'drag-stuff-down)

;(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20170124.1845")
;(require 'auto-complete)
;(global-auto-complete-mode t)
;(ac-config-default)

(global-set-key (kbd "S-SPC") 'backward-delete-char-untabify)
(global-set-key (kbd "M-g") 'beginning-of-buffer)
(global-set-key (kbd "M-h") 'end-of-buffer)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-x C-s") 'isearch-forward)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )
(setq url-proxy-services '(("no_proxy" . " localhost, 127.0.0.1, iiit.ac.in, .iiit.ac.in, iiit.net, .iiit.net, 172.16.0.0/12, 192.168.0.0/16, 10.0.0.0/8,regol.iiit.ac.in")
                           ("http" . "proxy.iiit.ac.in:8080")))

(require 'autopair)
(autopair-global-mode)

;; (yafolding-mode)
;; (global-set-key (kbd "C-M-;") 'yafolding-hide-element)
;; (global-set-key (kbd "C-M-'") 'yafolding-show-element)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(setq warning-minimum-level :emergency)
;;(setq-default indent-tabs-mode nil)

;; (require 'web-mode)
;; (defun my-web-mode-hook ()
;;   "Hooks for Web mode."
;;   (setq web-mode-markup-indent-offset 1)
;;   )
;; (add-hook 'web-mode-hook 'my-web-mode-hook)
;; (add-hook 'java-mode-hook (lambda()
;; 			    (setq c-basic-offset 2)))

(add-hook 'c++-mode-hook '(lambda() (when (empty-buffer?) (insert-c++-template))))

(defun empty-buffer? () (= (buffer-end 1) (buffer-end -1)))

(defun insert-c++-template ()
  (interactive)
  (insert "#include <bits/stdc++.h>
using namespace std;

#define ll long long
#define fr(i, n) for(int i=0;i<n;i++)
#define forall(i, j, n) for(int i=j; i<n; i++)
#define all(c) c.begin(), c.end()
#define tr(container, it) for (__typeof(container.begin()) it = container.begin(); it != container.end(); it++)
#define rt(container, it) for (__typeof(container.rbegin()) it = container.rbegin(); it != container.rend(); it++)
#define present(container, element) (container.find(element) != container.end())
#define cpresetn(container, element) (find(all(container)), element) != container.end())
#define sz(a) int((a).size())
#define pb(a) push_back(a)
#define si(n) scanf(\"%d\", &n)
#define sll(n) scanf(\"%lld\", &n)
#define pi(n) 0*printf(\"%d\\n\", n)
#define pll(n) 0*printf(\"%lld\\n\", n)
#define SET(container, value) memset(container, value, sizeof container)
#define MP make_pair
#define F first
#define S second

#define scan_all(...) __s(__VA_ARGS__)
template <typename Arg1>
void __s(Arg1&& arg1) {
  cin >> arg1;
}
template <typename Arg1, typename... Args>
void __s(Arg1&& arg1, Args&&... args) {
  cin >> arg1 ; __s(args...);
}

#define trace(...) __f(#__VA_ARGS__, __VA_ARGS__)
template <typename Arg1>
void __f(const char* name, Arg1&& arg1){
	cerr << name << \" : \" << arg1 << endl;
}
template<typename Arg1, typename... Args>
void __f(const char* names, Arg1&& arg1, Args&&... args){
	const char* comma = strchr(names+1, ',');
	cerr.write(names, comma-names) << \" : \" << arg1 << \" | \"; __f(comma+1, args...);
}

std::vector<std::string> tokenize(
				  const std::string& s,
				  const std::string& delims){
  std::vector<std::string> tokens;
  size_t offset = 0;

  while (true) {
    size_t nonDelim = s.find_first_not_of(delims, offset);

    if (nonDelim == std::string::npos) {
      break; // Nothing left.
    }

    size_t delim = s.find_first_of(delims, nonDelim);

    // Finish tokenizing if this is the last token,
    // or we've found enough tokens.
    if (delim == std::string::npos) {
      tokens.push_back(s.substr(nonDelim));
      break;
    }

    tokens.push_back(s.substr(nonDelim, delim - nonDelim));
    offset = delim;
  }

  return tokens;
}

int main(){
  ios_base::sync_with_stdio(false);
  cin.tie(NULL);
  return 0;
}"))



;; (require 'yasnippet)
;; (yas-global-mode 1)


(setq backup-directory-alist `(("." . "~/.saves")))
(ac-config-default)
