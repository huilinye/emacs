
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

(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1)))
(global-set-key [f2] 'window-swap-states)

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;;(global-set-key (kbd "C-c C-c") 'comment-region)
;;(global-set-key (kbd "C-u C-c") 'uncomment-region)

;;(set-frame-font "Inconsolata 14" nil t)

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

;;(display-line-numbers-mode t)

(tab-bar-mode t)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(let ((default-directory  "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

(require 'smex)
(global-set-key (kbd "M-x") 'smex)

(require 'company)

(require 'dash)

(require 'compat)

(require 'transient)

(require 'with-editor)

(require 'magit)

(require 'htmlize)

(require 'which-key)
(which-key-mode)

(require 'popup-keys)

(require 'xcscope)
(cscope-setup)

;;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph    
    (defun unfill-paragraph (&optional region)
      "Takes a multi-line paragraph and makes it into a single line of text."
      (interactive (progn (barf-if-buffer-read-only) '(t)))
      (let ((fill-column (point-max))
            ;; This would override `fill-column' if it's an integer.
            (emacs-lisp-docstring-fill-column t))
        (fill-paragraph nil region)))
    
    ;; Handy key definition
    (define-key global-map "\M-Q" 'unfill-paragraph)



;;(add-to-list 'load-path' "/home/huilinye/.emacs.d/emacs-async")

;;(add-to-list 'load-path' "/home/huilinye/.emacs.d/helm")
;;(require 'helm)
;;(require 'helm-autoloads)

(setq org-src-fontify-natively t)

;;ido mode setup

(ido-mode 1)
(setq ido-separator "\n")
(defun bind-ido-keys ()
  "Keybindings for ido mode."
  (define-key ido-completion-map (kbd "<C-<>") 'ido-next-match) 
  (define-key ido-completion-map (kbd "<C->>")   'ido-prev-match))

(add-hook 'ido-setup-hook #'bind-ido-keys)
;; (setq htmlize-face-overrides
;;         '(;;font-lock-warning-face "black"
;;           ;;font-lock-function-name-face "red"
;;           font-lock-comment-face "darkgrey"
;;                                  ;;default (:foreground "black" :background "darkgrey")
;;                                  ))



(setq htmlize-use-rgb-map 'force)


;; font sizes
(global-set-key (kbd "s-=")
                (lambda ()
                  (interactive)
                  (let ((old-face-attribute (face-attribute 'default :height)))
                    (set-face-attribute 'default nil :height (+ old-face-attribute 10)))))

(global-set-key (kbd "s--")
                (lambda ()
                  (interactive)
                  (let ((old-face-attribute (face-attribute 'default :height)))
                    (set-face-attribute 'default nil :height (- old-face-attribute 10)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :weight bold :height 143 :width normal :foundry "PfEd" :slant normal)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(doom-snazzy))
 '(custom-safe-themes
   '("0c6de05198e006ffa2cc12a66d4583fe024a7720e6ff04959eab6365334a6ef1" default))
 '(tab-bar-mode t))
