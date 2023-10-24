
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)

(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1)))

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line


(setq inhibit-startup-screen t)


;; Assume a .h file is C++
(setq auto-mode-alist
      (append '(("\\.\\(h\\|cu\\)$"  . c++-mode)) auto-mode-alist))
;; only indent with spaces
(setq-default indent-tabs-mode 'nil)
;; Change the C/C++ indentation amount to 4 spaces instead of 2.
(setq-default c-basic-offset 4)

(global-visual-line-mode t)

(require 'dired-x)

(add-to-list 'load-path' "C:/Users/huilinye/AppData/Roaming/emacs_tree/neotree")
(require 'neotree)

(add-to-list 'load-path "C:/Users/huilinye/AppData/Roaming/.emacs.d/themes/")
(require 'spacemacs-common)

(add-to-list 'custom-theme-load-path "C:/Users/huilinye/AppData/Roaming/.emacs.d/themes/")

;;(load-theme 'melancholy t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(spacemacs-dark))
 '(custom-safe-themes
   '("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Courier New" :foundry "outline" :slant normal :weight normal :height 143 :width normal)))))

(add-to-list 'load-path' "C:/Users/huilinye/AppData/Roaming/.emacs.d/elpa/")
(require 'smex)
(global-set-key (kbd "M-x") 'smex)

;;load company mode
(add-to-list 'load-path' "C:/Users/huilinye/AppData/Roaming/.emacs.d/company/")
(require 'company)

;;prepare dash for magit
(add-to-list 'load-path' "C:/Users/huilinye/AppData/Roaming/.emacs.d/dash/")
(require 'dash)

(add-to-list 'load-path' "C:/Users/huilinye/AppData/Roaming/.emacs.d/compat")
(require 'compat)

(add-to-list 'load-path' "C:/Users/huilinye/AppData/Roaming/.emacs.d/transient/lisp/")
(require 'transient)

(add-to-list 'load-path' "C:/Users/huilinye/AppData/Roaming/.emacs.d/with-editor/lisp/")
(require 'with-editor)

;;(add-to-list 'load-path' "C:/Users/huilinye/AppData/Roaming/.emacs.d/magit/lisp/")
;;(require 'magit)
