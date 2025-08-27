(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(ido-mode 1)
(ido-everywhere 1)

(setq-default tab-width 4
	      custom-file (concat user-emacs-directory "custom.el")
	      make-backups nil)

(when (file-exists-p custom-file)
  (load custom-file))

(when (file-exists-p key-file)
  (load key-file))

(use-package smex)
(global-set-key (kbd "M-x") 'smex)

(global-display-line-numbers-mode 1)

(add-to-list 'default-frame-alist '(font . "Jetbrains Mono-12"))

;; Melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)


(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (load-theme 'ample-flat t)))
    (load-theme 'ample-flat t))

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(alpha-background . 90))
(add-to-list 'default-frame-alist '(undecorated . t))

;; LSP
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c C-l")
  :config
  (lsp-enable-which-key-integration t))

;; Moving lines
(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (previous-line 2))

(defun move-line-down ()
  (interactive)
  (next-line 1)
  (transpose-lines 1)
  (previous-line 1))

(global-set-key [(control shift up)] 'move-line-up)
(global-set-key [(control shift down)] 'move-line-down)
