;; Start the server at launch to support opening files
(server-start)


;; Set default font
(set-frame-font "JetBrains Mono")

;; Prepending the Bangla font in default fontset for Emacs to automatically choose it for Bangla text
(set-fontset-font "fontset-default" nil  "Noto Sans Bengali" nil 'prepend)


;; Use Bash as the default shell
(setq shell-file-name (conc-prefix "/bin/bash"))

(defun conc-env (var &rest path-parts)
  "Concatenate environment variable VAR with PATH-PARTS.
Example: (env-path \"PREFIX\" \"/bin/bash\") → \"/data/.../usr/bin/bash\""
  (apply #'concat (getenv var) path-parts))
;; Set value of the environment variable GIT_ASKPASS
(setenv "GIT_ASKPASS" (conc-env "HOME" "/.git-askpass"))

;; Use text mode by default for undefined file modes
(setq-default major-mode 'text-mode)

;; Because text-mode by default enables text-conversion-style, we don't need the following for Bangla phonetic keyboard or evil package
;;(setq overriding-text-conversion-style t)

;; A few customizable user options are initialized in complex ways, and these have to be set either via the customize interface or by using ‘customize-set-variable’/‘setopt’
(setopt tool-bar-position 'bottom)

;; Enable modifier bar for using modifier keys without keyboard
(modifier-bar-mode 1)

;; Enable visual-line-mode globally
(global-visual-line-mode t)
;; Enable visual-wrap-prefix-mode globally to indent wrapped lines
(global-visual-wrap-prefix-mode t)


;; Keep recent files list
(recentf-mode t)

;; Define a function to easily get the value of Termux path from $PREFIX
(defun get-prefix ()
    (getenv "PREFIX"))
(setq telega-server-libs-prefix (get-prefix))

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
     ("melpa-stable" . "https://stable.melpa.org/packages/")))
 '(package-selected-packages '(telega visual-fill-column))
 '(safe-local-variable-values '((eval setq truncate-lines t)))
 '(touch-screen-precision-scroll t)
 '(touch-screen-preview-select t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
