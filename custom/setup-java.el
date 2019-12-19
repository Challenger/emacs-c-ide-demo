
;; (use-package meghanada
;;   :bind
;;   (:map meghanada-mode-map
;;         (("C-M-o" . meghanada-optimize-import)
;;          ("C-M-t" . meghanada-import-all)
;;          )))

;; (defun my-java-meghanda-mode-hook ()
;;   (meghanada-mode)
;;   (flycheck-mode))

;; (add-hook 'java-mode-hook 'my-java-meghanda-mode-hook)

;; (add-to-list 'auto-mode-alist '("\\.gradle\\'" . groovy-mode))

(use-package projectile :ensure t)
(use-package yasnippet :ensure t)
(use-package lsp-mode :ensure t)
(use-package hydra :ensure t)
(use-package company-lsp :ensure t)
(use-package lsp-ui :ensure t)
(use-package lsp-java :ensure t :after lsp
  :config (add-hook 'java-mode-hook 'lsp))

(use-package dap-mode
  :ensure t :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

;; (use-package dap-java :after (lsp-java))

(provide 'setup-java)
