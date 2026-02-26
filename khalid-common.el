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
  :vc (:url https://github.com/zevlg/telega.el :rev "ff06f58364375c96477561f265e3dbf55a8ad231")
  :init
  (setq telega-use-images nil)
  (setq telega-emoji-use-images nil)
  :config

  ;; (setq telega-tdlib-min-version "1.8.50")

  (setq telega-server-libs-prefix (get-prefix))

  ;; (setq telega-use-svg-base-uri nil)
  )


;; (use-package org-alert
;;   :config
;;   (org-alert-enable))


(setenv "PATH" (format "%s:%s" (expand-file-name "~/.local/bin/") (getenv "PATH")))

(push (expand-file-name "~/.local/bin/") exec-path)

(defun khalid/start-rdircd ()
  (start-process-shell-command "rdircd" "*rdircd log*" "proot-distro login --termux-home archlinux -- rdircd"))

(setq browse-url-elinks-wrapper nil)

(org-link-set-parameters
 "tel"
 :follow (lambda (number)
           (start-process-shell-command
            "termux-dial"
            nil
            (concat "am start -a android.intent.action.DIAL -d tel:" number))))

(defun org-contacts-dial-phone-at-point ()
  "Dial the phone number at point (preferring :TEL:, then :item1.TEL:) using Android's dialer via Termux."
  (interactive)
  (let* ((number (or (org-entry-get (point) "TEL")
                     (org-entry-get (point) "TEL;TYPE=\"voice,work\"")
                     (org-entry-get (point) "item1.TEL"))))
    (if number
        (start-process-shell-command
         "termux-dial"
         nil
         (concat "am start -a android.intent.action.DIAL -d tel:" (replace-regexp-in-string "[^+0-9*#]" "" number)))
      (message "No usable phone number property found at point!"))))

(defun org-contacts-dial-any-phone-at-point ()
  "Interactively dial any phone number on the current org-contacts entry using Termux's am command."
  (interactive)
  (let* ((all-props (org-entry-properties (point)))
         (tel-props
          (seq-filter
           (lambda (prop)
             (or (string-match-p "\\`TEL" (car prop))          ; TEL, TEL;TYPE=...
                 (string-match-p "\\`item[0-9]+\\.TEL\\'" (car prop)))) ; item1.TEL, etc.
           all-props))
         (choices
          (mapcar (lambda (prop)
                    (cons (format "%s: %s" (car prop) (cdr prop)) (cdr prop)))
                  tel-props)))
    (cond
     ((null choices)
      (message "No phone number found in properties at point!"))
     ((= 1 (length choices))
      (org-contacts--dial-number (cdar choices)))
     (t
      (let ((choice (completing-read "Choose number: " (mapcar #'car choices) nil t)))
        (org-contacts--dial-number (cdr (assoc choice choices))))))))

(defun org-contacts--dial-number (number)
  "Dial NUMBER using Android's dialer via Termux. Cleans for Tel URI."
  (let* ((cleaned (replace-regexp-in-string "[^+0-9*#]" "" number)))
    (start-process-shell-command
     "termux-dial" nil
     (concat "am start -a android.intent.action.DIAL -d tel:" cleaned))))
