(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path (concat default-directory ".emacs.d/custom"))

(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm)
  (require 'setup-helm-gtags))
;; (require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)
(require 'setup-projectile)
(require 'setup-java)
(require 'setup-js)
(require 'setup-ts)
(require 'setup-webmode)


;; function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-highlight-search t)
 '(calendar-date-style (quote european))
 '(calendar-latitude 55.0415)
 '(calendar-longitude 82.9346)
 '(calendar-week-start-day 1)
 '(company-dabbrev-downcase nil)
 '(compilation-ask-about-save nil)
 '(compilation-scroll-output (quote first-error))
 '(compile-command "make -s -j3")
 '(default-input-method "russian-computer")
 '(delete-selection-mode nil)
 '(display-time-24hr-format t)
 '(display-time-day-and-date t)
 '(display-time-mode t)
 '(menu-bar-mode nil)
 '(package-archive-priorities (quote (("gnu" . 90) ("melpa" . 50) ("melpa-stable" . 80))))
 '(package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")
     ("melpa-stable" . "https://stable.melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (wgrep color-theme-sanityinc-tomorrow markdown-mode dired-rainbow rainbow-mode groovy-imports company-ansible company-emacs-eclim flymake-yaml yaml-imenu yaml-mode wgrep-ag wgrep-helm ag meghanada duplicate-thing feature-mode gradle-mode groovy-mode helm-ag web-mode tide company-web company-tern xref-js2 js2-mode json-mode magit zygospore helm-gtags helm yasnippet ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent counsel-projectile company clean-aindent-mode anzu helm projectile smartparens comment-dwim-2 helm-projectile golden-ratio helm-swoop flymake-less less-css-mode)))
 '(projectile-other-file-alist
   (quote
    (("cpp" "h" "hpp" "ipp")
     ("ipp" "h" "hpp" "cpp")
     ("hpp" "h" "ipp" "cpp" "cc")
     ("cxx" "h" "hxx" "ixx")
     ("ixx" "h" "hxx" "cxx")
     ("hxx" "h" "ixx" "cxx")
     ("c" "h")
     ("m" "h")
     ("mm" "h")
     ("h" "c" "cc" "cpp" "ipp" "hpp" "cxx" "ixx" "hxx" "m" "mm")
     ("cc" "h" "hh" "hpp")
     ("hh" "cc")
     ("vert" "frag")
     ("frag" "vert")
     (nil "lock" "gpg")
     ("lock" "")
     ("gpg" "")
     ("java" "md" "html")
     ("md" "java")
     ("html" "java"))))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(show-paren-style (quote mixed)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono")))))
