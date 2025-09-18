(setenv "PREFIX" "/data/data/com.termux/files/usr")

(defun conc-prefix (&rest path-parts)
  "Return path constructed from PREFIX environment variable and PATH-PARTS."
  (apply #'concat (getenv "PREFIX") path-parts))

(defvar termux-bin (conc-prefix "/bin"))

(setenv "PATH" (format "%s:%s" termux-bin (getenv "PATH")))

(push termux-bin exec-path)

;; Allow switching user-emacs-directory by reading an environment variable
;; (when-let ((new-dir (getenv "NEW_EMACS_DIR")))
;; (setq user-emacs-directory "~/spacemacs"))

(unless (string-equal user-emacs-directory "/data/data/org.gnu.emacs/files/.emacs.d/")
  (let ((alt-early-init (expand-file-name "early-init.el" user-emacs-directory)))
    (when (file-exists-p alt-early-init)
      (load alt-early-init nil 'nomessage))))
