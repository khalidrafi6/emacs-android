(load "~/emacs-android/barebones.el")

(tool-bar-mode)


(when (display-graphic-p)

  (set-fontset-font t 'unicode "Symbols Nerd Font Mono" nil 'prepend)

  (dolist (font '("Noto Sans Arabic" "Noto Sans Bengali"))
    (set-fontset-font "fontset-default" nil font nil 'prepend))
  (setq use-default-font-for-symbols nil)

  (set-fontset-font t 'symbol "Symbola" nil 'prepend)

  (set-fontset-font t 'emoji "Noto Color Emoji" nil 'prepend)

  (message "Fontsets successfully set!")
  )

(setq touch-screen-preview-select t)


;; Add tab key to tool bar
(defun my-insert-tab-key ()
  "Insert TAB key, like pressing TAB in keyboard would."
  (interactive)
  (push ?\t unread-command-events))

(tool-bar-add-item "right-arrow" 'my-insert-tab-key 'my-tab-btn)
;;;;


;; (setq backup-directory-alist `(("." . "~/.saves/")))

(defun conc-env (var &rest path-parts)
  "Concatenate environment variable VAR with PATH-PARTS.
Example: (env-path \"PREFIX\" \"/bin/bash\") → \"/data/.../usr/bin/bash\""
  (apply #'concat (getenv var) path-parts))
;; Set value of the environment variable GIT_ASKPASS
(setenv "GIT_ASKPASS" (conc-env "HOME" "/.git-askpass"))

;; Define a function to easily get the value of Termux path from $PREFIX
(defun get-prefix ()
  (getenv "PREFIX"))

(when (featurep 'android)
  (add-to-list 'Info-directory-list (expand-file-name "~/info"))
  )

(setenv "EDITOR" "/data/data/org.gnu.emacs/lib/libemacsclient.so -c")

(use-package telega
  :defer t
  :init
  (setq telega-use-images nil)
  (setq telega-emoji-use-images nil)
  :config

  (setq telega-tdlib-min-version "1.8.50")

  (setq telega-server-libs-prefix (get-prefix))

  ;; (setq telega-use-svg-base-uri nil)
  )


(setenv "PATH" (format "%s:%s" (expand-file-name "~/.local/bin/") (getenv "PATH")))

(push (expand-file-name "~/.local/bin/") exec-path)
