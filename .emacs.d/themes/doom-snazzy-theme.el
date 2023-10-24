;;; doom-snazzy-theme.el --- inspired by Hyper Snazzy -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added: July 30, 2019 (#313)
;; Author: ar1a <https://github.com/ar1a>
;; Maintainer:
;; Source: https://github.com/sindresorhus/hyper-snazzy
;;
;;; Commentary:
;;; Code:

(require 'doom-themes)

;; Compiler pacifier
(defvar modeline-bg)


;;
;;; Variables

(defgroup doom-snazzy-theme nil
  "Options for the `doom-snazzy' theme."
  :group 'doom-themes)


;;
;;; Theme definition

(def-doom-theme doom-snazzy
  "A dark theme inspired by Atom Snazzy Dark"

  ;; name        default   256       16
  ((bg         '("#282a36" "#282a36" nil          )) ;; this is the background for the hl-line, modeline, and minibuffer
   (bg-alt     '("#242631" "#242631" nil          )) ;; this is the background for the line you arent currently on
   (base0      '("#282a36" "#282a36" "black"      ))
   (base1      '("#34353e" "#34353e" "brightblack"))
   (base2      '("#43454f" "#43454f" "brightblack"))
   (base3      '("#78787e" "#78787e" "brightblack"))
   (base4      '("#a5a5a9" "#a5a5a9" "brightblack"))
   (base5      '("#e2e4e5" "#e2e4e5" "brightblack"))
   (base6      '("#eff0eb" "#eff0eb" "brightblack"))
   (base7      '("#f1f1f0" "#f1f1f0" "brightblack"))
   (base8      '("#ff5c57" "#ff5c57" "white"      ))
   (fg         '("#f9f9f9" "#f9f9f9" "white"      ))
   (fg-alt     '("#d1d1d1" "#d1d1d1" "brightwhite"))

   (ui0 '("#848688" "#848688" "grey"))
   (ui1 '("#606580" "#606580" "grey"))
   (ui2 '("#3a3d4d" "#3a3d4d" "grey"))
   (ui3 '("#1c1e27" "#1c1e27" "black"))

   (grey       ui0)
   (red        '("#ff5c57" "#ff5c57" "red"          ))
   (green      '("#5af78e" "#5af78e" "brightred"    ))
   (yellow     '("#f3f99d" "#f3f99d" "green"        ))
   (blue       '("#57c7ff" "#57c7ff" "brightgreen"  ))
   (dark-blue  '("#459fcc" "#459fcc" "yellow"       ))
   (magenta    '("#ff6ac1" "#ff6ac1" "brightblue"   ))
   (cyan       '("#9aedfe" "#9aedfe" "blue"         ))
   (violet     '("#bd93f9" "#bd93f9" "magenta"      ))
   (orange     '("#ffb86c" "#ffb86c" "brightmagenta"))
   (teal       '("#aad4d3" "#aad4d3" "brightcyan"   ))
   (dark-cyan  '("#82c9d7" "#82c9d7" "cyan"         ))
   (purple        '("#b362ff" "#b362ff" "magenta"))
   (light-green   '("#297d40" "#297d40" "lg"))
   (kw             '("#ed1f8d" "#ed1f8d" "k"))
   (va             '("#abf50c" "#abf50c" "va"))
   (modeline       '("#524a9f" "#524a9f" "ml"))

   (Klein_blue            '("#002FA7" "#002FA7" "k_blue"))
   (Hermes_orange         '("#D75F28" "#D75F28" "h_orange"))
   (Tiffny_blue           '("#81D8CF" "#81D8CF" "t_blue"))
   (Mars_green            '("#39855E" "#39855E" "m_green"))
   (Dike_brown            '("#432913" "#432913" "d_brown"))
   (Bohr_red              '("#5E0004" "#5E0004" "b_red"))
   (Pruss_blue            '("#0D3869" "#0D3869" "p_blue"))
   (self_yellow           '("#F7E14D" "#F7E14D" "s_yellow"))
   (Sete_yellow           '("#FF6347" "#FF6347" "st_yellow"))
   (Chinese_red           '("#D12C25" "#D12C25" "c_red"))



   ;; face categories -- required for all themes
   (highlight      blue) ;; when searching with (/) ?
   (vertical-bar   (doom-darken base1 0.1)) ; the bar that separates modeline and minibuffer?
   (selection      dark-blue)  ; for like company autocomplete and stuff
   (builtin        magenta)    ; saw this in company autocomplete if i moved my mouse
   ;; over it
   ;;(comments       light-green) ;; comments
   (comments       Mars_green) ;; comments
   (doc-comments (doom-lighten yellow 0.25)) ;; easy to test with elisp
   ;; documentation or git commit
   ;; first line thing
   ;; (constants      blue)
   ;; (functions      green)
   ;; (keywords       kw)
   ;; (methods        green) ;; wtf is the difference between this and function?
   ;; (operators      magenta)
   ;; (type           cyan)
   ;; (strings        yellow)
   (constants      blue)
   (functions      Tiffny_blue)
   (keywords       Chinese_red)
   (methods        Tiffny_blue) ;; wtf is the difference between this and function?
   (operators      magenta)
   (type           Hermes_orange)
   (strings        Sete_yellow)
   ;; (variables      (doom-lighten magenta 0.4))
   (variables      self_yellow)
   (numbers        Sete_yellow)
   (region         `(,(doom-lighten (car bg-alt) 0.15) ,@(doom-lighten (cdr base0) 0.35)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    yellow)
   (vc-added       green)
   (vc-deleted     red))


  ;;;; Base theme face overrides
  ((line-number :foreground ui2)
   (line-number-current-line :foreground fg)
   ;; i have no idea what im doing with the modeline
   ;;(mode-line :background (doom-darken bg-alt 0.15))
   (mode-line :background (doom-darken Pruss_blue 0.1))
   (mode-line-inactive :background (doom-darken bg-alt 0.1) :foreground base5)
   (tooltip :background (doom-darken bg-alt 0.2) :foreground fg)

   ;;;; doom-modeline
   (doom-modeline-bar :background highlight)
   ;;;; ivy-posframe
   (ivy-posframe-border :background ui3)
   ;;;; outline <built-in>
   ((outline-3 &override) :foreground dark-blue)
   ;;;; org <built-in>
   ((org-block &override) :background bg-alt)
   ((org-block-begin-line &override) :background bg-alt)
   ((org-block-end-line &override)   :background bg-alt)
   ;;;; rjsx-mode
   (rjsx-text :foreground fg)))

;;; doom-snazzy-theme.el ends here
