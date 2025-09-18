;; Start the server at launch to support opening files
(server-start)


;; Set default font
(set-frame-font "JetBrains Mono")

;; Prepend the Bangla font in default fontset for Emacs to automatically choose it for Bangla text
;; (set-fontset-font "fontset-default" nil "Noto Sans Bengali" nil 'prepend)


;; Use text mode by default for undefined file modes instead of fundamental mode
(setq-default major-mode 'text-mode)

;; We need the following for Bangla phonetic keyboard or key event-dependent packages
;; (setq overriding-text-conversion-style t)

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

;; Uncomment the following to always display on-screen keyboard
;; (setq touch-screen-display-keyboard t)
