(use-package evil-collection
  :after evil
  :ensure t
  :config
  ;; (evil-collection-init)
  )

(use-package telega
  :defer t
  :init
  (setq telega-use-images nil))

(use-package mu4e
  :defer t
  :init
  )
