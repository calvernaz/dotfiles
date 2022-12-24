;; .emacs
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
  (package-refresh-contents))

(unless (package-installed-p 'auto-complete)
  (package-install 'auto-complete))
(ac-config-default)
(use-package s)

(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; smartabs - spaces and tabs mix
(unless (package-installed-p 'smart-tabs-mode)
  (package-install 'smart-tabs-mode))
(smart-tabs-insinuate 'c 'javascript)

;; magit
(use-package magit)
(use-package magit-popup)

;; powerline
(use-package powerline)
(powerline-default-theme)

;; elixir
(unless (package-installed-p 'elixir-mode)
  (package-install 'elixir-mode))

;; go
(unless (package-installed-p 'go-mode)
  (package-install 'go-mode))
(unless (package-installed-p 'go-autocomplete)
  (package-install 'go-autocomplete))

(add-hook 'before-save-hook 'gofmt-before-save)

(defun go-mode-setup ()
  (setq compile-command "go build -v && go test -v && go vet && golint")
  (define-key (current-local-map) "\C-c\C-c" 'compile)
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (local-set-key (kbd "M-.") 'godef-jump))

(add-hook 'go-mode-hook 'go-mode-setup)

;; python
(unless (package-installed-p 'python-mode)
  (package-install 'python-mode))


;; javascript
(unless (package-installed-p 'js2-mode)
  (package-install 'js2-mode))

;; json-mode
(unless (package-installed-p 'json-mode)
  (package-install 'json-mode))

;; move-text
(unless (package-installed-p 'move-text)
	(package-install 'move-text))

(setq x-select-enable-clipboard t)
(define-key input-decode-map "\e\eOA" [(meta up)])
(define-key input-decode-map "\e\eOB" [(meta down)])

(blink-cursor-mode nil)
(global-set-key "\M-h"     'delete-trailing-whitespace)
(global-set-key "\M-g"     'goto-line)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key "\C-x\C-b" 'ibuffer)
(global-set-key "\C-cu"    'uncomment-region)
(global-set-key "\C-co"    'comment-region)
(global-set-key "\C-cf"    'hs-toggle-hiding)
(global-set-key "\C-hs"    'info-lookup-symbol)
(global-set-key [mouse-1]  'mouse-select-window)
(global-set-key "\C-ci"    'imenu)
(global-set-key "\C-@"     'set-mark-command)
(global-set-key "\M-w"     'kill-ring-save)
(global-set-key [M-up] 'move-text-up)
(global-set-key [M-down] 'move-text-down)

(global-unset-key [down-mouse-1])
(setq-default dired-listing-switches "-la")
(setq-default woman-topic-at-point nil)
(setq-default x-stretch-cursor 1)
(setq-default show-trailing-whitespace t)
(setq-default default-indicate-empty-lines t)
(setq-default tab-width 2)
(setq-default js-indent-level 2)
(setq indent-line-function 'insert-tab)
(setq-default fill-column 78)
(setq-default mouse-avoidance-nudge-dist 25)
(setq-default mouse-avoidance-nudge-var 5)
(setq-default mouse-avoidance-threshold 8)
(setq-default ispell-program-name "aspell")
(setq-default inhibit-startup-message 1)
(setq-default scroll-step 1)
(setq-default scroll-conservatively 1)
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq-default mouse-wheel-follow-mouse 1)
(setq-default sgml-set-face 1)
(setq-default save-abbrevs nil)
(setq-default auto-save-timeout 30)     ; autosave after 30 s idle
(setq-default default-major-mode 'text-mode)
(setq-default adaptive-fill-mode 1)
(setq-default mouse-yank-at-point t)
(setq-default sentence-end-double-space t)
(setq-default gdb-many-windows t)
(setq-default mouse-autoselect-window t)
(setq-default hs-isearch-open t)

(windmove-default-keybindings)
(global-set-key [select]  'windmove-up)
(setq-default windmove-wrap-around t)

(transient-mark-mode 1)
(delete-selection-mode 1)
(column-number-mode 1)
(show-paren-mode 1)
(auto-compression-mode 1)
(mouse-avoidance-mode 'exile)

(menu-bar-mode -1)
(require 'font-lock)
(global-font-lock-mode 1)
(setq font-lock-mode-maximum-decoration t)
(iswitchb-mode t)
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(fset 'yes-or-no-p 'y-or-n-p)

(setq-default load-path (cons "~/.emacs.d/elisp" load-path))
(setq alchemist-project-compile-when-needed t) ;; default nil


(define-key minibuffer-local-filename-completion-map (kbd "SPC")
  'minibuffer-complete-word)

(define-key minibuffer-local-must-match-filename-map (kbd "SPC")
  'minibuffer-complete-word)


(defadvice kill-region (before unix-werase activate compile)
  "When called interactively with no active region, delete a single word
    backwards instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (save-excursion (backward-word 1) (point)) (point)))))

(add-hook 'sql-mode-hook
          '(lambda ()
             (local-set-key [tab]     'tab-to-tab-stop)
             (sql-set-product         'ms)))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'sh-mode-hook
	  (lambda ()
	    (setq tab-width 2
		  sh-basic-offset 2
		  indent-tabs-mode t)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(add-log-always-start-new-record t)
 '(add-log-full-name "Cesar Alvernaz")
 '(auto-image-file-mode nil)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-safe-themes
	 (quote
		("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(ecb-options-version "2.32")
 '(js-indent-level 2 t)
 '(package-selected-packages
	 (quote
		(solarized-theme smart-mode-line-powerline-theme flycheck-yamllint protobuf-mode dockerfile-mode docker alchemist exec-path-from-shell flycheck markdown-mode yaml-mode smart-tabs-mode groovy-mode epl company batch-mode)))
 '(select-enable-clipboard t)
 '(sh-basic-offset 2)
 '(sh-indentation 2)
 '(show-paren-mode t)
 '(user-mail-address "calvernaz@weirdloop.org"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "#000000" :foreground "#aaaaaa" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :family "terminus"))))
 '(cursor ((t (:background "gold"))))
 '(fixed-pitch ((t (:family unspecified))))
 '(font-latex-verbatim-face ((t (:inherit font-latex-math-face :family unspecified))))
 '(highlight ((nil (:background "black"))))
 '(hl-line ((t (:background "#333333"))))
 '(mode-line ((t (:background "grey75" :foreground "#222222" :box (:line-width -1 :style released-button)))))
 '(variable-pitch ((t (:family unspecified)))))
(put 'upcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)
