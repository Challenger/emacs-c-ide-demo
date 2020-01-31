(menu-bar-mode -1)
(tool-bar-mode -1)

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;; company
(use-package company
  :init
  (global-company-mode 1)
  (delete 'company-semantic company-backends))
;; (define-key c-mode-map  [(control tab)] 'company-complete)
;; (define-key c++-mode-map  [(control tab)] 'company-complete)

;; Package: projejctile
(use-package projectile
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching t))

;; Package zygospore
(use-package zygospore
  :bind (("C-x 1" . zygospore-toggle-delete-other-windows)
         ("RET" .   newline-and-indent)))

  ; automatically indent when press RET

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

(windmove-default-keybindings 'meta)
(global-set-key (kbd "ESC <left>")  'windmove-left)
(global-set-key (kbd "ESC <right>") 'windmove-right)
(global-set-key (kbd "ESC <up>")    'windmove-up)
(global-set-key (kbd "ESC <down>")  'windmove-down)

;; Package: golden-ratio
(use-package golden-ratio
  :config
  (golden-ratio-mode))

(winner-mode 1)

(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(if (eq system-type 'darwin) ;; mac specific settings
    (progn (setq mac-option-modifier 'control)
           (setq mac-control-modifier 'super)
           (setq mac-command-modifier 'meta)
           (setq insert-directory-program "/usr/local/bin/gls")
           (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
           (customize-set-variable 'menu-bar-mode t))
  (global-set-key (kbd "s-k") 'kill-this-buffer)
  (global-set-key (kbd "s-K") (lambda () "Close the current buffer and delete the window" (interactive) (progn (kill-this-buffer) (delete-window))))
  (customize-set-variable 'menu-bar-mode nil))

(global-set-key (kbd "<f5>") (lambda () "Push point in the global mark ring without activating region" (interactive) (push-mark (point) t nil)))
(global-set-key (kbd "<f6>") 'pop-global-mark)
(global-set-key (kbd "<f7>") (lambda () "Move cursor to last mark position of current buffer. Call this repeatedly will cycle all positions in `mark-ring'. URL `http://ergoemacs.org/emacs/emacs_jump_to_previous_position.html'" (interactive) (set-mark-command t)))
;; (global-set-key (kbd "<f7>") 'point-to-register)
(global-set-key (kbd "<f8>") 'register-to-point)

(global-set-key (kbd "<f9>") 'speedbar)

(defun er-copy-file-name-to-clipboard (&optional arg)
  "Copy the current buffer file name to the clipboard."
  (interactive "P")
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (if arg
                        (file-name-nondirectory (buffer-file-name))
                      (buffer-file-name)))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

(provide 'setup-general)
