(defvar mu4e-installation-path (substitute-in-file-name "$PREFIX/share/emacs/site-lisp/mu4e/"))

(add-to-list 'load-path mu4e-installation-path)

(use-package mu4e)
