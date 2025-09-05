(setenv "PREFIX" "/data/data/com.termux/files/usr")

(defun conc-prefix (&rest path-parts)
  "Return path constructed from PREFIX environment variable and PATH-PARTS."
  (apply #'concat (getenv "PREFIX") path-parts))

(defvar termux-bin (conc-prefix "/bin"))

(setenv "PATH" (format "%s:%s" termux-bin (getenv "PATH")))

(push termux-bin exec-path)
