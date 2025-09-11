(load "~/.emacs.d/barebones.el")

;; Add tab key to tool bar
(defun my-insert-tab-key ()
  "Insert TAB key, like pressing TAB in keyboard would."
  (interactive)
  (push ?\t unread-command-events))

;; Add to tool bar
(tool-bar-add-item "right-arrow" 'my-insert-tab-key 'my-tab-btn)


;; Use Bash as the default shell
(setq shell-file-name (conc-prefix "/bin/bash"))

(defun conc-env (var &rest path-parts)
  "Concatenate environment variable VAR with PATH-PARTS.
Example: (env-path \"PREFIX\" \"/bin/bash\") → \"/data/.../usr/bin/bash\""
  (apply #'concat (getenv var) path-parts))
;; Set value of the environment variable GIT_ASKPASS
(setenv "GIT_ASKPASS" (conc-env "HOME" "/.git-askpass"))

;; Define a function to easily get the value of Termux path from $PREFIX
(defun get-prefix ()
    (getenv "PREFIX"))

;; Configs for Telega, Emacs Telegram client
(with-eval-after-load 'telega
(setq telega-tdlib-min-version "1.8.50"))

(setq telega-server-libs-prefix (get-prefix))

(setq telega-use-images nil)

(setq telega-chat-bidi-display-reordering t)

;; To fix profile pics in Telega
;; (setq telega-use-svg-base-uri nil)

;; To fix emojis in Telega
;; (setq telega-emoji-use-images nil)


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
 '(package-selected-packages '(telega))
 '(safe-local-variable-values '((eval setq truncate-lines t)))
 '(touch-screen-precision-scroll t)
 '(touch-screen-preview-select t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
