
(use-package meghanada
  :bind
  (:map meghanada-mode-map
        (("C-M-o" . meghanada-optimize-import)
         ("C-M-t" . meghanada-import-all)
         )))

(defun my-java-meghanda-mode-hook ()
  (meghanada-mode)
  (flycheck-mode))

(add-hook 'java-mode-hook 'my-java-meghanda-mode-hook)

(add-to-list 'auto-mode-alist '("\\.gradle\\'" . groovy-mode))

(provide 'setup-java)
