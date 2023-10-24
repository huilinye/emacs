


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

(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1)))
(global-set-key [f2] 'window-swap-states)

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

(display-line-numbers-mode t)

(tab-bar-mode t)

(add-to-list 'load-path' "/home/huilinye/emacs_tree/neotree")
(require 'neotree)

(add-to-list 'load-path "/home/huilinye/.emacs.d/themes/")
(require 'spacemacs-common)

(add-to-list 'custom-theme-load-path "/home/huilinye/.emacs.d/themes/")


;;(load-theme 'melancholy t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["chartreuse" "#f2241f" "chartreuse" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(custom-enabled-themes '(spacemacs-dark))
 '(custom-safe-themes
   '("008203114da3a15765d8f60fe65f3db8e7c6555a606f8513faaaf7054931336c" "f3bda80676fd51b83d79af8673c40c9466ba719d033a56dcb4cb6bfd75293959" "2f773cf89d6340c236cc14775f176a6bc560734869c313d6c70fe99525217c57" "01cc34dcce9a41856ffa80c7a683eaef37b97206e4fe7850d904341af565f28c" "4e5235891e0099933bd392fec6b60584bc40c526e7049f87104a83a742a087ef" "8f69c47ab6f4b091cd8612ed0c1f55bf73ceb7291074c0331c0afd01829bb82d" "ab94a0f996cceb9541309e82507e82b7592552b888448711dee99e304238d1e1" "0ce0ff7223713b7dfe8dbbe0df64ffef8133c404f9a5768155050de8f551a736" "da22e4e2f550d31faedba6763e4c6260ebfc47b2b5e1379dd736a26e83615c4d" "dd13a713ad3591a7fac7182fa213475a0e1d30a1ff1045a09d93714ddd0677cd" "24d78d5d9ee5d41005b0716df6daa41886336ad62120e28748dc2b0de22ce656" "ceab179d2c8aa8b72b2820dffec944baada9bd962707de3457f0c191ef8b0ce3" "66af53c4c1fb5a7576f2648e4fe319516531461689bfcfeb62e7151d6c6d230d" "25e94aa76521e66bc5e5ccbdb846a41fbaf8f1f43d2c221289d28de72922e86c" "c45faf7775edfc0eb9972f6bce4dfb3b153c8ebed7aaf64306988e0674e74b71" "443e2c3c4dd44510f0ea8247b438e834188dc1c6fb80785d83ad3628eadf9294" "1f292969fc19ba45fbc6542ed54e58ab5ad3dbe41b70d8cb2d1f85c22d07e518" "013728cb445c73763d13e39c0e3fd52c06eefe3fbd173a766bfd29c6d040f100" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "e1f4f0158cd5a01a9d96f1f7cdcca8d6724d7d33267623cc433fe1c196848554" "3de5c795291a145452aeb961b1151e63ef1cb9565e3cdbd10521582b5fd02e9a" "29b4f767c48da68f8f3c2bbf0dde2be58e4ed9c97e685af5a7ab7844f0d08b8b" "89d9dc6f4e9a024737fb8840259c5dd0a140fd440f5ed17b596be43a05d62e67" "7964b513f8a2bb14803e717e0ac0123f100fb92160dcf4a467f530868ebaae3e" "ffafb0e9f63935183713b204c11d22225008559fa62133a69848835f4f4a758c" "10e5d4cc0f67ed5cafac0f4252093d2119ee8b8cb449e7053273453c1a1eb7cc" "f64189544da6f16bab285747d04a92bd57c7e7813d8c24c30f382f087d460a33" "0c83e0b50946e39e237769ad368a08f2cd1c854ccbcd1a01d39fdce4d6f86478" "93011fe35859772a6766df8a4be817add8bfe105246173206478a0706f88b33d" "4b6cc3b60871e2f4f9a026a5c86df27905fb1b0e96277ff18a76a39ca53b82e1" "56044c5a9cc45b6ec45c0eb28df100d3f0a576f18eef33ff8ff5d32bac2d9700" "a9dc7790550dcdb88a23d9f81cc0333490529a20e160a8599a6ceaf1104192b5" "5f128efd37c6a87cd4ad8e8b7f2afaba425425524a68133ac0efd87291d05874" "9dccdccfeb236623d5c7cf0250a92308cf307afde4ebdaf173b59e8bbbae1828" "0d0936adf23bba16569c73876991168d0aed969d1e095c3f68d61f87dd7bab9a" "4fdbed4aa8bcb199d7f6a643886bac51178d1705b9b354ef3dd82d4ec48072d2" "88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e" "9f297216c88ca3f47e5f10f8bd884ab24ac5bc9d884f0f23589b0a46a608fe14" "5b9a45080feaedc7820894ebbfe4f8251e13b66654ac4394cb416fef9fdca789" "c5878086e65614424a84ad5c758b07e9edcf4c513e08a1c5b1533f313d1b17f1" "9013233028d9798f901e5e8efb31841c24c12444d3b6e92580080505d56fd392" "6adeb971e4d5fe32bee0d5b1302bc0dfd70d4b42bad61e1c346599a6dc9569b5" "00cec71d41047ebabeb310a325c365d5bc4b7fab0a681a2a108d32fb161b4006" "3cdd0a96236a9db4e903c01cb45c0c111eb1492313a65790adb894f9f1a33b2d" "e87fd8e24e82eb94d63b1a9c79abc8161d25de9f2f13b64014d3bf4b8db05e9a" "75b2a02e1e0313742f548d43003fcdc45106553af7283fb5fad74359e07fe0e2" "8d3ef5ff6273f2a552152c7febc40eabca26bae05bd12bc85062e2dc224cde9a" "b54376ec363568656d54578d28b95382854f62b74c32077821fdfd604268616a" "3fe1ebb870cc8a28e69763dde7b08c0f6b7e71cc310ffc3394622e5df6e4f0da" "f5f80dd6588e59cfc3ce2f11568ff8296717a938edd448a947f9823a4e282b66" "a9abd706a4183711ffcca0d6da3808ec0f59be0e8336868669dc3b10381afb6f" "8d8207a39e18e2cc95ebddf62f841442d36fcba01a2a9451773d4ed30b632443" "37b6695bae243145fa2dfb41440c204cd22833c25cd1993b0f258905b9e65577" "be84a2e5c70f991051d4aaf0f049fa11c172e5d784727e0b525565bb1533ec78" "b9761a2e568bee658e0ff723dd620d844172943eb5ec4053e2b199c59e0bcc22" "9d29a302302cce971d988eb51bd17c1d2be6cd68305710446f658958c0640f68" "2721b06afaf1769ef63f942bf3e977f208f517b187f2526f0e57c1bd4a000350" "da75eceab6bea9298e04ce5b4b07349f8c02da305734f7c0c8c6af7b5eaa9738" "f053f92735d6d238461da8512b9c071a5ce3b9d972501f7a5e6682a90bf29725" "ff24d14f5f7d355f47d53fd016565ed128bf3af30eb7ce8cae307ee4fe7f3fd0" "df6dfd55673f40364b1970440f0b0cb8ba7149282cf415b81aaad2d98b0f0290" "f4d1b183465f2d29b7a2e9dbe87ccc20598e79738e5d29fc52ec8fb8c576fcfd" "dc8285f7f4d86c0aebf1ea4b448842a6868553eded6f71d1de52f3dcbc960039" "c8b3d9364302b16318e0f231981e94cbe4806cb5cde5732c3e5c3e05e1472434" "38c0c668d8ac3841cb9608522ca116067177c92feeabc6f002a27249976d7434" "162201cf5b5899938cfaec99c8cb35a2f1bf0775fc9ccbf5e63130a1ea217213" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "9e1cf0f16477d0da814691c1b9add22d7cb34e0bb3334db7822424a449d20078" "a9eeab09d61fef94084a95f82557e147d9630fbbb82a837f971f83e66e21e5ad" "e14884c30d875c64f6a9cdd68fe87ef94385550cab4890182197b95d53a7cf40" "c1d5759fcb18b20fd95357dcd63ff90780283b14023422765d531330a3d3cec2" "70e7f094987e3c6226c54078dd986e11cab7246ea1c9e58a9907afa90f3c10c9" "dfb1c8b5bfa040b042b4ef660d0aab48ef2e89ee719a1f24a4629a0c5ed769e8" "02d422e5b99f54bd4516d4157060b874d14552fe613ea7047c4a5cfa1288cf4f" "8c7e832be864674c220f9a9361c851917a93f921fedb7717b1b5ece47690c098" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "badd1a5e20bd0c29f4fe863f3b480992c65ef1fa63951f59aa5d6b129a3f9c4c" "13096a9a6e75c7330c1bc500f30a8f4407bd618431c94aeab55c9855731a95e1" "6f96a9ece5fdd0d3e04daea6aa63e13be26b48717820aa7b5889c602764cf23a" "8b148cf8154d34917dfc794b5d0fe65f21e9155977a36a5985f89c09a9669aa0" "bf948e3f55a8cd1f420373410911d0a50be5a04a8886cabe8d8e471ad8fdba8e" "680f62b751481cc5b5b44aeab824e5683cf13792c006aeba1c25ce2d89826426" "a44e2d1636a0114c5e407a748841f6723ed442dc3a0ed086542dc71b92a87aee" "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b" "b1acc21dcb556407306eccd73f90eb7d69664380483b18496d9c5ccc5968ab43" "dccf4a8f1aaf5f24d2ab63af1aa75fd9d535c83377f8e26380162e888be0c6a9" "e4a702e262c3e3501dfe25091621fe12cd63c7845221687e36a79e17cf3a67e0" "c517e98fa036a0c21af481aadd2bdd6f44495be3d4ac2ce9d69201fcb2578533" "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69" "0140532278788c82af1f8e26c9a7967812a9ccdee3903f170e5a2e80eb771557" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(magit-remote-git-executable "/grid/common/pkgs/git/latest/bin/git")
 '(package-selected-packages '(##))
 '(tab-bar-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 181 :width normal)))))

(add-to-list 'load-path' "/home/huilinye/.emacs.d/elpa/")
(require 'smex)
(global-set-key (kbd "M-x") 'smex)

;;load company mode
(add-to-list 'load-path' "/home/huilinye/.emacs.d/company/")
(require 'company)

;;prepare dash for magit
(add-to-list 'load-path' "/home/huilinye/.emacs.d/dash/")
(require 'dash)

(add-to-list 'load-path' "/home/huilinye/.emacs.d/compat")
(require 'compat)

(add-to-list 'load-path' "/home/huilinye/.emacs.d/transient/lisp/")
(require 'transient)

(add-to-list 'load-path' "/home/huilinye/.emacs.d/with-editor/lisp/")
(require 'with-editor)

(add-to-list 'load-path' "/home/huilinye/.emacs.d/magit/lisp/")
(require 'magit)

(add-to-list 'load-path' "/home/huilinye/.emacs.d/htmlize")
(require 'htmlize)

(add-to-list 'load-path' "/home/huilinye/.emacs.d/which-key")
(require 'which-key)
(which-key-mode)

(add-to-list 'load-path' "/home/huilinye/.emacs.d/popup_key")
(require 'popup-keys)

(add-to-list 'load-path' "/home/huilinye/.emacs.d/xcscope")
(require 'xcscope)
(cscope-setup)

;;(add-to-list 'load-path' "/home/huilinye/.emacs.d/emacs-async")

;;(add-to-list 'load-path' "/home/huilinye/.emacs.d/helm")
;;(require 'helm)
;;(require 'helm-autoloads)

(setq org-src-fontify-natively t)

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
