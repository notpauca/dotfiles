(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(load "~/.config/emacs/keys.el")

(global-display-line-numbers-mode 1)

;;Custom file
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

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


;; Spotify
(use-package counsel-spotify)

Spotify controls
(global-set-key (kbd "C-M-P") #'counsel-spotify-toggle-play-pause)
(global-set-key (kbd "C-M-N") #'counsel-spotify-next)
(global-set-key (kbd "C-M-B") #'counsel-spotify-previous)
