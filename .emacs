

;;===========================================================================================
;;Setup for lsp-mode
;;===========================================================================================
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(setq package-selected-packages '(lsp-mode yasnippet lsp-treemacs helm-lsp
    projectile hydra flycheck company avy which-key helm-xref dap-mode))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

;; sample `helm' configuration use https://github.com/emacs-helm/helm/ for details
(helm-mode)
(require 'helm-xref)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)

(which-key-mode)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)  ;; clangd is fast

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode))

(use-package lsp-mode
  :commands lsp
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (define-key lsp-mode-map (kbd "C-c l") lsp-command-map)
  ;;(require 'lsp-clients)
  :hook (lsp-mode . lsp-enable-which-key-integration))

(setq helm-echo-input-in-header-line t)
;;====================================================================================
;;Setup keys
;;====================================================================================
;;duplicate line
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-set-key (kbd "M-z") 'duplicate-line)

;;copy line
(defun copy-line (arg)
      "Copy lines (as many as prefix argument) in the kill ring"
      (interactive "p")
      (kill-ring-save (line-beginning-position)
                      (line-beginning-position (+ 1 arg)))
      (message "%d line%s copied" arg (if (= 1 arg) "" "s")))
(global-set-key (kbd "M-n") 'copy-line)

;;manipulation of window switch
(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)

(global-set-key (kbd "C-x 9") 'other-frame)
(global-set-key (kbd "C-c u") 'toggle-frame-maximized)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "C-C s") 'window-swap-states)

(setq inhibit-startup-screen t)

;; Assume a .h file is C++
(setq auto-mode-alist
      (append '(("\\.\\(h\\|cu\\)$"  . c++-mode)) auto-mode-alist))
;; only indent with spaces
(setq-default indent-tabs-mode 'nil)
;; Change the C/C++ indentation amount to 4 spaces instead of 2.
(setq-default c-basic-offset 4)

(global-visual-line-mode t)

;;(display-line-numbers-mode t)
(tab-bar-mode t)

;;==============================================
;; setup themes and fonts
;;==============================================
(let ((default-directory  "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'custom-theme-load-path "/home/huilinye/.emacs.d/themes/")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;'(default ((t (:family "monospace" :weight normal :height 161 :width normal))))
 '(default ((t (:family "DejaVu Sans Mono" :weight normal :height 190 :width normal))))
 )
;; (set-face-attribute 'default nil
;;                     ;;:family "JetBrains Mono"
;;                     ;;:family "Source Code Pro"
;;                     :family "DejaVu Sans Mono"
;;                     ;;:family "SF Mono"
;;                     ;;:family "monospace"
;;                     ;;:family "Consolas"
;;                     ;;:family "Menlo"
;;                     ;;:family "Roboto Mono"
;;                     :height 180)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["chartreuse" "#f2241f" "chartreuse" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(custom-enabled-themes '(doom-snazzy))
 '(custom-safe-themes
   '("38f9bff83c479e859ff851a68c1d8b8d381a777cb059d3262c13cea8ad381a2f" default))
 '(tab-bar-mode t))

