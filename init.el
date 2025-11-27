(add-to-list 'load-path "~/emacs-android")
(load "khalid-common")
(load "khalid-shared")


;; Use Fish as the default shell
(setq shell-file-name (conc-prefix "/bin/fish"))

;; (use-package goto-chg)
;; (use-package cl-lib)

;; (use-package evil
;;   :ensure t
;;   :init
;;   (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
;;   (setq evil-want-keybinding nil)
;;   :config
;;   (evil-mode 1))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-visited-interval 15)
 '(auto-save-visited-mode t)
 '(column-number-mode t)
 '(mode-line-compact 'long)
 '(mode-line-format
   '("%e" mode-line-front-space
     (:propertize
      ("" mode-line-mule-info mode-line-modified
       mode-line-window-dedicated)
      display (min-width (6.0)))
     mode-line-position mode-line-modes mode-line-frame-identification
     mode-line-buffer-identification "   "
     (project-mode-line project-mode-line-format) (vc-mode vc-mode)
     "  " mode-line-misc-info mode-line-end-spaces))
 '(mode-line-percent-position nil)
 '(mode-line-position-column-line-format '(" %l:%c"))
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("nongnu" . "https://elpa.nongnu.org/nongnu/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages '(evil gnu-elpa-keyring-update goto-chg telega))
 '(safe-local-variable-values '((eval setq truncate-lines t)))
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
